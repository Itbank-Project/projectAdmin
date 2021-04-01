package com.itbank.calculate;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CalculateDTO {
//   CA_IDX             NOT NULL NUMBER       
//   CA_WEEK            NOT NULL VARCHAR2(20) 
//   CA_FIRSTDAY        NOT NULL DATE         
//   CA_LASTDAY         NOT NULL DATE         
//   CA_AD_ID           NOT NULL VARCHAR2(50) 
//   CA_DEPOSITDATE     NOT NULL DATE         
//   CA_RE_COUNT                 NUMBER       
//   CA_CANCEL_COUNT             NUMBER       
//   CA_RE_TOTALPAYMENT          NUMBER 
   
   private int ca_idx, ca_re_count, ca_cancel_count, ca_re_totalPayment;
   private String ca_week, ca_ad_id;

   private Date ca_firstDay, ca_lastDay, ca_deposiDate;
   
   private String ho_name, ad_id;
   private String yyyy, mm;
   
   
   
   public int getCa_idx() {
      return ca_idx;
   }
   public void setCa_idx(int ca_idx) {
      this.ca_idx = ca_idx;
   }
   public int getCa_re_count() {
      return ca_re_count;
   }
   public void setCa_re_count(int ca_re_count) {
      this.ca_re_count = ca_re_count;
   }
   public int getCa_cancel_count() {
      return ca_cancel_count;
   }
   public void setCa_cancel_count(int ca_cancel_count) {
      this.ca_cancel_count = ca_cancel_count;
   }
   public int getCa_re_totalPayment() {
      return ca_re_totalPayment;
   }
   public void setCa_re_totalPayment(int ca_re_totalPayment) {
      this.ca_re_totalPayment = ca_re_totalPayment;
   }
   public String getCa_week() {
      return ca_week;
   }
   public void setCa_week(String ca_week) {
      this.ca_week = ca_week;
   }
   public String getCa_ad_id() {
      return ca_ad_id;
   }
   public void setCa_ad_id(String ca_ad_id) {
      this.ca_ad_id = ca_ad_id;
   }
   public Date getCa_firstDay() {
      return ca_firstDay;
   }
   public void setCa_firstDay(Date ca_firstDay) {
      this.ca_firstDay = ca_firstDay;
   }
   public Date getCa_lastDay() {
      return ca_lastDay;
   }
   public void setCa_lastDay(Date ca_lastDay) {
      this.ca_lastDay = ca_lastDay;
   }
   public Date getCa_deposiDate() {
      return ca_deposiDate;
   }
   public void setCa_deposiDate(Date ca_deposiDate) {
      this.ca_deposiDate = ca_deposiDate;
   }
public String getHo_name() {
	return ho_name;
}
public void setHo_name(String ho_name) {
	this.ho_name = ho_name;
}
public String getAd_id() {
	return ad_id;
}
public void setAd_id(String ad_id) {
	this.ad_id = ad_id;
}
public String getYyyy() {
	return yyyy;
}
public void setYyyy(String yyyy) {
	this.yyyy = yyyy;
}
public String getMm() {
	return mm;
}
public void setMm(String mm) {
	this.mm = mm;
}
   
   
}