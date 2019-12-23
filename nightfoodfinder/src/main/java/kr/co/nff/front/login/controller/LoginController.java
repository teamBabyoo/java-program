package kr.co.nff.front.login.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import kr.co.nff.login.kakao.oauth.model.KakaoLogin;
import kr.co.nff.login.naver.oauth.bo.NaverLoginBO;
import kr.co.nff.login.naver.oauth.model.JsonParser;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;


@Controller("kr.co.nff.front.login.LoginController")
@RequestMapping("/front/login")
public class LoginController {
	
	//카카오 로그인
	@Autowired
	private KakaoLogin kakao;
	
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
    @RequestMapping(value = "/userLoginForm.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView login(Model model, HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        //System.out.println(session);
        
        /* 카카오 로그인 URL 가져오기*/
        String kakaoAuthUrl = kakao.getAuthorizationUrl(session);
        
        mav.setViewName("front/login/userLoginForm");
        
        //네이버 
        mav.addObject("naver_url", naverAuthUrl);
        //카카오
        mav.addObject("kakao_url", kakaoAuthUrl);
        /* 생성한 인증 URL을 View로 전달 */
        return mav;
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/ncallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, 
    				@RequestParam String code, @RequestParam String state, 
    				HttpSession session, User vo)
            throws Exception {
    	
    	System.out.println("여기는 callback");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	//1. 로그인 사용자 정보를 읽어온다.
    	apiResult = naverLoginBO.getUserProfile(oauthToken);
    	JsonParser json = new JsonParser();
    	vo = json.changeJson(apiResult);
    	
    	
    	if (loginservice.selectNaver(vo) > 0) { // 세션만들기
    		System.out.println(vo.getUserType());
			
    		session.setAttribute("loginUser", loginservice.selectLoginOneUser(vo));
			
		} else {
			loginservice.insertNaverUser(vo);
			System.out.println("첫로그인 유저"+vo);
			session.setAttribute("loginUser", loginservice.selectLoginOneUser(vo));
		
		}

    	if(vo.getUserType() == 0) {return "redirect:/admin/stat/visitorcount.do"; }
    	else {
    		
    		return "front/login/ncallback";
    	}
    }
    
  // 카카오 콜백 
    @RequestMapping(value = "/kakaologin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session,User vo) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		// 결과값을  담아줌
		String accessToken = kakao.getAccessToken(code);
		
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		// 사용자의 정보
		HashMap<String, Object> userInfo = kakao.getUserInfo(accessToken);
		System.out.println("유저정보:::" + userInfo.get("email"));
		
		vo.setUserEmail(userInfo.get("email").toString());
		vo.setNickName(userInfo.get("nickname").toString());
		
		if(loginservice.selectKakao(vo) > 0) {
			// 로그인 기록 있는 유저
			System.out.println("기존 유저"+loginservice.selectLoginOneUser(vo));
			session.setAttribute("loginUser", loginservice.selectLoginOneUser(vo));
			session.setAttribute("kakaoInfo", "y");
			System.out.println("기존 유저"+session.getAttribute("kakaoInfo"));
		} else {
			// 로그인 기록 없는 유저, 디비에 정보 insert 해줘야함
			loginservice.insertKakaoUser(vo);
			System.out.println(loginservice.selectLoginOneUser(vo));
			session.setAttribute("loginUser", loginservice.selectLoginOneUser(vo));
			session.setAttribute("kakaoInfo", "n");
			System.out.println("첫로그인 유저"+session.getAttribute("kakaoInfo"));
		}
		mav.setViewName("front/login/kakaologin");
		return mav;
	}// end kakaoLogin()
     
 // 카카오 추가정보 페이지 이동   
 @RequestMapping("/kakaoinfo.do")
 public void kakaoinfo () {}
 
 // 카카오 추가정보 입력
 @RequestMapping("/kakaoinsert.do")
 public String kakaoinsert (User user) {
	 System.out.println("추가정보입력"+user.getUserGender());
	 loginservice.insertKakaoInfo(user);
	 return "redirect:/front/main/main.do";
 }
    
    
  //로그아웃
    @RequestMapping(value = "/logout.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String logout(HttpSession session)throws IOException {
    //System.out.println("여기는 logout");
    session.invalidate();
    System.out.println("로그아웃");
    return "redirect:/front/main/main.do";
    }

