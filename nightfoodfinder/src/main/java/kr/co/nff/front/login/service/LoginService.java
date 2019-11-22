package kr.co.nff.front.login.service;

import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.nUser;

public interface LoginService {
	void insertStore(Store store);
	Store selectUserInfoByName(String storeName);
	public int storeEmailChk(String storeEmail);
	
	void insertNaverUser(nUser user);
	int selectNaver(nUser user);
}
