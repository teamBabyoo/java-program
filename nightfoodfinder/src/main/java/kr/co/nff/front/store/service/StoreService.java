package kr.co.nff.front.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Store;

public interface StoreService {
	// 전체 리스트
	List<Store> storeList();
}