    // 일반회원로그인
    @RequestMapping("/userlogin.do")
    public String userlogin(User u, HttpSession session) {
    	User user = loginservice.selectLoginOneUser(u);
    	session.setAttribute("loginUser", user);
    	System.out.println("더미데이터용 로그인 완료");
		return "redirect:/front/main/main.do";
    }
    
    //일반회원로그인페이지
    @RequestMapping("/loginpage.do")
    public void loginpage() {}
    
    
    // 유저 마이페이지 
    @RequestMapping("/userdetail.do")
    public void userDetail (Model model, User user, int no, HttpSession session) {
    	
		System.out.println("로그인한 유저: " + session.getAttribute("loginUser"));
		model.addAttribute("loginUser", session.getAttribute("loginUser"));
		model.addAttribute("user", loginservice.userDetail(no));
		model.addAttribute("freqList",loginservice.userFreqList(no));
		model.addAttribute("reviewList", loginservice.userReviewList(no));
		System.out.println("단골목록"+ loginservice.userFreqList(no));
		System.out.println("댓글목록" + loginservice.userReviewList(no));
    }
    
    // 닉네임 수정 페이지
    @RequestMapping("/nicknameForm.do")
    public void updateNicknameForm() {}
    
    //닉네임 수정하기
    @RequestMapping("/updatename.do")
    public void updateNickname(User user) {
    	loginservice.updateNickname(user);
    	System.out.println("닉네임가져와"+user.getNickName());
    	System.out.println("유저번호는?"+ user.getUserNo());
//    	retur	n "redirect:userdetail.do?no="+user.getUserNo();
    }
    
    //닉네임 중복체크
    @RequestMapping(value="/nicknameChk.do")
	@ResponseBody
    public int nicknameChk(String nickName) {
    	System.out.println(loginservice.nicknameChk(nickName));
    	return loginservice.nicknameChk(nickName);
    }
//---------------------------------------------	
	@Autowired
	LoginService loginservice;
	
	
	//스토어 가입
	@RequestMapping("/storejoin.do")
	public String storeJoin(Store store) {
		
		String [] menuNames = store.getMenuName();
		int [] prices = store.getMenuPrice();
		
		List<Map<String, Object>> menulist = new ArrayList<Map<String, Object>>();
		
		//List<Menu> menulist = new ArrayList<Menu>();
		for(int i = 0; i < menuNames.length; i++) {
			
			 //Menu m = new Menu();
			 Map<String, Object> menuMap = new HashMap<String, Object>();
			 menuMap.put("menu", menuNames[i]);
			 //System.out.println();
			 menuMap.put("price",prices[i]);
			 
			 menulist.add(menuMap);
			
		}
		
		//System.out.println(menulist.toString());
		store.setMenulist(menulist);
		System.out.println(menulist);
		loginservice.joinStore(store);
		return "redirect:/front/main/main.do";
	}
	// 스토어 가입폼
	@RequestMapping("/storeJoinForm.do") 
	 public void storeJoinForm(){
	}
	 
	//스토어 중복이메일 체크
	@RequestMapping(value="/storeEmailChk.do")
	@ResponseBody
	public int storeEmailChk(String storeEmail) {
		System.out.println("email중복체크 컨트롤러 ");
		return loginservice.storeEmailChk(storeEmail);
	}
	
	
	//스토어 로그인
	@RequestMapping("/storelogin.do")
	public String storeLogin(Store s, HttpSession session) {
		Store store = loginservice.storeLogin(s);
		if(store == null) {
			return "redirect:/front/login/userLoginForm.do";
		}
		session.setAttribute("loginStore", store);
		System.out.println(store);
		return "redirect:/front/main/main.do";
		
	}
	
	
	//스토어 로그아웃
	@RequestMapping("/storelogout.do")
	public String storeLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/front/main/main.do";
	}
	//스토어 아이디찾기
	@RequestMapping("/storeidfind.do")
	public void storeIdFind() {}
	//스토어 비번찾기
	@RequestMapping("/storepassfind.do")
	public void storePassFind() {}
	
	
}

