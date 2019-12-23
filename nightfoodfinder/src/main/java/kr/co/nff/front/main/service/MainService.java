package kr.co.nff.front.main.service;

import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.PriceType;
import kr.co.nff.repository.vo.Store;

public interface MainService {
	
	// 검색 헤더 카테고리 리스트
	List<Category> selectCategory();
	// 검색 헤더 지역구 리스트
	List<String> cityList();
	// 검색 헤더 가격 타입 리스트
	List<PriceType> selectPriceType();
	
	public void selectUser();
	
	// 메인페이지 상위 5개 스토어 조회
	List<Store> mainStoreList();
	
	
}
