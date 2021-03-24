package com.itbank.review;

import java.util.List;

public interface ReviewDAO {

	List<ReviewDTO> selectReviewList(String ad_id);

	int selectCountAll(String ad_id);

	int selectGoodCount(String ad_id);

}
