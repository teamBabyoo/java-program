package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.User;

public interface UserDAO {

	List<User> adminSelectUser(SearchRe search);
	User adminSelectOneUser(int no);
	void adminDeleteUser(int no);
	int adminUserPagingListCnt(SearchRe search);
	void withdrawUser(User user);
}
