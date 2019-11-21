package kr.co.nff.admin.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.user.service.UserService;
import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.User;



@Controller("kr.co.nff.admin.user.controller.AdminUserController")
@RequestMapping("/admin/user")
public class AdminUserController {
	
	@Autowired
	private UserService service;
	
	//회원 목록
	@RequestMapping("/userlist.do")
	public void userList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "nickName") String searchType,
			@RequestParam(required = false) String keyword, 
			Model model) {
		
		SearchRe search = new SearchRe();
		search.setType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = service.GetListCnt(search);
				
		search.pageInfo(page, range, listCnt);
	
		model.addAttribute("pagination", search);	
		model.addAttribute("list", service.listUser(search));
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
	
	@RequestMapping("/withdraw.do")
	public void withdrawAjax(User user){		
		service.withdrawUser(user);
 }
	
}

