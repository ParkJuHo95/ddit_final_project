package kr.co.warebridge.rental.controller;

import java.time.LocalDateTime;

import kr.co.warebridge.calendar.AbstractEvent;
import kr.co.warebridge.vo.BookVO;

public class BookVOEvent extends AbstractEvent<BookVO>{

	public BookVOEvent(BookVO extendedProps) {
		super(extendedProps);
	}

	@Override
	public String getId() {
		return getExtendedProps().getBookCode();
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
		return getExtendedProps().getBookStart();
	}

	@Override
	public LocalDateTime getEnd() {
		return getExtendedProps().getBookEnd();
	}

	@Override
	public String getStartStr() {
		return null;
	}

	@Override
	public String getEndStr() {
		return null;
	}

	@Override
	public String getTitle() {
		return getExtendedProps().getEmpNo();
	}

	@Override
	public String getBackgroundColor() {
		return "skyblue";
	}

	@Override
	public String getBorderColor() {
		return "white";
	}

	@Override
	public String getRole() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getEmpNo() {
		// TODO Auto-generated method stub
		return null;
	}

}
