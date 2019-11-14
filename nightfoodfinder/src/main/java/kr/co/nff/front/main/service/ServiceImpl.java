package kr.co.nff.front.main.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.userDAO;
import kr.co.nff.repository.vo.User;

@org.springframework.stereotype.Service
public class ServiceImpl implements Service{
	@Autowired
	private userDAO dao;
	
	@Override
	public void selectUser() {
		
	}

}
