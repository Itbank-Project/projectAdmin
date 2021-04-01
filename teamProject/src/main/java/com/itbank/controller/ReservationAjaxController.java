package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.ReservationService;

@RestController
public class ReservationAjaxController {

	@Autowired ReservationService reservationService;
	
	@PutMapping(value = "status/{re_idx}", consumes="application/json;charset=utf8")
	public int updateStatus(@PathVariable int re_idx) {
		System.out.println(re_idx);
		int row = reservationService.updateState(re_idx);
		System.out.println(row);
		return row;
	}
}
