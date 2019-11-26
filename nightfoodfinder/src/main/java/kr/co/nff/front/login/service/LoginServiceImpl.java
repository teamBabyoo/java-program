package kr.co.nff.front.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao;
	
	public void insertStore(Store store) {
	
		dao.insertStore(store);
	}
	
	public Store selectUserInfoByName(String storeName) {
		 return dao.selectUserInfoByName(storeName);
	}
	
	
	public int storeEmailChk(String storeEmail) {
		return dao.storeEmailChk(storeEmail);
	}
	
	public void insertNaverUser(User user) {
		dao.insertNaverUser(user);
	}
	public int selectNaver(User user) {
		return dao.selectNaver(user);
	}

	@Override
	public User selectLoginOneUser(String userId) {
		return dao.selectLoginOneUser(userId);
	};
}
