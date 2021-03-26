package com.itbank.calendar;

public class CalendarDTO {

//	TABLE		   CALENDAR
//	CALENDAR_PK    NOT NULL VARCHAR2(50) 
//	CALENDAR_COUNT NOT NULL NUMBER       
//	CALENDAR_PRICE NOT NULL NUMBER       
//	CALENDAR_DATE  NOT NULL DATE         
//	CALENDAR_RO_PK NOT NULL VARCHAR2(50) 
	
	private String calendar_pk, calendar_ro_pk;
	private int calendar_count, calendar_price;
	private String calendar_date;
	
	private String yy;
	private String mm;
	private String dd;
	
	public String getCalendar_pk() {
		return calendar_pk;
	}
	public void setCalendar_pk(String calendar_pk) {
		this.calendar_pk = calendar_pk;
	}
	public String getCalendar_ro_pk() {
		return calendar_ro_pk;
	}
	public void setCalendar_ro_pk(String calendar_ro_pk) {
		this.calendar_ro_pk = calendar_ro_pk;
	}
	public int getCalendar_count() {
		return calendar_count;
	}
	public void setCalendar_count(int calendar_count) {
		this.calendar_count = calendar_count;
	}
	public int getCalendar_price() {
		return calendar_price;
	}
	public void setCalendar_price(int calendar_price) {
		this.calendar_price = calendar_price;
	}
	public String getCalendar_date() {
		return calendar_date;
	}
	public void setCalendar_date(String calendar_date) {
		this.calendar_date = calendar_date;
	}
	public String getYy() {
		return yy;
	}
	public void setYy(String yy) {
		this.yy = yy;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	public String getDd() {
		return dd;
	}
	public void setDd(String dd) {
		this.dd = dd;
	}
	
}
