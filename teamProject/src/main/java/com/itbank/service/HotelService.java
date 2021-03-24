package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.hotel.HotelDAO;
import com.itbank.hotel.HotelDTO;

@Service
public class HotelService {

	@Autowired private HotelDAO dao;
	
	public int insertHotel(HotelDTO dto) {
		System.out.println(dto.getHo_address());
		return dao.insertHotel(dto);
	}

	public HotelDTO selectHotel(String ad_id) {
		System.out.println("서비스 컨트롤러 : " + ad_id);
		return dao.selectHotel(ad_id);
	}

	public int modifiHotel(HotelDTO dto) {
		
		return dao.modifiHotel(dto);
	}



}
