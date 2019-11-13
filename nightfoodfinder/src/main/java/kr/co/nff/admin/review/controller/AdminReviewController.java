package kr.co.nff.admin.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.nff.admin.review.controller.AdminReviewController")
@RequestMapping("/admin/review")
public class AdminReviewController {
	

	//리뷰 목록
	@RequestMapping("/reviewlist.do")
	public void reviewList() {}
	
	//리뷰 상세
	@RequestMapping("/reviewdetail.do")
	public void reviewDetail() {}
	
	//리뷰 삭제
	@RequestMapping("/reviewban.do")
	public void reviewDelete() {}
	
	
}

