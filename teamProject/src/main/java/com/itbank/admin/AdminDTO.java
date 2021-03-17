package com.itbank.admin;

public class AdminDTO {

//	AD_IDX     NOT NULL NUMBER        
//	AD_ID      NOT NULL VARCHAR2(100) 
//	AD_PW      NOT NULL VARCHAR2(500) 
//	AD_NAME    NOT NULL VARCHAR2(100) 
//	AD_PNUM    NOT NULL VARCHAR2(200) 
//	AD_MAIL    NOT NULL VARCHAR2(100) 
//	AD_ACCOUNT NOT NULL VARCHAR2(200) 
//	AC_BANK    NOT NULL VARCHAR2(20)
	
	private int ad_idx;
	private String ad_id, ad_pw, ad_name, ad_pnum, ad_email, ad_account, ad_bank;
	
	public int getAd_idx() {
		return ad_idx;
	}
	public void setAd_idx(int ad_idx) {
		this.ad_idx = ad_idx;
	}
	public String getAd_id() {
		return ad_id;
	}
	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}
	public String getAd_pw() {
		return ad_pw;
	}
	public void setAd_pw(String ad_pw) {
		this.ad_pw = ad_pw;
	}
	public String getAd_name() {
		return ad_name;
	}
	public void setAd_name(String ad_name) {
		this.ad_name = ad_name;
	}
	public String getAd_pnum() {
		return ad_pnum;
	}
	public void setAd_pnum(String ad_pnum) {
		this.ad_pnum = ad_pnum;
	}
	public String getAd_email() {
		return ad_email;
	}
	public void setAd_email(String ad_email) {
		this.ad_email = ad_email;
	}
	public String getAd_account() {
		return ad_account;
	}
	public void setAd_account(String ad_account) {
		this.ad_account = ad_account;
	}
	public String getAd_bank() {
		return ad_bank;
	}
	public void setAd_bank(String ad_bank) {
		this.ad_bank = ad_bank;
	}
	
	
	
	
	
}
