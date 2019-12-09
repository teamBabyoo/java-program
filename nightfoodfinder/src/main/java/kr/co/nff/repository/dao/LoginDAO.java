package kr.co.nff.repository.dao;

import java.util.Map;

import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

public interface LoginDAO {
	void insertStore(Store store);
	void insertHoliday(Store store);
	void insertAddress(Store store);
	
	Store storeLogin(Store store);
	int storeEmailChk(String storeEmail);
	
	//void loginStore(Store store);
	
	void insertNaverUser(User user);
	int selectNaver(User user);
	
	//로그인한 회원
//	User selectLoginOneUser(String userId); 
}
