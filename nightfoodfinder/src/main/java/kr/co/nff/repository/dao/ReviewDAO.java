package kr.co.nff.repository.dao;

import java.util.List;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;

public interface ReviewDAO {
	List<Review> selectReview(Search search);
	int pagingGetListCnt(Search search);
	void blockReview(Review review);
	List<Review> selectReportReview();
}
