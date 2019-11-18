package kr.co.nff.front.login.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nff.front.login.service.LoginService;


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
	@Autowired
	private LoginService loginservice;
	
	
	//스토어 가입
	@RequestMapping("/storejoin.do")
	public String storeJoin() {
		return "redirect:main.do";
	}
	
	@RequestMapping("/front/login/storeJoinForm.do")
	public void storeJoinForm() {}
	
	//스토어 중복이메일 체크
	@RequestMapping(value="/front/login/storeEmailChk")
	@ResponseBody
	public int storeEmailChk(String storeEmail) {
		System.out.println("email중복체크 컨트롤러 ");
		return loginservice.storeEmailChk(storeEmail);
	}
	
	
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

