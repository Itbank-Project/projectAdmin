package com.itbank.hotel;

public class HotelDTO {

	
//	이름             널?       유형            
//			-------------- -------- ------------- 
//			HO_IDX         NOT NULL NUMBER        
//			HO_NAME        NOT NULL VARCHAR2(100) 
//			HO_PNUM        NOT NULL VARCHAR2(200) 
//			HO_ADDRESS     NOT NULL VARCHAR2(300) 
//			HO_CHECK_IN    NOT NULL VARCHAR2(50)  
//			HO_CHECK_OUT   NOT NULL VARCHAR2(50)  
//			HO_DESCRIPTION NOT NULL VARCHAR2(20)  
//			HO_PIC         NOT NULL VARCHAR2(50)  
//			HO_ADMIN       NOT NULL NUMBER        
//			HO_PARKING              VARCHAR2(50)  
//			HO_WIFI                 VARCHAR2(50)  
//			HO_PC                   VARCHAR2(50)  
//			HO_BREAKFAST            VARCHAR2(50)  
//			HO_SMOKE                VARCHAR2(50)  
//			HO_POOL                 VARCHAR2(50)  

	
	private int ho_idx;
	public String getHo_ad_id() {
		return ho_ad_id;
	}
	public void setHo_ad_id(String ho_ad_id) {
		this.ho_ad_id = ho_ad_id;
	}
	private String ho_name, ho_pnum, ho_address, ho_check_in, ho_check_out,ho_description, ho_uploadfile;
	private String ho_ad_id, ho_parking, ho_wifi, ho_pc, ho_breakfast, ho_smoke, ho_pool;
	
	public int getHo_idx() {
		return ho_idx;
	}
	public void setHo_idx(int ho_idx) {
		this.ho_idx = ho_idx;
	}
	public String getHo_name() {
		return ho_name;
	}
	public void setHo_name(String ho_name) {
		this.ho_name = ho_name;
	}
	public String getHo_pnum() {
		return ho_pnum;
	}
	public void setHo_pnum(String ho_pnum) {
		this.ho_pnum = ho_pnum;
	}
	public String getHo_address() {
		return ho_address;
	}
	public void setHo_address(String ho_address) {
		this.ho_address = ho_address;
	}
	public String getHo_check_in() {
		return ho_check_in;
	}
	public void setHo_check_in(String ho_check_in) {
		this.ho_check_in = ho_check_in;
	}
	public String getHo_check_out() {
		return ho_check_out;
	}
	public void setHo_check_out(String ho_check_out) {
		this.ho_check_out = ho_check_out;
	}
	public String getHo_description() {
		return ho_description;
	}
	public void setHo_description(String ho_description) {
		this.ho_description = ho_description;
	}
	public String getHo_uploadfile() {
		return ho_uploadfile;
	}
	public void setHo_uploadfile(String ho_uploadfile) {
		this.ho_uploadfile = ho_uploadfile;
	}
	public String getHo_parking() {
		return ho_parking;
	}
	public void setHo_parking(String ho_parking) {
		this.ho_parking = ho_parking;
	}
	public String getHo_wifi() {
		return ho_wifi;
	}
	public void setHo_wifi(String ho_wifi) {
		this.ho_wifi = ho_wifi;
	}
	public String getHo_pc() {
		return ho_pc;
	}
	public void setHo_pc(String ho_pc) {
		this.ho_pc = ho_pc;
	}
	public String getHo_breakfast() {
		return ho_breakfast;
	}
	public void setHo_breakfast(String ho_breakfast) {
		this.ho_breakfast = ho_breakfast;
	}
	public String getHo_smoke() {
		return ho_smoke;
	}
	public void setHo_smoke(String ho_smoke) {
		this.ho_smoke = ho_smoke;
	}
	public String getHo_pool() {
		return ho_pool;
	}
	public void setHo_pool(String ho_pool) {
		this.ho_pool = ho_pool;
	}
	
	
	
}
