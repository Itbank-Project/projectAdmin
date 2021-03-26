package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.room.RoomDAO;
import com.itbank.room.RoomDTO;

@Service
public class RoomService {
	
	@Autowired private RoomDAO dao;


	public int insertRoom(RoomDTO dto) {
		return dao.insertRoom(dto);
	}


	public List<RoomDTO> getList() {
		return dao.getList();
	}

}
