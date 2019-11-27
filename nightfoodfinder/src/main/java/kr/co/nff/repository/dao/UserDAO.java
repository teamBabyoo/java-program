package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.User;

public interface UserDAO {

	List<User> adminSelectUser(Search search);
	User adminSelectOneUser(int no);
	void adminDeleteUser(int no);
	int adminUserPagingListCnt(Search search);
	void withdrawUser(User user);
}
