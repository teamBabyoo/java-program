package kr.co.nff.front.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("kr.co.nff.front.login.LoginController")
//@RequestMapping("/front/login")
public class LoginController {
	
	//유저 가입
	@RequestMapping("/userjoin.do")
	public void userJoin() {}
	
	//유저 로그인
	@RequestMapping("/userlogin.do")
	public void userLogin() {}
	
	//유저 로그아웃
	@RequestMapping("/userlogout.do")
	public void userLogout() {}
	
	//유저 정보 업데이트
	@RequestMapping("/userupdate.do")
	public void userUpdate() {}
	
	//유저 상세 내용
	@RequestMapping("/userdetail.do")
	public void userDetail() {}
	
	
//---------------------------------------------	
	
	//스토어 가입
	@RequestMapping("/storejoin.do")
	public String storeJoin() {
		return "redirect:main.do";
	}
	
	@RequestMapping("/front/login/storeJoinForm.do")
	public void storeJoinForm() {}
	
	
	//스토어 로그인
	@RequestMapping("/storelogin.do")
	public void storeLogin() {}
	//스토어 로그아웃
	@RequestMapping("/storelogout.do")
	public void storeLogout() {}
	//스토어 아이디찾기
	@RequestMapping("/storeidfind.do")
	public void storeIdFind() {}
	//스토어 비번찾기
	@RequestMapping("/storepassfind.do")
	public void storePassFind() {}
	
	
}

