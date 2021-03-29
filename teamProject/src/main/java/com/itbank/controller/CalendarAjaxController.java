package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.calendar.CalendarDTO;
import com.itbank.service.CalendarService;

@RestController
public class CalendarAjaxController {

	@Autowired private CalendarService cs;

	@PostMapping(value = "/roomStatus", consumes = "application/json;charset=utf8")
	public int roomStatus(@RequestBody CalendarDTO dto) {
//		ModelAndView mav = new ModelAndView("roomStatus");
		System.out.println("??");
		System.out.println(dto.getCalendar_count());
		System.out.println(dto.getCalendar_ro_pk());
		System.out.println(dto.getCalendar_pk());
		System.out.println(dto.getCalendar_price());
		System.out.println(dto.getCalendar_date());
		
		String ro_pk = dto.getCalendar_ro_pk();
		
		dto.setCalendar_pk(dto.getCalendar_date() + "(" + ro_pk + ")");
		System.out.println(dto.getCalendar_pk());
		int row = cs.insertCal(dto);
		return row;
	}
	
	
}
