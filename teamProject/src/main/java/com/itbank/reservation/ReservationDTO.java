package com.itbank.reservation;

import java.util.Date;

public class ReservationDTO {
//	RE_IDX           NOT NULL NUMBER       
//	RE_PAYDATE       NOT NULL DATE         
//	RE_INDATE        NOT NULL DATE         
//	RE_OUTDATE       NOT NULL DATE         
//	RE_DAYCOUNT      NOT NULL NUMBER       
//	RE_PAYMENT       NOT NULL NUMBER       
//	RE_RO_IDX        NOT NULL NUMBER       
//	RE_CU_ID         NOT NULL VARCHAR2(50) 
//	RE_CHANGENAME             VARCHAR2(50) 
//	RE_CHANGEPNUM             VARCHAR2(50) 
//	RE_CANCELYESORNO NOT NULL VARCHAR2(20) 
//	RE_CANCELDATE             DATE 
	
	private int re_idx, re_dayCount,re_payment,re_ro_idx;
	private Date re_payDate, re_inDate, outDate, re_cancelDate;
	private String re_cu_id, re_changeName, re_changePnum,re_cancelYesOrNo;
	
	// 예약목록 불러오기위해 필요한 컬럼
	private String cu_name, ro_roomType;
	
	public int getRe_idx() {
		return re_idx;
	}
	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}
	public int getRe_dayCount() {
		return re_dayCount;
	}
	public void setRe_dayCount(int re_dayCount) {
		this.re_dayCount = re_dayCount;
	}
	public int getRe_payment() {
		return re_payment;
	}
	public void setRe_payment(int re_payment) {
		this.re_payment = re_payment;
	}
	public int getRe_ro_idx() {
		return re_ro_idx;
	}
	public void setRe_ro_idx(int re_ro_idx) {
		this.re_ro_idx = re_ro_idx;
	}
	public Date getRe_payDate() {
		return re_payDate;
	}
	public void setRe_payDate(Date re_payDate) {
		this.re_payDate = re_payDate;
	}
	public Date getRe_inDate() {
		return re_inDate;
	}
	public void setRe_inDate(Date re_inDate) {
		this.re_inDate = re_inDate;
	}
	public Date getOutDate() {
		return outDate;
	}
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	public Date getRe_cancelDate() {
		return re_cancelDate;
	}
	public void setRe_cancelDate(Date re_cancelDate) {
		this.re_cancelDate = re_cancelDate;
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
}
