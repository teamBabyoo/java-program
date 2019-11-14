package kr.co.nff.front.main.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.User;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
	@Autowired
	private UserDAO dao;
	
	@Override
	public void selectUser() {
		
	}

}
