package kr.co.nff.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.nff.store.controller.StoreController")
@RequestMapping("/store")
public class StoreController {
	
	/* 가게 목록 */
	@RequestMapping("/list.do")
	public void list() {}
	
	/* 가게 상세 */
	@RequestMapping("/detail.do")
	public void detail() {}
	
	/* 리뷰 목록 */
	@RequestMapping("/reviewList.do")
	public void reviewList() {}
	
	/* 리뷰 작성 */
	@RequestMapping("/reviewWrite.do")
	public String reviewWrite() {
		return "redirect:detail.do";
	}
	
	@RequestMapping("/reviewWriteForm.do")
	public void reviewWriteForm() {}
	
	/* 리뷰 상세 */
	@RequestMapping("/reviewDetail.do")
	public void reviewDetail() {}
	
	/* 리뷰 삭제 */
	@RequestMapping("/reviewDelete.do")
	public String reviewDelete() {
		return "redirect:reviewList.do";
	}
	
	/* 리뷰 답글작성 */
	@RequestMapping("/reviewCommentWrite.do")
	public String reviewCommentWrite() {
		return "redirect:detail.do";
	}
	
	@RequestMapping("/reviewCommentWriteForm.do")
	public void reviewCommentWriteForm() {}
	
	/* 리뷰 답글삭제 */
	@RequestMapping("/reviewCommentDelete.do")
	public String reviewCommentDelete() {
		return "redirect:reviewDetail.do";
	}
	
	/* 단골 등록 */
	@RequestMapping("/regularRegist.do")
	public String regularRegist() {
		return "redirect:detail.do";
	}
	
	/* 단골 취소 */
	@RequestMapping("/regularCancel.do")
	public String regularCancel() {
		return "redirect:detail.do";
	}
	
}
