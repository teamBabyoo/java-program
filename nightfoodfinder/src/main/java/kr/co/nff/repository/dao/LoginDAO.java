package kr.co.nff.repository.dao;


import java.util.List;

import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

public interface LoginDAO {
	void insertStore(Store store);
	void insertHoliday(Store store);
	void insertAddress(Store store);
	void insertMenuList(Store store);
	
	Store storeLogin(Store store);
	int storeEmailChk(String storeEmail);
	
	//void loginStore(Store store);
	
	void insertNaverUser(User user);
	int selectNaver(User user);
	
	void insertKakaoUser(User user);
	int selectKakao(User user);
	void insertKakaoInfo(User user);
	
	//로그인한 회원
	User selectLoginOneUser(User user); 
	
	User userDetail(int userNo);
	List<Store> userFreqList(int userNo);
	List<Review> userReviewList(int userNo);
}
