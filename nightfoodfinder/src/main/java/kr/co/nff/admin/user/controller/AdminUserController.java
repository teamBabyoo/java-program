package kr.co.nff.admin.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.nff.admin.user.controller.AdminUserController")
@RequestMapping("/admin/user")
public class AdminUserController {
	
	//회원 목록
	@RequestMapping("/userlist.do")
	public void userList() {}
	
	//회원 삭제
	@RequestMapping("/userdelete.do")
	public void userDelete() {}
	
	//회원 상세 
	@RequestMapping("/userdetail.do")
	public void storeDetail() {}
	
	
}

