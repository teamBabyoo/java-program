package kr.co.nff.admin.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Store;

public interface StoreService {
	List<Store> listStore();
	Store detailStore(int no);
	void deleteStore(int no);
	void statusStore(int no);
}
