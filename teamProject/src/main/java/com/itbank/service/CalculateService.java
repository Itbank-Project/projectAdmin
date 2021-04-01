package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.calculate.CalculateDAO;
import com.itbank.calculate.CalculateDTO;

@Service
public class CalculateService {

	@Autowired CalculateDAO calculateDAO;
   
	public int autoCalculate() {
		List<CalculateDTO> map = calculateDAO.selectHotels();
      
      for(CalculateDTO vo : map) {
    	  calculateDAO.insertCal(vo);
    	  System.out.println("가능");
      }
      return 1;
   }
	
	public List<CalculateDTO> selectCalcList(HashMap<String, Object> map) {
      return calculateDAO.selectCalcList(map);
   }
}