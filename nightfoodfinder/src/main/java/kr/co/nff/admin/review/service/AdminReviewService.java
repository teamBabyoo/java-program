package kr.co.nff.admin.review.service;

import java.util.List;


import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;



public interface AdminReviewService {

	List<Review> listReview(Search search);
	int getListCnt(Search search);
	void blockReview(Review review);
	List<Review> listReportedReview();
}
