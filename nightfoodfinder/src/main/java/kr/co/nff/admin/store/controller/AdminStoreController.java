package kr.co.nff.admin.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.store.service.StoreService;


@Controller("kr.co.nff.admin.store.controller.AdminStoreController")
@RequestMapping("/admin/store")
public class AdminStoreController {
	
	
	@Autowired
	private StoreService service;
	
	//가게 목록
	@RequestMapping("/storelist.do")
	public void storeList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("slist", service.listStore());
	}
	
	//가게 상세 
	@RequestMapping("/storedetail.do")
	public void storeDetail(int no, Model model) {
		model.addAttribute("user", service.detailStore(no));
	}
	
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


	
	
}

