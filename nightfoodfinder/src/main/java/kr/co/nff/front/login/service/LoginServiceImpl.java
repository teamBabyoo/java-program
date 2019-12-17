package kr.co.nff.front.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao;
	
	public void joinStore(Store store) {
		dao.insertStore(store);		
		dao.insertAddress(store);
		dao.insertHoliday(store);
		dao.insertMenuList(store);
	}
	
	public Store storeLogin(Store store) {
		return dao.storeLogin(store);
	}
	
	public void insertNaverUser(User user) {
		dao.insertNaverUser(user);
	}
	public int selectNaver(User user) {
		return dao.selectNaver(user);
	}

	@Override
	public User selectLoginOneUser(User user) {
		return dao.selectLoginOneUser(user);
	}

	public User userDetail(int userNo) {
		return dao.userDetail(userNo);
	}
	public List<Store> userFreqList(int userNo) {
		return dao.userFreqList(userNo);
	}
	//-------------------
	@Override
	public int storeEmailChk(String storeEmail) {
		return dao.storeEmailChk(storeEmail);
	}

	@Override
	public void insertKakaoUser(User user) {
		dao.insertKakaoUser(user);
	}

	@Override
	public int selectKakao(User user) {
		
		return dao.selectKakao(user);
	}

	@Override
	public void insertKakaoInfo(User user) {
		dao.insertKakaoInfo(user);
		
	}

	@Override
	public List<Review> userReviewList(int userNo) {
		return dao.userReviewList(userNo);
	}

	
	

}
