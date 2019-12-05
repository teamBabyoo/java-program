package kr.co.nff.front.login.service;

import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

public interface LoginService {
	// 가게 회원가입
	void joinStore(Store store);

	
	Store selectUserInfoByName(String storeName);
	public int storeEmailChk(String storeEmail);
	
	void insertNaverUser(User user);
	int selectNaver(User user);
	
	//로그인한 유저 정보
	User selectLoginOneUser(String userId);
}
