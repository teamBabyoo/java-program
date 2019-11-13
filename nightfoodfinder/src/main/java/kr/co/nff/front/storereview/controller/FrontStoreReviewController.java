package kr.co.nff.front.storereview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.nff.front.storereview.controller.FrontStoreReviewController")
@RequestMapping("/front/storereview")
public class FrontStoreReviewController {
	
	
	/* 리뷰 목록 */
	@RequestMapping("/reviewlist.do")
	public void reviewList() {}
	
	/* 리뷰 작성 */
	@RequestMapping("/reviewwrite.do")
	public void reviewWrite() {}
	
	/* 리뷰 수정 */
	@RequestMapping("/reviewupdate.do")
	public void reviewUpdate() {}
	
	
	/* 리뷰 삭제 */
	@RequestMapping("/reviewdelete.do")
	public void reviewDelete() {}
	
	/* 리뷰 답글작성 */
	@RequestMapping("/recomwrite.do")
	public void recomWrite() {
	}
	
	/* 리뷰 답글 수정 */
	@RequestMapping("/recomupdate.do")
	public void recomUpdate() {}
	
	/* 리뷰 답글삭제 */
	@RequestMapping("/recomdelete.do")
	public void recomDelete() {}
	
	/* 리뷰 좋아요*/
	@RequestMapping("/reviewlike.do")
	public void reviewLike() {}
	
	/* 리뷰 좋아요 취소*/
	@RequestMapping("/reviewlikecancel.do")
	public void reviewLikeCancel() {}
	

	
}
