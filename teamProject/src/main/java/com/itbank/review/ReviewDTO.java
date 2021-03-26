package com.itbank.review;

import java.util.Date;

public class ReviewDTO {
	
//	TABLE			 REVIEW
//	REVIEW_IDX       NOT NULL NUMBER        
//	REVIEW_CREDATE   NOT NULL DATE          
//	REVIEW_SCORE     NOT NULL NUMBER        
//	REVIEW_OPINION   NOT NULL VARCHAR2(500) 
//	REVIEW_RE_IDX    NOT NULL NUMBER        
//	REVIEW_CU_ID     NOT NULL VARCHAR2(50)  
//	REVIEW_GOODORBAD NOT NULL VARCHAR2(50) 

	private int review_idx, review_score, review_re_idx;
	private Date review_credate;
	private String review_opinion, review_cu_id, review_goodORbad;
	
	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public int getReview_re_idx() {
		return review_re_idx;
	}
	public void setReview_re_idx(int review_re_idx) {
		this.review_re_idx = review_re_idx;
	}
	public Date getReview_credate() {
		return review_credate;
	}
	public void setReview_credate(Date review_credate) {
		this.review_credate = review_credate;
	}
	public String getReview_opinion() {
		return review_opinion;
	}
	public void setReview_opinion(String review_opinion) {
		this.review_opinion = review_opinion;
	}
	public String getReview_cu_id() {
		return review_cu_id;
	}
	public void setReview_cu_id(String review_cu_id) {
		this.review_cu_id = review_cu_id;
	}
	public String getReview_goodORbad() {
		return review_goodORbad;
	}
	public void setReview_goodORbad(String review_goodORbad) {
		this.review_goodORbad = review_goodORbad;
	}
	
}
