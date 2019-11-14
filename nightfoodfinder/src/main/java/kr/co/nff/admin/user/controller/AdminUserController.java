package kr.co.nff.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.user.service.UserService;



@Controller("kr.co.nff.admin.user.controller.AdminUserController")
@RequestMapping("/admin/user")
public class AdminUserController {
	
	@Autowired
	private UserService service;
	
	//회원 목록
	@RequestMapping("/userlist.do")
	public void userList(@RequestParam(value="pageNo", defaultValue="1") int pageNo, Model model) {
		model.addAttribute("list", service.listUser());
	}
	
	//회원 삭제
	@RequestMapping("/userdelete.do")
	public String userDelete(int no) {
		service.deleteUser(no); 
		return "redirect:userlist.do";
	}
	
	//회원 상세 
	@RequestMapping("/userdetail.do")
	public void storeDetail(int no, Model model) {
		model.addAttribute("user", service.detailUser(no));
	}
	
	
}

