package kr.co.nff.repository.dao;

import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.nUser;

public interface LoginDAO {
	void insertStore(Store store);
	int storeEmailChk(String storeEmail);
	Store selectUserInfoByName(String storeName);
	
	void insertNaverUser(nUser nuser);
	int selectNaver(nUser user);
}
