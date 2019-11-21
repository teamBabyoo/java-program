package kr.co.nff.front.login.controller;

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
import kr.co.nff.login.naver.oauth.bo.NaverLoginBO;
import kr.co.nff.login.naver.oauth.model.JsonParser;
import kr.co.nff.repository.vo.nUser;


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
	/*
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
	 */

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	 //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/front/login/storeJoinForm.do", 
    				method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
//        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return new ModelAndView("front/login/storeJoinForm","url", naverAuthUrl);
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/front/login/ncallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, 
    				@RequestParam String code, @RequestParam String state, 
    				HttpSession session, nUser vo)
            throws Exception {
    	
    	System.out.println("여기는 callback");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	
    	//1. 로그인 사용자 정보를 읽어온다.
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
    	/** apiResult json 구조
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
		} else {
			loginservice.insertNaverUser(vo);
			session.setAttribute("login", vo);
		}
    	
    	

    	
    	//"front/login/ncallback"
		//new ModelAndView("front/login/ncallback", "naverUserVO",vo)
        return "front/login/ncallback";
    }
	
//---------------------------------------------	
	@Autowired
	LoginService loginservice;
	
	
	//스토어 가입
	@RequestMapping("/storejoin.do")
	public String storeJoin() {
		return "redirect:main.do";
	}

	/*
	 * @RequestMapping("/front/login/storeJoinForm.do") public void storeJoinForm()
	 * {}
	 */
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

