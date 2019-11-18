package kr.co.nff.front.login.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.LoginDAO;
import kr.co.nff.repository.vo.Store;

@Service
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO dao;
	private SqlSessionTemplate sqlsession;
	
	public void insertStore(Store store) {
		dao.insertStore(store);
	}
	
	public int storeEmailChk(String storeEmail) {
		
		dao = sqlsession.getMapper(LoginDAO.class);
		
		return dao.storeEmailChk(storeEmail);
	}
}