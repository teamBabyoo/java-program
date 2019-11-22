package kr.co.nff.admin.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.review.service.AdminReviewService;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;

@Controller("kr.co.nff.admin.review.controller.AdminReviewController")
@RequestMapping("/admin/review")
public class AdminReviewController {

	@Autowired
	private AdminReviewService service;

	// 리뷰 목록 불러오기(검색, 페이징 같이)
	@RequestMapping("/reviewlist.do")
	public void reviewList(
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "nickName") String searchType,
			@RequestParam(required = false) String keyword, Model model) {

		Search search = new Search();
		search.setType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCnt = service.getListCnt(search);

		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("list", service.listReview(search));

	}

	// 체크박스로 리뷰 차단하기, 차단 풀기
	@RequestMapping("/block.do")
	public void blockAjax(Review review) {
		service.blockReview(review);
	}

	// 신고리뷰 목록 불러오기
	@RequestMapping("/reportedreviewlist.do")
	public void reportedreviewlist(Model model) {
		model.addAttribute("list", service.listReportedReview());
	}
}
