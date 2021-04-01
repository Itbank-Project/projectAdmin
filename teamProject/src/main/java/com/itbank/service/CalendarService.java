package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.calendar.CalendarDAO;
import com.itbank.calendar.CalendarDTO;

@Service
public class CalendarService {

	@Autowired private CalendarDAO dao;
	
//	public CalendarDTO getList(String ro_pk) {
//		return dao.getList(ro_pk);
//	}
	public List<CalendarDTO> getList(HashMap<String, Object> map) {
		return dao.getList(map);
	}

	public int updateCal(CalendarDTO dto) {
		return dao.updateCalendar(dto);
	}

	// 캘린더 값
	public List<CalendarDTO> getCalendar(String ho_name) {
		return dao.selectCalList(ho_name);
	}

}
