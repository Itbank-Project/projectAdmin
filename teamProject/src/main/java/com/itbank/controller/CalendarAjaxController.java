package com.itbank.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.calendar.CalendarDTO;
import com.itbank.service.CalendarService;

@RestController
public class CalendarAjaxController {

	@Autowired private CalendarService cs;

	// 객실정보 수정하기
	@PutMapping(value = "/roomStatus", consumes = "application/json;charset=utf8")
	public int roomStatus(@RequestBody CalendarDTO dto) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd"); 
		String date = sdf.format(dto.getCalendar_date());
		
		dto.setCalendar_pk(date + "-" + dto.getCalendar_pk());
		int row = cs.updateCal(dto);
		
		return row;
	}
	
	
}
