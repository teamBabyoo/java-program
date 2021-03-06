package kr.co.nff.admin.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.ReviewDAO;
import kr.co.nff.repository.vo.Pagination;
import kr.co.nff.repository.vo.ReportReview;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;



@Service("kr.co.nff.admin.review.service.AdminReviewServiceImpl")
public class AdminReviewServiceImpl implements AdminReviewService {

	@Autowired
	private ReviewDAO dao;
	
	public List<Review> listReview(Search search) {
		return dao.selectReview(search);
	}

	public int getListCnt(Search search) {
		return dao.pagingGetListCnt(search);
	}
	
	public void blockReview(Review review) {
		dao.blockReview(review);	
	}
	
	public List<Review> listReportedReview(Search search) {
		return dao.selectReportReview(search);
	}
	
	public int ReportGetCnt(Search search) {
		return dao.pagingReportGetCnt(search);
	}
	
	public Map<String, Object> reportDetail(ReportReview report) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", dao.selectReportDetail(report));
		map.put("paginationtwo", new Pagination(report.getPage(), dao.reportModalGetPage(report.getReviewNo())));
		return map;
	} 
}
