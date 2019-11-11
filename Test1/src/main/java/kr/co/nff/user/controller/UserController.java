package kr.co.nff.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.nff.user.controller.UserController")
@RequestMapping("/user")
public class UserController {
	
	/* 회원 가입 */
	@RequestMapping("/userJoin.do")
	public String userJoin() {
		return "redirect:userPage.do";
	}
	@RequestMapping("/userJoinForm.do")
	public void userJoinForm() {}
	
	/* 회원 상세페이지 (마이페이지) */
	@RequestMapping("/userPage.do")
	public void userPage() {}
	
	
	/* 회원 로그인 */
	@RequestMapping("/userLogin.do")
	public String userLogin() {
		return "redirect:userPage.do";
	}
	@RequestMapping("/userLoginForm.do")
	public void userLoginForm() {}
	
	/* 회원 정보수정(닉네임) */
	@RequestMapping("/userUpdate.do")
	public String userUpdate() {
		return "redirect:userPage.do";
	}
	@RequestMapping("/userUpdateForm.do")
	public void userUpdateForm() {}
	
	/* 회원 탈퇴*/
	@RequestMapping("/userDelete.do")
	public String userDelete() {
		return "redirect:userPage.do";
	}
	
	/* 가게 가입 */
	@RequestMapping("/storeJoin.do")
	public String storeJoin() {
		return "redirect:storePage.do";
	}
	@RequestMapping("/storeJoinForm.do")
	public void storeJoinForm() {}
	
	/* 가게 로그인 */
	@RequestMapping("/storeLogin.do")
	public String storeLogin() {
		return "redirect:storePage.do";
	}
	@RequestMapping("/storeLoginForm.do")
	public void storeLoginForm() {}
	
	/* 가게 상세 페이지(가게 마이페이지)*/
	@RequestMapping("/storePage.do")
	public void storePage() {}
	
	/* 가게 정보수정 */
	@RequestMapping("/storeUpdate.do")
	public String storeUpdate() {
		return "redirect:storePage.do";
	}
	@RequestMapping("/storeUpdateForm.do")
	public void storeUpdateForm() {}
	
	/* 가게 소개글 등록 */
	@RequestMapping("/storeContentWrite.do")
	public String storeContentWrite() {
		return "redirect:storePage.do";
	}
	@RequestMapping("/storeContentWriteForm.do")
	public void storeContentWriteForm() {}
	
	/* 가게 소개글 수정 */
	@RequestMapping("/storeContentUpdate.do")
	public String storeContentUpdate() {
		return "redirect:storePage.do";
	}
	@RequestMapping("/storeContentUpdateForm.do")
	public void storeContentUpdateForm() {}
	
	/* 가게 탈퇴 */
	@RequestMapping("/storeDelete.do")
	public String storeDelete() {
		return "redirect:storePage.do";
	}
	
}
