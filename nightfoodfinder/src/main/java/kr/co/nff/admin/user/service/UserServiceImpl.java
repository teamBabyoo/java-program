package kr.co.nff.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.userDAO;
import kr.co.nff.repository.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private userDAO dao;
	
	
	public List<User> listUser() {
		return dao.adminSelectUser();
	}

	public User detailUser(int no) {
		return dao.adminSelectOneUser(no);
	}

	public void deleteUser(int no) {
		dao.adminDeleteUser(no);
	}

}
