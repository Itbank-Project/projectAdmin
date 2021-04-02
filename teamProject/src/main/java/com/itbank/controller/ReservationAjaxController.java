package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.MailService;
import com.itbank.service.ReservationService;

@RestController
public class ReservationAjaxController {

	@Autowired ReservationService reservationService;
	@Autowired MailService mailService;
	
	@PutMapping(value = "status/{re_idx}/{cal_pk}/", consumes="application/json;charset=utf8")
	public int updateStatus(@PathVariable HashMap<String, String> map) {
		
		String re_idx = map.get("re_idx");

		// 예약확인상태 변경
		int row = reservationService.updateState(re_idx);
		if(row == 1) {	// 변경 성공하면
			int update = reservationService.updateCount(map);	// 해당 객실 수량 -1
			return update;
			
			// 메일 미구현
//			String mailAddress = reservationService.getEmail(re_idx);
//			mailService.authMail(mailAddress, re_idx, session);
		}
		return row;
	}
}
