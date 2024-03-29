package kr.co.warebridge.calendar.service;

import java.time.LocalDate;
import java.util.List;

import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;

public interface CalendarService {
	public List<ScheduleVO> retrieveScheduleList(EmployeeVO realuser ,String who);
	public List<ScheduleVO> retrieveTodayList(EmployeeVO realUser);
	public ScheduleVO retrieveSchedule(String id);
	public int createSchedule(ScheduleVO calendar,EmployeeVO realUser);  
	public int modifySchedule(ScheduleVO calendar,EmployeeVO realUser);
	public int removeSchedule(String id);
	public List<String> selectDPTName(EmployeeVO realuser);
}
