package kr.co.nff.admin.user.service;

import java.util.List;

import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.User;


public interface UserService {
	List<User> listUser(SearchRe search);
	User detailUser(int no);
	void deleteUser(int no);
	int GetListCnt(SearchRe search);
	void withdrawUser(User user);
}
