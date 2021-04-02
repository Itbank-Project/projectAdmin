package com.itbank.reservation;

import java.util.HashMap;
import java.util.List;

public interface ReservationDAO {

	List<ReservationDTO> selectList(HashMap<String, Object> map);

	String selectCancelCount(HashMap<String, Object> map);

	String selectReservationCount(HashMap<String, Object> map);

	int updateState(String re_idx);

	String selectEmail(int re_idx);

	int updateCount(HashMap<String, String> map);


}
