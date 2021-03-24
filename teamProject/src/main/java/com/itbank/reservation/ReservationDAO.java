package com.itbank.reservation;

import java.util.HashMap;
import java.util.List;

public interface ReservationDAO {

	List<ReservationDTO> selectList(HashMap<String, Object> map);

	String selectCancleCount(HashMap<String, Object> map);

	String selectReservationCount(HashMap<String, Object> map);


}
