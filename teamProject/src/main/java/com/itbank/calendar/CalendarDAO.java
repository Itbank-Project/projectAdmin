package com.itbank.calendar;

import java.util.HashMap;
import java.util.List;

public interface CalendarDAO {

	// 객실타입에 따른 캘린더 
//	CalendarDTO getList(String ro_pk);
	List<CalendarDTO> getList(HashMap<String, Object> map);

	// 캘린더추가
	int insertCalendar(CalendarDTO dto);

}
