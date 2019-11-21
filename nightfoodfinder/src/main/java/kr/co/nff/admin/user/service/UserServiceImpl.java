package kr.co.nff.admin.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;
	
	
	public List<User> listUser(SearchRe search) {
		return dao.adminSelectUser(search);
	}

	public User detailUser(int no) {
		return dao.adminSelectOneUser(no);
	}

	public void deleteUser(int no) {
		dao.adminDeleteUser(no);
	}
	public int GetListCnt(SearchRe search) {
		return dao.adminUserPagingListCnt(search);
	}
	
	public void withdrawUser(User user) {
		dao.withdrawUser(user);
	}
}
