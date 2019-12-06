package kr.co.nff.front.login.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

public interface LoginService {
	// 가게 회원가입
	void joinStore(Store store);
	
	Store storeLogin(Store store);
	
	// 가게 로그인 이메일체크
	int storeEmailChk(String storeEmail);
	
	// 네이버 회원가입
	void insertNaverUser(User user);
	// 네이버 회원체크
	int selectNaver(User user);
	
	//로그인한 유저 정보
	User selectLoginOneUser(String userId);
}
