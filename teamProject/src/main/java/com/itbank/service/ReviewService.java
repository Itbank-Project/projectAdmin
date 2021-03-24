package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.review.ReviewDAO;
import com.itbank.review.ReviewDTO;

@Service
public class ReviewService {

	@Autowired private ReviewDAO dao;

	// 해당 호텔의 리뷰리스트 불러오기
	public List<ReviewDTO> getReviewList(String ad_id) {
		return dao.selectReviewList(ad_id);
	}

	// 리뷰 전체 갯수
	public int getCountAll(String ad_id) {
		return dao.selectCountAll(ad_id);
	}

	// 리뷰 만족 갯수
	public int getGoodCount(String ad_id) {
		return dao.selectGoodCount(ad_id);
	}
}
