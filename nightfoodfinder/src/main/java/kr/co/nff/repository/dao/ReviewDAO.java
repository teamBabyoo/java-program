package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.ReportReview;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;

public interface ReviewDAO {
	// 관리자 전체리뷰
	List<Review> selectReview(Search search);
	int pagingGetListCnt(Search search);
	void blockReview(Review review);
	// 관리자 신고리뷰
	List<Review> selectReportReview(Search search);
	int pagingReportGetCnt(Search search);
//	List<ReportReview> selectReportDetail(int no);
}
