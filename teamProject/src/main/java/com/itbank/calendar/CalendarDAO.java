package com.itbank.calendar;


public interface CalendarDAO {

	// 객실타입에 따른 캘린더 
	CalendarDTO getList(String ro_pk);

	// 캘린더추가
	int insertCalendar(CalendarDTO dto);

}
