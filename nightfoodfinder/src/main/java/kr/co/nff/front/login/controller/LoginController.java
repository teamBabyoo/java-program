package kr.co.nff.front.login.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.co.nff.front.login.service.LoginService;
import kr.co.nff.front.notice.service.NoticeService;
import kr.co.nff.login.naver.oauth.bo.NaverLoginBO;
import kr.co.nff.login.naver.oauth.model.JsonParser;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.User;


@Controller("kr.co.nff.front.login.LoginController")
//@RequestMapping("/front/login")
public class LoginController {
	
	@Autowired
	public NoticeService noticeService;
	
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

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	 //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/front/login/userLoginForm.do", 
    				method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
//        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("front/login/userLoginForm","url", naverAuthUrl);
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/front/login/ncallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, 
    				@RequestParam String code, @RequestParam String state, 
    				HttpSession session, User vo)
            throws Exception {
    	
    	System.out.println("여기는 callback");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	//1. 로그인 사용자 정보를 읽어온다.
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    	/** 
    	apiResult json 구조
    	{"resultcode":"00",
    	"message":"success",
    	"response":{
    		"id":"5884525",
    		"age":"30-39",
    		"gender":"F",
    		"email":"pang103@naver.com",
    		"name":"\uc1a1\ubcf4\ub984"}}
    	**/
    	JsonParser json = new JsonParser();
    	vo = json.changeJson(apiResult);
    	
    	
    	if (loginservice.selectNaver(vo) > 0) { // 세션만들기
			session.setAttribute("login", vo);
			
			// 로그인되는 유저 
			User loginUser = (User)loginservice.selectLoginOneUser(vo.getUserId());
			session.setAttribute("loginUser", loginUser);
			
			// 로그인된 유저의 알림리스트, 안읽은 알림 갯수 가져와서 같이 세션에 올린다.
			Notice notice = new Notice();
			notice.setUserNo(loginUser.getUserNo());
			List<Notice> noticeList = noticeService.selectNotice(notice);
			int numOfNotice = noticeService.countNewNotice(notice);
			session.setAttribute("noticeList", noticeList);
			session.setAttribute("countNotice", numOfNotice);
			
			System.out.println(noticeList.toString());
			System.out.println(numOfNotice + "알림 갯수");
			
			
			System.out.println(loginservice.selectLoginOneUser(vo.getUserId()));
		} else {
			loginservice.insertNaverUser(vo);
			session.setAttribute("login", vo);
		}
    	
    	//"front/login/ncallback"
		//new ModelAndView("front/login/ncallback", "naverUserVO",vo)
        return "front/login/ncallback";
    }
	
  //로그아웃
    @RequestMapping(value = "/front/login/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String logout(HttpSession session)throws IOException {
    System.out.println("여기는 logout");
    session.invalidate();
    return "redirect:/front/main/main.do";
    }

    
   
//---------------------------------------------	
	@Autowired
	LoginService loginservice;
	
	
	//스토어 가입
	@RequestMapping("/front/login/storejoin.do")
	public String storeJoin() {
		return "redirect:main.do";
	}

	
	  @RequestMapping("/front/login/storeJoinForm.do") 
	  public void storeJoinForm(){
		  
	  }
	 
	//스토어 중복이메일 체크
	@RequestMapping(value="/front/login/storeEmailChk.do")
	@ResponseBody
	public int storeEmailChk(String storeEmail) {
		System.out.println("email중복체크 컨트롤러 ");
		return loginservice.storeEmailChk(storeEmail);
	}
	
	
	//스토어 로그인
	@RequestMapping("/storelogin.do")
	public void storeLogin() {
		//session.attribute("type", 0);
	}
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

