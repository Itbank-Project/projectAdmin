package com.itbank.calendar;

import java.util.HashMap;
import java.util.List;

public interface CalendarDAO {

	// 객실타입에 따른 캘린더 
	List<CalendarDTO> getList(HashMap<String, Object> map);

	// 캘린더추가
	int updateCalendar(CalendarDTO dto);

	// 캘린더 값 다 뽀ㅃ아내기!!
	List<CalendarDTO> selectCalList(String ho_name);

}
