package kr.co.nff.front.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.front.store.service.StoreService;

@Controller("kr.co.nff.front.store.controller.FrontStoreController")
@RequestMapping("/front/store")
public class FrontStoreController {
	@Autowired
	private StoreService service;
	
	/* 가게 목록 */
	@RequestMapping("/list.do")
	public void storeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("sList", service.storeList());
	}
	
	@RequestMapping("/storedetail.do")
	public void storeDetail(Model model) {
		model.addAttribute("store", service.storeDetail());
		model.addAttribute("menu", service.storeMenu());
		model.addAttribute("holidaylist", service.storeHoliday());
	}
	
	/* 가게 정보 수정*/
	@RequestMapping("/infoupdate.do")
	public void storeInfoUpdate() {}
	
	/* 가게 소개글 수정*/
	@RequestMapping("/contentupdate.do")
	public void storeContentUpdate() {}

	/* 단골 등록 */
	@RequestMapping("/regular.do")
	public void storeRegular() {}
	
	/* 단골 취소 */
	@RequestMapping("/irregular.do")
	public void storeIrregular() {}
	
	
}
