package kr.co.nff.front.login.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
//----------------------------
	
//네이버 로그인
	@RequestMapping("/front/login/naverlogin.do")
	public void isComplete(HttpSession session) {
		
	}
	
	@RequestMapping("/front/login/ncallback.do")
	public void nLogin(HttpServletRequest request) throws Exception {
		
	}
	
	@RequestMapping("/front/login/personalInfo.do")
	public void personalInfo(HttpServletRequest request) throws Exception{
		String token = "AAAAN3-WeNBrJi6CxMzrAKvgYzsfpQoY4FQAuC37ODNU85aOkKqvnXUQ3_KWKLXG6qO0-BUIm7_JvilDTr2Fk8MNaVc";// 네이버 로그인 접근 토큰;
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
            String apiURL = "https://openapi.naver.com/v1/nid/me";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
	}

	
	
//---------------------------------------------	
	@Autowired
	LoginService loginservice;
	
	
	//스토어 가입
	@RequestMapping("/storejoin.do")
	public String storeJoin() {
		return "redirect:main.do";
	}
	
	@RequestMapping("/front/login/storeJoinForm.do")
	public void storeJoinForm() {}
	
	//스토어 중복이메일 체크
	@RequestMapping(value="/front/login/storeEmailChk.do")
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

