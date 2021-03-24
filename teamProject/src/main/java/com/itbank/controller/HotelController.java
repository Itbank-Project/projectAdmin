package com.itbank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.hotel.HotelDTO;
import com.itbank.service.HotelService;
@RestController
public class HotelController {

	
	@Autowired private HotelService hs;

	
}
