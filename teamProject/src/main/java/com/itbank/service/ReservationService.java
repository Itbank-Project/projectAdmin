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
	public int updateState(String re_idx) {
		return dao.updateState(re_idx);
	}

	// 해당 객실 수량 -1 
	public int updateCount(HashMap<String, String> map) {
		return dao.updateCount(map);
	}

	// 예약확인 문자보내기 위해 필요한 정보
	public ReservationDTO getResevation(String re_idx) {
		return dao.selectReservation(re_idx);
	}

	// 예약 취소버튼
	public int updateCancelCheck(HashMap<String, Object> map) {
		return dao.updateCancel(map);
	}

}
