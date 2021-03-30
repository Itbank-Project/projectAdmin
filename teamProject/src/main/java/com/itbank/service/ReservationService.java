package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.reservation.ReservationDAO;
import com.itbank.reservation.ReservationDTO;

@Service
public class ReservationService {

	@Autowired private ReservationDAO dao;

	// 예약목록불러오기
	public List<ReservationDTO> getReservationList(HashMap<String, Object> map) {
		return dao.selectList(map);
	}

	// 예약취소갯수
	public String getCancelCount(HashMap<String, Object> map) {
		return dao.selectCancelCount(map);
	}

	// 예약완료된 갯수
	public String getReservationCount(HashMap<String, Object> map) {
		return dao.selectReservationCount(map);
	}

}
