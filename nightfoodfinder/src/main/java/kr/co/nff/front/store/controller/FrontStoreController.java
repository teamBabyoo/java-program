package kr.co.nff.front.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.store.service.StoreService;

@Controller("kr.co.nff.front.store.controller.FrontStoreController")
@RequestMapping("/front/store")
public class FrontStoreController {
	
	private StoreService service;
	
	/* 가게 목록 */
	@RequestMapping("/storelist.do")
	public void storeList() {}
	
	/* 가게 상세 */
	@RequestMapping("/storedetail.do")
	public void storeDetail(int no, Model model) {
		model.addAttribute("store", service);
	}
	
	/* 가게 정보 수정*/
	@RequestMapping("/storeinfoupdate.do")
	public void storeInfoUpdate() {}
	
	/* 가게 소개글 수정*/
	@RequestMapping("/storecontentupdate.do")
	public void storeContentUpdate() {}

	/* 단골 등록 */
	@RequestMapping("/storeregular.do")
	public void storeRegular() {}
	
	/* 단골 취소 */
	@RequestMapping("/storeirregular.do")
	public void storeIrregular() {}
	
	
}