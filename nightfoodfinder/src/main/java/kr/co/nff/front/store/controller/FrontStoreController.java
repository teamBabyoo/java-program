package kr.co.nff.front.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.nff.front.store.service.StoreService;
import kr.co.nff.repository.vo.Pagination;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;
import net.sf.json.JSONArray;


@Controller("kr.co.nff.front.store.controller.FrontStoreController")
@RequestMapping("/front/store")
public class FrontStoreController {

	@Autowired
	private StoreService service;
	
	/* 가게 목록 */
	@RequestMapping("/storelist.do")
	public void storeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model, Search search) {
		model.addAttribute("sList", service.storeList(search));
	}
	
	
	/* 가게 상세 */
	
	@RequestMapping("/storedetail.do")
	public void storeDetail(Model model, int no, HttpServletRequest req) {
		HttpSession session = req.getSession();
		System.out.println("로그인한 유저: " + session.getAttribute("loginUser"));
		model.addAttribute("store", service.storeDetail(no));
		model.addAttribute("menu", service.storeMenu(no));
		model.addAttribute("holidaylist", service.storeHoliday(no));
		model.addAttribute("storeContent", service.storeContent(no));
		model.addAttribute("user", session.getAttribute("loginUser"));
	}
	
	/* 가게 정보 수정*/
	@RequestMapping("/storeinfoupdate.do")
	public String storeInfoUpdate(Store store, @RequestParam(value="storeNo") int no) {
		service.updateHoliday(store);
		System.out.println(service.storeDetail(no));
		return "redirect:storedetail.do?no="+no;
	}
	
	/* 가게 소개글 수정폼*/
	@RequestMapping("/storecontentupdateForm.do")
	public void storeContentUpdate(int no, Model model) {
		model.addAttribute("store", service.storeupdateForm(no));
		model.addAttribute("storeContent", service.storeContentUpdateForm(no));
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("holidaylist", jsonArray.fromObject(service.storeHoliday(no)));
	}

	/* 단골 등록 */
	@RequestMapping("/storeregular.do")
	public void storeRegular() {}
	
	/* 단골 취소 */
	@RequestMapping("/storeirregular.do")
	public void storeIrregular() {}
	
	
	/*리뷰 가져오기*/
	@RequestMapping("/review_list.do")
	@ResponseBody
	public Map<String, Object> reviewListAjax(Review review){
		/*
		System.out.println("리뷰 내 유저 번호 : " + review.getUserNo());
		System.out.println("리뷰 스토어 번호 : " + review.getStoreNo());
		*/

		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		Map<String, Object> map= new HashMap<>();
		review.pageInfo(review.getPage(), review.getRange() , review.getListCnt());
		map.put("list", service.reviewList(review));
		map.put("pagination", review);
		System.out.println("페이지넘버: " +review.getPage());
		System.out.println("스타트 페이지" + review.getStartPage());
		
		return map;
	}
	
	/*리뷰 신고 확인용*/
	@RequestMapping("/review_report_check.do")
	@ResponseBody
	public int reviewReportCheckAjax(Review review){
		return service.reviewcount(review);
		
	}

	/*리뷰 신고하기*/
	@RequestMapping("/review_report.do")
	@ResponseBody
	public List<Review> reviewReportAjax(Review review){
		/*
		System.out.println("리뷰번호: " + review.getReviewNo());
		System.out.println("신고사유: " + review.getReportWhy());
		System.out.println("가게번호: " + review.getStoreNo());
		System.out.println("유저번호: " + review.getUserNo());
		*/

		return service.reviewReport(review);
	}
	/* 리뷰 작성 & 이미지 업로드 */
	@RequestMapping("/review_regist.do")
	@ResponseBody
	public List<Review> reviewRegistAjax(Review review, List<MultipartFile> attach) throws Exception, IOException {
		System.out.println("리뷰등록 시도");
/*		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);

        String path = "C:\\image\\";

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = path + System.currentTimeMillis() + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
*/
//      model.addAttribute("list", service.reviewRegist(review));
		System.out.println("--------------------------------------");
		System.out.println("작성자 : " + review.getWriterNo());
		System.out.println("내용 : " + review.getReviewContent());
		System.out.println("답댓 : " + review.getRecomment());
		System.out.println("스코프 : " + review.getStoreScope());
        System.out.println("게시글번호 확인" + review.getStoreNo());
        System.out.println("--------------------------------------");
        System.out.println("attach.size() : " + attach.size());
        for (MultipartFile file : attach) {
        	if (file.isEmpty()) continue;
        	
        	String orgName = file.getOriginalFilename();
        	long size = file.getSize();
        	System.out.println("파일명 : " + orgName);
        	System.out.println("파일크기 : " + size);
        	file.transferTo(new File("c:/java/nffresources/" + orgName));
        }
        
        
        
        service.reviewRegist(review);
        return service.reviewList(review);
	}

	
	/*좋아요등록*/
	@RequestMapping("/i_like.do")
	@ResponseBody
	public List<Review> likeInsertAjax(Review review){
		/*
		System.out.println("리뷰번호: " + review.getReviewNo());
		System.out.println("유저번호: " + review.getUserNo());
		System.out.println("신고사유: " + review.getReportWhy());
		System.out.println("가게번호: " + review.getStoreNo());
		 */
		return service.insertLike(review);

	}
	/*좋아요 취소*/
	@RequestMapping("/i_like_cancel.do")
	@ResponseBody
	public List<Review> deleteLiketAjax(Review review){
		System.out.println("리뷰번호: " + review.getReviewNo());
		System.out.println("유저번호: " + review.getUserNo());
		/*
		System.out.println("신고사유: " + review.getReportWhy());
		System.out.println("가게번호: " + review.getStoreNo());
		 */
		return service.deleteLike(review);

	}
	
	/*단골확인을 위한*/
	@RequestMapping("/frequent_check.do")
	@ResponseBody
	public int frequentCount(Store store){ 
		/*
		System.out.println("가게번호 : " + store.getStoreNo());
		System.out.println("유저번호 : " + store.getUserNo());
		*/
		return service.frequentCount(store);
	};
	
	/*단골등록*/
	@RequestMapping("/frequent_regist.do")
	@ResponseBody
	public int frequentRegist(Store store){ 
		/*
		System.out.println("등록가게번호 : " + store.getStoreNo());
		System.out.println("등록유저번호 : " + store.getUserNo());
		*/
		return service.frequentRegist(store);
	};
	
	
	/*단골취소*/
	@RequestMapping("/frequent_delete.do")
	@ResponseBody
	public int  frequentDelete(Store store){ 
		System.out.println("삭제가게번호 : " + store.getStoreNo());
		System.out.println("삭제유저번호 : " + store.getUserNo());
		return service.frequentDelete(store);
	};
	
	
	/*사장 답글*/
	@RequestMapping("/recomment_regist.do")
	@ResponseBody
	public List<Review> insertrecomment(Review review) {
		service.insertRecomment(review);
		return service.reviewList(review);
	}
		
	@RequestMapping("/recomment_delete.do")
	@ResponseBody
	public List<Review> deleteRecomment(Review review) {
		service.deleteRecomment(review);
		return service.reviewList(review);
	}

	
}
