package kr.co.warebridge.calendar.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.warebridge.vo.EmployeeVO;

@Mapper
public interface CalendarDepartmentDAO {
	public String selectDPT1Name(EmployeeVO realUser);
	public String selectDPT2Name(EmployeeVO realUser);
}
