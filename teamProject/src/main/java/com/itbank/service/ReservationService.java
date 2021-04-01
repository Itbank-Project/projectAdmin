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

	// 예약확인버튼 누르면 yes로 변경
	public int updateState(int re_idx) {
		System.out.println("서비스 : " + re_idx);
		return dao.updateState(re_idx);
	}

}
