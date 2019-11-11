package kr.co.nff.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.nff.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	//회원 목록
	@RequestMapping("/userlist.do")
	public void userList() {}
	
	//회원 삭제
	@RequestMapping("/userdelete.do")
	public void userDelete() {}
	
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
	@RequestMapping("/storeadmin.do")
	public void storeAdmin() {}

	//리뷰 목록
	@RequestMapping("/reviewlist.do")
	public void reviewList() {}
	
	//리뷰 상세
	@RequestMapping("/reviewdetail.do")
	public void reviewDetail() {}
	
	//리뷰 삭제
	@RequestMapping("/reviewdelete.do")
	public void reviewDelete() {}
	
	
}

