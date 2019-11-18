package kr.co.nff.front.main.service;

import java.util.List;

import kr.co.nff.repository.vo.Category;

public interface Service {
	
	// 검색 헤더 카테고리 리스트
	List<Category> selectCategory();
	public void selectUser();
	
}
