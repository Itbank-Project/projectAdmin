package com.itbank.controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.admin.AdminDTO;
import com.itbank.reservation.ReservationDTO;
import com.itbank.service.MailService;
import com.itbank.service.MessageService;
import com.itbank.service.ReservationService;

@RestController
public class ReservationAjaxController {

	@Autowired ReservationService reservationService;
	@Autowired MailService mailService;
	@Autowired MessageService messageService;
	
	@PutMapping(value = "status/{re_idx}/{cal_pk}/", consumes="application/json;charset=utf8")
	public int updateStatus(@PathVariable HashMap<String, String> map, HttpSession session) {
		

		// 예약문자 보내기 위한 정보들
		AdminDTO dto = (AdminDTO) session.getAttribute("login");
		String ad_pnum = dto.getAd_pnum();
		String re_idx = map.get("re_idx");

		ReservationDTO reservationDTO = reservationService.getResevation(re_idx);
		String cu_pnum = reservationDTO.getCu_pnum();
		String cu_name = reservationDTO.getCu_name();
		String ho_name = reservationDTO.getRe_calendar_pk().split("-")[1];
		String ro_roomtype = reservationDTO.getRe_calendar_pk().split("-")[2];
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String re_indate = transFormat.format(reservationDTO.getRe_indate());
		String re_outdate = transFormat.format(reservationDTO.getRe_outdate());
		String re_payment =Integer.toString(reservationDTO.getRe_payment());

		String body = "";

		// 사용자가 취소했을 경우(취소완료 문자보내기)
		if(re_payment.equals("0")) {
			body ="[%s]\n"
				+ "취소 및 환불처리가 완료되었습니다.";
			body = String.format(body, ho_name);
		}
		
		else {
			body = "[%s]\n\n"
					+ "체크인 : %s\n"
					+ "체크아웃 : %s\n"
					+ "예약자 이름 : %s\n"
					+ "객실 타입 : %s\n"
					+ "결제 금액 : %s원\n\n"
					+ "예약확인이 완료되었습니다.";
			
			body = String.format(body, ho_name,re_indate,re_outdate,cu_name,ro_roomtype,re_payment);
		}
		
		System.out.println(body);
		
		
		// 예약확인상태 변경
		int row = reservationService.updateState(re_idx);
		if(row == 1) {	// 변경 성공하면
			int update = reservationService.updateCount(map);	// 해당 객실 수량 -1

			// 예약확인 문자보내기
//			messageService.sendMessage(ad_pnum,cu_pnum,body);
			return update;
		}
		return row;
	}
}
