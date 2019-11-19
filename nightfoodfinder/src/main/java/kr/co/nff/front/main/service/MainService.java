package kr.co.nff.front.main.service;

import java.util.List;

import kr.co.nff.repository.vo.Store;

public interface MainService {
	public void selectUser();
	
	// 메인페이지 상위 5개 스토어 조회
	List<Store> storeList();
}
