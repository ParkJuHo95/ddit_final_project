package kr.co.warebridge.calendar;

import java.time.LocalDateTime;

import kr.co.warebridge.vo.schedule.ScheduleVO;

public class ScheduleVOEvent extends AbstractEvent<ScheduleVO> {
	public ScheduleVOEvent(ScheduleVO Schedule) {
		super(Schedule);
	}
	
	@Override
	public String getId() {
		return getExtendedProps().getScheduleId(); 
	}

	@Override
	public String getGroupId() {
		return null;
	}

	@Override
	public boolean isAllDay() {
		return false;
	}

	@Override
	public LocalDateTime getStart() {
		return getExtendedProps().getScheduleStartDat();
	}

	@Override
	public LocalDateTime getEnd() {
		return getExtendedProps().getScheduleEndDat();
	}

	@Override
	public String getStartStr() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getEndStr() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTitle() {
		return getExtendedProps().getScheduleName();
	}

	@Override
	public String getBackgroundColor() {
		String type = getExtendedProps().getScheduleType();
		if(type.equals("D1")) return "#99FF99";
		if(type.equals("D2")) return "#9999FF";
		if(type.equals("C")) return "#CC99FF";
		if(type.equals("E")) return "#FFCC99";
		return null;
	}

	@Override
	public String getBorderColor() {
		String type = getExtendedProps().getScheduleType();
		if(type.equals("D1")) return "#99FF99";
		if(type.equals("D2")) return "#9999FF";
		if(type.equals("C")) return "#CC99FF";
		if(type.equals("E")) return "#FFCC99";
		return null;
	}

	@Override
	public String getRole() {
		String type = getExtendedProps().getScheduleType();
		if(type.equals("D1")) return "ROLE_TEAM";
		if(type.equals("D2")) return "ROLE_TEAM";
		if(type.equals("C")) return "ROLE_ADMIN";
		if(type.equals("E")) return "ROLE_USER";
		return null;
	}
	
	@Override
	public String getEmpNo() {
		return getExtendedProps().getEmpNo();
	}
}
