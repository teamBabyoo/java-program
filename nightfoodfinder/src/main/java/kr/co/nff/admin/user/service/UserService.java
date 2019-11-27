package kr.co.nff.admin.user.service;

import java.util.List;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.User;


public interface UserService {
	List<User> listUser(Search search);
	User detailUser(int no);
	void deleteUser(int no);
	int GetListCnt(Search search);
	void withdrawUser(User user);
}
