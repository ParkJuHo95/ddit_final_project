package kr.co.warebridge.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.EmployeeVO;
import kr.co.warebridge.vo.schedule.ScheduleVO;
@Mapper
public interface CalendarDAO {
	public ScheduleVO selectUserSchedule(String id);
	public List<ScheduleVO> selectUserScheduleList(String user);
	public List<ScheduleVO> selectTeam1ScheduleList(String Team);
	public List<ScheduleVO> selectTeam2ScheduleList(String Team);
	public List<ScheduleVO> selectCompanyScheduleList(String company);
	public List<ScheduleVO> selectTodayList(EmployeeVO realUser);
	
	public int insertRepetition(ScheduleVO calendar);
	public int insertSchedule(ScheduleVO calendar);
	public int updateSchedule(ScheduleVO calendar);
	public int deleteSchedule(String id);
}
