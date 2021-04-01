package com.itbank.calculate;

import java.util.HashMap;
import java.util.List;

public interface CalculateDAO {

   int insertCal(CalculateDTO map);

   List<CalculateDTO> selectHotels();

   List<CalculateDTO> selectCalcList(HashMap<String, Object> map);

}