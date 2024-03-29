package kr.co.warebridge.calendar.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.warebridge.calendar.dao.CalendarDAO;
import kr.co.warebridge.calendar.dao.CalendarDepartmentDAO;
import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Inject
	private CalendarDAO dao;
	@Inject
	private CalendarDepartmentDAO Ddao;
	
	@Override
	public List<ScheduleVO> retrieveScheduleList(EmployeeVO realUser, String who) {
		List<ScheduleVO> result = null;
		if(who.equals("E")) {
			result = dao.selectUserScheduleList(realUser.getEmpNo());
		} else if(who.equals("D1")) {
			result = dao.selectTeam1ScheduleList(realUser.getEmpDptId1());
		} else if(who.equals("D2")) {
			result = dao.selectTeam2ScheduleList(realUser.getEmpDptId2());
		} else if(who.equals("C")) {
			result = dao.selectCompanyScheduleList(realUser.getEmpCmpId());
		} else {
			throw new RuntimeException();
		}
		return result;
	}
	
	@Override
	public List<ScheduleVO> retrieveTodayList(EmployeeVO realUser) {
		return dao.selectTodayList(realUser);
	}
	
	
	@Override
	public int createSchedule(ScheduleVO schedule, EmployeeVO realUser) {
		
		schedule.setEmpCmpId(realUser.getEmpCmpId());
		schedule.setEmpNo(realUser.getEmpNo());
		String type = schedule.getScheduleType();
		
		if(type == "D2") {
			schedule.setEmpDpt(realUser.getEmpDptId2());
		} else {
			schedule.setEmpDpt(realUser.getEmpDptId1());
		}
		
		int result = 0;
		
		Long repetitionTerm = schedule.getRepetitionTerm();
		LocalDate repetitionEndDate = schedule.getRepetitionEndDate();
		
		if(repetitionTerm != null && repetitionEndDate != null) {
			
			int multiply = 1;
			boolean flag = true;

			int result1 = dao.insertRepetition(schedule);
			
			int result2 = dao.insertSchedule(schedule);
			
			if(result1 == 0 || result2 == 0 ) flag = false;
			
			if(flag) {
				do {
					ScheduleVO nextSchedule = copyVO(schedule);
					LocalDateTime strTime = schedule.getScheduleStartDat();
					LocalDateTime endTime = schedule.getScheduleEndDat();
					
					LocalDateTime nextStrTime = strTime.plusDays(repetitionTerm * multiply);
					LocalDateTime nextEndTime = endTime.plusDays(repetitionTerm * multiply);
					
					nextSchedule.setScheduleStartDat(nextStrTime);
					nextSchedule.setScheduleEndDat(nextEndTime);
					
					result = dao.insertSchedule(nextSchedule);
					
					multiply++;
					
					if(result == 0 ) break;
					
					if(nextStrTime.toLocalDate().compareTo(repetitionEndDate) > 0 ) flag = false;
					
				} while(flag);
			}
		} else {
			result = dao.insertSchedule(schedule);
		}
		return result;
	}

	@Override
	public int modifySchedule(ScheduleVO calendar,EmployeeVO realUser) {
		calendar.setEmpNo(realUser.getEmpNo());
		calendar.setEmpCmpId(realUser.getEmpCmpId());
		String type = calendar.getScheduleType();
		
		if(type == "D2") {
			calendar.setEmpDpt(realUser.getEmpDptId2());
		} else {
			calendar.setEmpDpt(realUser.getEmpDptId1());
		}
		
		return dao.updateSchedule(calendar);
	}

	@Override
	public int removeSchedule(String id) {
		return dao.deleteSchedule(id);
	}

	@Override
	public List<String> selectDPTName(EmployeeVO realuser) {
		List<String> dptList = new ArrayList<String>();
		String dpt1Name = Ddao.selectDPT1Name(realuser);
		dptList.add(dpt1Name);
		if(realuser.getEmpDptId2() != null) {
			String dpt2Name = Ddao.selectDPT2Name(realuser);
			dptList.add(dpt2Name);
		}
		return dptList;
	}

	@Override
	public ScheduleVO retrieveSchedule(String id) {
		return dao.selectUserSchedule(id);
	}

	
	
	
	
	
	public ScheduleVO copyVO(ScheduleVO vo) {
		ScheduleVO newVO = new ScheduleVO();
		newVO.setScheduleName(vo.getScheduleName());
		newVO.setScheduleStartDat(vo.getScheduleStartDat());
		newVO.setScheduleEndDat(vo.getScheduleEndDat());
		newVO.setScheduleContents(vo.getScheduleContents());
		newVO.setScheduleType(vo.getScheduleType());
		newVO.setAlarmAlternative(vo.getAlarmAlternative());
		newVO.setScheduleParticipant(vo.getScheduleParticipant());
		newVO.setEmpNo(vo.getEmpNo());
		newVO.setEmpDpt(vo.getEmpDpt());
		newVO.setEmpCmpId(vo.getEmpCmpId());
		newVO.setRepetitionId(vo.getRepetitionId());
		newVO.setRepetitionTerm(vo.getRepetitionTerm());
		newVO.setRepetitionEndDate(vo.getRepetitionEndDate());
		return newVO;
	}



}
