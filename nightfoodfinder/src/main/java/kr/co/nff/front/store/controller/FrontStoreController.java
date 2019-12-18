package kr.co.nff.front.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.protobuf.Field;

import kr.co.nff.front.store.service.StoreService;
import kr.co.nff.repository.vo.FileVO;
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
	public void storeList(Model model, Search search) {
		model.addAttribute("result", service.storeList(search));
		
	}

	@RequestMapping("/storelistAjax.do")
	@ResponseBody
	public Map<String, Object> storeListAjax(Search search) {
		Map<String, Object> result = service.storeList(search);
		/*
		 * System.out.println(service.storeList(search)); System.out.println("페이지결과" +
		 * search.getPage());
		 */
		/* return service.storeList(search); */
		return result;
	}
	
	
	/* 가게 상세 */
	
	@RequestMapping("/storedetail.do")
	public void storeDetail(Model model, int no, HttpServletRequest req) {
		HttpSession session = req.getSession();
//		System.out.println("로그인한 유저: " + session.getAttribute("loginUser"));
		model.addAttribute("store", service.storeDetail(no));
		model.addAttribute("menu", service.storeMenu(no));
		model.addAttribute("holidaylist", service.storeHoliday(no));
		model.addAttribute("storeContent", service.storeContent(no));
		model.addAttribute("user", session.getAttribute("loginUser"));
//		System.out.println("로그인한가게 :" + session.getAttribute("loginStore"));
		model.addAttribute("loginStore", session.getAttribute("loginStore"));
		model.addAttribute("imageListSize", service.getImageCount(no));
		model.addAttribute("imgList", service.getImage(no));
//		System.out.println("이미지리스트"+service.getImage());
		
		/* 파일 다운로드 하지 않으면서 그냥 경로로 가져오기 */
//		model.addAttribute("reviewImg", service.selectOneFile(1));
	}
	
	/* 파일 다운로드하지 안흐면서 그냥 경로 가져오는 테스트 */
	@RequestMapping("/imgsrctest.do")
	public void imgsrctest() {
		System.out.println("이미지 경로 확인하기 요청 성공");
		int reviewNo = 5;
		System.out.println(service.selectFileList(reviewNo));
	}
	
	/* 가게 정보 수정*/
	@RequestMapping("/storeinfoupdate.do")
	public String storeInfoUpdate(Store store, @RequestParam(value="storeNo") int no) {
		service.updateHoliday(store);
		
		String [] menuNames = store.getMenuName();
		int [] prices = store.getMenuPrice();
		
		List<Map<String, Object>> menulist = new ArrayList<Map<String, Object>>();
		
		for(int i = 0; i < menuNames.length; i++) {
			 Map<String, Object> menuMap = new HashMap<String, Object>();
			 menuMap.put("menu", menuNames[i]);
			 menuMap.put("price",prices[i]);
			 menulist.add(menuMap);
		}
		
		store.setMenulist(menulist);
		service.updateMenuList(store, no);
		return "redirect:storedetail.do?no="+no;
	}
	
	/* 가게 소개글 수정폼*/
	@RequestMapping("/storecontentupdateForm.do")
	public void storeContentUpdate(int no, Model model) {
		model.addAttribute("store", service.storeupdateForm(no));
		model.addAttribute("storeContent", service.storeContentUpdateForm(no));
		JSONArray jsonArray = new JSONArray();
		model.addAttribute("holidaylist", jsonArray.fromObject(service.storeHoliday(no)));
		model.addAttribute("menulist", service.storeMenu(no));
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
		
		// -------- 이미지 다운로드 -------
		System.out.println("이미지 경로 확인하기 요청 성공");
		int reviewNo = 5;
		System.out.println(service.selectFileList(reviewNo));
		// ---------------------------
		
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
	public Map<String, Object> reviewReportAjax(Review review){

		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		Map<String, Object> map= new HashMap<>();
		map.put("list", service.reviewReport(review));
		map.put("pagination", new Pagination(review.getPage(), service.getReviewCnt(review.getStoreNo())));
		return map;
	}
		
		

	/* 리뷰 작성 & 이미지 업로드 */
	@RequestMapping("/review_regist.do")
	public String reviewRegist(Review review) throws Exception, IOException {
		
		boolean fileFlag = true;
		
		for (MultipartFile mf : review.getAttach()) {
			if (mf.getContentType().equals("application/octet-stream")) {
//				System.out.println("파일 첨부");
				fileFlag = false;
			};
//			System.out.println("파일첨부X");
		}
		System.out.println(fileFlag);
		
		service.reviewRegist(review, fileFlag);
		
//		System.out.println(review.getAttach().size());
//		List<MultipartFile> list = new ArrayList<>();
		//--------------------------------------------
		
		//--------------------------------------------
		
        return "redirect:storedetail.do?no=" + review.getStoreNo();
	}
	
	/* 리뷰작성폼 */
	@RequestMapping("/storeReviewRegistForm.do")
	public void reviewRegistForm(Review review, Model model, HttpSession session) {
		System.out.println("여기는 댓글작성폼");
		model.addAttribute("loginUser", session.getAttribute("loginUser"));
	}

	
	/*좋아요등록*/
	@RequestMapping("/i_like.do")
	@ResponseBody
	public Map<String, Object> likeInsertAjax(Review review){
		/*
		System.out.println("리뷰번호: " + review.getReviewNo());
		System.out.println("유저번호: " + review.getUserNo());
		System.out.println("신고사유: " + review.getReportWhy());
		System.out.println("가게번호: " + review.getStoreNo());
		 */
		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		System.out.println("좋아요페이지" + review.getPage());
		Map<String, Object> map = new HashMap<>();
		map.put("list", service.insertLike(review));
		map.put("pagination", new Pagination(review.getPage(), service.getReviewCnt(review.getStoreNo())));
		return map;

	}
	/*좋아요 취소*/
	@RequestMapping("/i_like_cancel.do")
	@ResponseBody
	public Map<String, Object> deleteLiketAjax(Review review){
		System.out.println("리뷰번호: " + review.getReviewNo());
		System.out.println("유저번호: " + review.getUserNo());
		/*
		System.out.println("신고사유: " + review.getReportWhy());
		System.out.println("가게번호: " + review.getStoreNo());
		 */
		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		Map<String, Object> map = new HashMap<>();
		map.put("list", service.deleteLike(review));
		map.put("pagination", new Pagination(review.getPage(), service.getReviewCnt(review.getStoreNo())));
		return map;

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
	public Map<String, Object> insertrecomment(Review review) {
		service.insertRecomment(review);
		
		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		Map<String, Object> map= new HashMap<>();
		map.put("list", service.reviewList(review));
		map.put("pagination", new Pagination(review.getPage(), service.getReviewCnt(review.getStoreNo())));
		return map;
//		return service.reviewList(review);
	}
		
	@RequestMapping("/recomment_delete.do")
	@ResponseBody
	public Map<String, Object> deleteRecomment(Review review) {
		service.deleteRecomment(review);
		review.setListCnt(service.getReviewCnt(review.getStoreNo()));
		Map<String, Object> map= new HashMap<>();
		map.put("list", service.reviewList(review));
		map.put("pagination", new Pagination(review.getPage(), service.getReviewCnt(review.getStoreNo())));
		return map;
//		return service.reviewList(review);
	}
	
	/*이미지 가져오기*/
	@RequestMapping(value="/getByteImage.do")
	public void getByteImage(HttpServletRequest req, HttpServletResponse res, FileVO fileVO) throws ServletException, IOException {
		//사용자가  요청한 파일이 어느날짜 어느 시간에 있는지 모른다.
		String path = req.getParameter("path"); // 사용자 요청 파일이 저장된 경로 
		String name = req.getParameter("name"); // 사용자 요청 파일명
		String dname = req.getParameter("dname"); // 다운로드할 파일명
		
		//파일의 읽기 위한 파일 객체 생성
		File f = new File(path, name);
		
		//전송하는 내용에 대한 설정
		if(dname == null) {
			res.setHeader("Content-Type", "image/jpg");
		} //다운로드 시킬 때
		   else {
			 //브라우저가 타입을 모르면 다운시켜주는게 있었다..
			res.setHeader("Content-Type", "application/octet-stream"); 
			//한글이름일 경우 처리
			dname = new String(dname.getBytes("utf-8"), "8859_1");
			//다운로드할 이름을 지정
			res.setHeader("Content-Disposition", "attachment;filename=" + dname);
		}
		
		//브라우저로 전송
		//읽어서 사용자에게 전송 reader가 아닌 InputStream. 이미지 일 수 있으니.. 텍스트를 바이트로 보내도 된다. 반대는 X
		FileInputStream fis = new FileInputStream(f);
		//속도향상
		BufferedInputStream bis = new BufferedInputStream(fis);
		//byte 단위를 파일로 보내기 위해
		OutputStream out = res.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if(ch == -1) break;
			//파일읽을 내용이 있으면
			bos.write(ch);
		}
		bis.close();fis.close();
		bos.close();out.close();
		
		
		
		
		
	
		
	}
	
}
