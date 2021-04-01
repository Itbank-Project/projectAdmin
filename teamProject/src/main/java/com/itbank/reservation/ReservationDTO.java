package com.itbank.reservation;

import java.util.Date;

public class ReservationDTO {

//	TABLE		 RESERVATION
//	RE_IDX           NOT NULL NUMBER       
//	RE_PAYDATE       NOT NULL DATE         
//	RE_INDATE        NOT NULL DATE         
//	RE_OUTDATE       NOT NULL DATE         
//	RE_DAYCOUNT      NOT NULL NUMBER       
//	RE_PAYMENT       NOT NULL NUMBER       
//	RE_CU_ID         NOT NULL VARCHAR2(50) 
//	RE_CHANGENAME             VARCHAR2(50) 
//	RE_CHANGEPNUM             VARCHAR2(50) 
//	RE_CANCELYESORNO NOT NULL VARCHAR2(20) 
//	RE_CANCELDATE             DATE         
//	RE_CALENDAR_FK   NOT NULL VARCHAR2(50) 
//	RE_RO_PK         NOT NULL VARCHAR2(20) 
	
	private int re_idx, re_daycount, re_payment;
	private Date re_paydate, re_indate, re_outdate, re_canceldate;
	private String re_cu_id, re_changeName, re_changePnum, re_cancelYesOrNo, re_calendar_fk, re_ro_pk,re_state;
	
	private String cu_name, ro_roomType;
	
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public int getRe_daycount() {
		return re_daycount;
	}
	public void setRe_daycount(int re_daycount) {
		this.re_daycount = re_daycount;
	}
	public int getRe_payment() {
		return re_payment;
	}
	public void setRe_payment(int re_payment) {
		this.re_payment = re_payment;
	}
	public Date getRe_paydate() {
		return re_paydate;
	}
	public void setRe_paydate(Date re_paydate) {
		this.re_paydate = re_paydate;
	}
	public Date getRe_indate() {
		return re_indate;
	}
	public void setRe_indate(Date re_indate) {
		this.re_indate = re_indate;
	}
	public Date getRe_outdate() {
		return re_outdate;
	}
	public void setRe_outdate(Date re_outdate) {
		this.re_outdate = re_outdate;
	}
	public String getRe_cu_id() {
		return re_cu_id;
	}
	public void setRe_cu_id(String re_cu_id) {
		this.re_cu_id = re_cu_id;
	}
	public String getRe_changeName() {
		return re_changeName;
	}
	public void setRe_changeName(String re_changeName) {
		this.re_changeName = re_changeName;
	}
	public String getRe_changePnum() {
		return re_changePnum;
	}
	public void setRe_changePnum(String re_changePnum) {
		this.re_changePnum = re_changePnum;
	}
	public String getRe_cancelYesOrNo() {
		return re_cancelYesOrNo;
	}
	public void setRe_cancelYesOrNo(String re_cancelYesOrNo) {
		this.re_cancelYesOrNo = re_cancelYesOrNo;
	}
	public String getRe_calendar_fk() {
		return re_calendar_fk;
	}
	public void setRe_calendar_fk(String re_calendar_fk) {
		this.re_calendar_fk = re_calendar_fk;
	}
	public String getRe_ro_pk() {
		return re_ro_pk;
	}
	public void setRe_ro_pk(String re_ro_pk) {
		this.re_ro_pk = re_ro_pk;
	}
	public String getCu_name() {
		return cu_name;
	}
	public void setCu_name(String cu_name) {
		this.cu_name = cu_name;
	}
	public String getRo_roomType() {
		return ro_roomType;
	}
	public void setRo_roomType(String ro_roomType) {
		this.ro_roomType = ro_roomType;
	}
	public Date getRe_canceldate() {
		return re_canceldate;
	}
	public void setRe_canceldate(Date re_canceldate) {
		this.re_canceldate = re_canceldate;
	}
	public String getRe_state() {
		return re_state;
	}
	public void setRe_state(String re_state) {
		this.re_state = re_state;
	}
}
