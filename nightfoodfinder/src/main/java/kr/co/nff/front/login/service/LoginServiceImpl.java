package kr.co.nff.front.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.nUser;

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
	
	public void insertNaverUser(nUser user) {
		dao.insertNaverUser(user);
	}
	public int selectNaver(nUser user) {
		return dao.selectNaver(user);
	};
}
