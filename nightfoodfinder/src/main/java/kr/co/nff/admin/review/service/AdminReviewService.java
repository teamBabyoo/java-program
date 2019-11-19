package kr.co.nff.admin.review.service;

import java.util.List;


import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.SearchRe;



public interface AdminReviewService {

	List<Review> listReview(SearchRe search);
	int GetListCnt(SearchRe search);

}
