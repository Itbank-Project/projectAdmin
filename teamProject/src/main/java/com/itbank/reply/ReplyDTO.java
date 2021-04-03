package com.itbank.reply;

import java.util.Date;

public class ReplyDTO {

//	TABLE			 REPLY
//	REPLY_IDX        NOT NULL NUMBER        
//	REPLY_OPINION    NOT NULL VARCHAR2(500) 
//	REPLY_HO_NAME    NOT NULL VARCHAR2(50)  
//	REPLY_REVIEW_IDX NOT NULL NUMBER        
//	REPLY_CREDATE    NOT NULL DATE  
	
	private int reply_idx, reply_review_idx;
	private String reply_opinion, reply_ho_name;
	private Date reply_credate;
	
	public int getReply_idx() {
		return reply_idx;
	}
	public void setReply_idx(int reply_idx) {
		this.reply_idx = reply_idx;
	}
	public int getReply_review_idx() {
		return reply_review_idx;
	}
	public void setReply_review_idx(int reply_review_idx) {
		this.reply_review_idx = reply_review_idx;
	}
	public String getReply_opinion() {
		return reply_opinion;
	}
	public void setReply_opinion(String reply_opinion) {
		this.reply_opinion = reply_opinion;
	}
	public String getReply_ho_name() {
		return reply_ho_name;
	}
	public void setReply_ho_name(String reply_ho_name) {
		this.reply_ho_name = reply_ho_name;
	}
	public Date getReply_credate() {
		return reply_credate;
	}
	public void setReply_credate(Date reply_credate) {
		this.reply_credate = reply_credate;
	}
	
}
