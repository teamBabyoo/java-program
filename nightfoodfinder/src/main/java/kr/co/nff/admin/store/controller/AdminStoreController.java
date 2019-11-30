package kr.co.nff.admin.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.store.service.StoreService;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;


@Controller("kr.co.nff.admin.store.controller.AdminStoreController")
@RequestMapping("/admin/store")
public class AdminStoreController {
	
	
	@Autowired
	private StoreService service;
	
	//가게 목록
	@RequestMapping("/storelist.do")
	public void storeList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "total") String searchType,
			@RequestParam(required = false, defaultValue = "1,2,3,4,5,6") String categorycode,
			@RequestParam(required = false, defaultValue = "storename") String searchTypes,
			@RequestParam(required = false) String keyword, 
			Model model) {
		
		List<Category> cateList = service.selectCategory();
		
		Search search = new Search();
		search.setType(searchType);
		search.setTypes(searchTypes);
		search.setKeyword(keyword);
		
		/*카테고리 코드 string으로 가져와서 int[]에 넣기*/
		String[] arrIdx = categorycode.toString().split(",");
		int[] codeArr = new int[arrIdx.length];
		for (int i=0; i<arrIdx.length; i++) {
			codeArr[i] = Integer.parseInt(arrIdx[i]);
//			System.out.println(codeArr[i]);
		}
		search.setCategoryCode(codeArr);
	

		// 전체 게시글 개수
		int listCnt = service.GetListCnt(search);
				
		search.pageInfo(page, range, listCnt);
		model.addAttribute("cateList", cateList);		
		model.addAttribute("pagination", search);		
		model.addAttribute("slist", service.listStore(search));
	}
	
//	//가게 상세 
//	@RequestMapping("/storedetail.do")
//	public void storeDetail(int no, Model model) {
//		model.addAttribute("user", service.detailStore(no));
//	}
	
	//가게 삭제
	@RequestMapping("/storedelete.do")
	public String storeDelete(int no) {
		service.deleteStore(no); 
		return "redirect:storelist.do";
	}
	
	//가게 등록 허용
	@RequestMapping("/storestatus.do")
	public String storeAdmin(int no) {
		service.statusStore(no);
		return "redirect:storelist.do";
	}

	//회원 강제활동정지, 취소
		@RequestMapping("/withdraw.do")
		public void withdrawAjax(Store store){		
			service.withdrawStore(store);
	 }
	
	
}

