package kr.co.nff.admin.store.service;

import java.util.List;

import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

public interface StoreService {
	List<Store> listStore(SearchRe search);
//	Store detailStore(int no);
	void deleteStore(int no);
	void statusStore(int no);
	int GetListCnt(SearchRe search);
	void withdrawStore(Store store);
}
