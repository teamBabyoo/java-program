package kr.co.nff.admin.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.nff.admin.store.controller.AdminStoreController")
@RequestMapping("/admin/store")
public class AdminStoreController {
	
	
	//가게 목록
	@RequestMapping("/storelist.do")
	public void storeList() {}
	
	//가게 상세 
	@RequestMapping("/storedetail.do")
	public void storeDetail() {}
	
	//가게 삭제
	@RequestMapping("/storedelete.do")
	public void storeDelete() {}
	
	//가게 등록 허용
	@RequestMapping("/storestatus.do")
	public void storeAdmin() {}


	
	
}

