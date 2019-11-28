package kr.co.nff.admin.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	List<Store> listStore(Search search);
//	Store detailStore(int no);
	void deleteStore(int no);
	void statusStore(int no);
	int GetListCnt(Search search);
	void withdrawStore(Store store);
	List<Category> selectCategory();
}
