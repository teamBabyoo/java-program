package kr.co.nff.admin.review.controller;

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

	// 리뷰 목록
	@RequestMapping("/reviewlist.do")
	public void reviewList(
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "nickName") String searchType,
			@RequestParam(required = false) String keyword, 
			Model model) 
		{

		
		Search search = new Search();
		search.setType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = service.getListCnt(search);
				
		search.pageInfo(page, range, listCnt);
	
		model.addAttribute("pagination", search);
		model.addAttribute("list", service.listReview(search));
		
	}
	
	@RequestMapping("/block.do")
	public String block(Review review) {
		service.blockReview(review);
		return "redirect:reviewList.do";
		
	}


}
