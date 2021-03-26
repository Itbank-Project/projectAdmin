package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.calendar.CalendarDAO;
import com.itbank.calendar.CalendarDTO;

@Service
public class CalendarService {

	@Autowired private CalendarDAO dao;
	
	public List<CalendarDTO> getList() {
		return dao.getList();
	}

}
