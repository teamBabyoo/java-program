package kr.co.nff.admin.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.review.service.AdminReviewService;


@Controller("kr.co.nff.admin.review.controller.AdminReviewController")
@RequestMapping("/admin/review")
public class AdminReviewController {
	
	@Autowired
	private AdminReviewService service;

	//리뷰 목록
	@RequestMapping("/reviewlist.do")
	public void reviewList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listReview());
	}
	

	
	
}

