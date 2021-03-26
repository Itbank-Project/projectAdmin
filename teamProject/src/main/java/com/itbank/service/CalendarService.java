package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.calendar.CalendarDAO;
import com.itbank.calendar.CalendarDTO;

@Service
public class CalendarService {

	@Autowired private CalendarDAO dao;
	
	public CalendarDTO getList(String ro_pk) {
		return dao.getList(ro_pk);
	}

	public int insertCal(CalendarDTO dto) {
		return dao.insertCalendar(dto);
	}

}
