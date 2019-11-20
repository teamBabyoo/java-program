package kr.co.nff.repository.dao;

import kr.co.nff.repository.vo.Store;

public interface LoginDAO {
	void insertStore(Store store);
	int storeEmailChk(String storeEmail);
	Store selectUserInfoByName(String storeName);
}
