package kr.co.nff.front.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Store;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao;
	
	public void insertStore(Store store) {
		dao.insertStore(store);
	}
}
