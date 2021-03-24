package com.itbank.hotel;

public interface HotelDAO {

	int insertHotel(HotelDTO dto);

	HotelDTO selectHotel(String ad_id);

	int modifiHotel(HotelDTO dto);


}
