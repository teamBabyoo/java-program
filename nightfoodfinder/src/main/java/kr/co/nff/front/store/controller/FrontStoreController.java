package kr.co.nff.front.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.nff.front.store.service.StoreService;
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
		//System.out.println(model.getAttribute("keyword"));
		model.addAttribute("sList", service.storeList(search));
	}
	
	
	/* 가게 상세 */
	@RequestMapping("/storedetail.do")
	public void storeDetail(Model model, int no) {
		model.addAttribute("store", service.storeDetail(no));
		model.addAttribute("menu", service.storeMenu(no));
		model.addAttribute("holidaylist", service.storeHoliday(no));
		model.addAttribute("storeContent", service.storeContent(no));
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
	public List<Review> reviewListAjax(int no){
		return service.reviewList(no);
	}

	/* 리뷰 작성 & 이미지 업로드 */
	@RequestMapping("/review_regist.do")
	@ResponseBody
//	public List<Review> reviewRegistAjax(Review review, MultipartHttpServletRequest mtfRequest) {
	public List<Review> reviewRegistAjax(Review review) {
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
//        model.addAttribute("list", service.reviewRegist(review));
		System.out.println("내용 : " + review.getReviewContent());
		System.out.println("답댓 : " + review.getRecomment());
		System.out.println("스코프 : " + review.getStoreScope());
        System.out.println("게시글번호 확인" + review.getStoreNo());
        service.reviewRegist(review);
        return service.reviewList(review.getStoreNo());
	}

	
}
