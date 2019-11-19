package kr.co.nff.front.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Store;

@org.springframework.stereotype.Service
public class FrontServiceImpl implements FrontService {
	@Autowired
	private UserDAO dao;

	@Autowired
	private StoreDAO sdao;
	
	// 검색 헤더 카테고리
	@Override
	public List<Category> selectCategory() {
//		System.out.println("serviceImpl : " + sdao.selectCategory());
		return sdao.selectCategory(); 
	}
	
	// 메인페이지 상위 5개 스토어 조회
	public List<Store> mainStoreList() {
//		return sdao.storeList();
		return sdao.mainStoreList();
	}

	@Override
	public void selectUser() {
		
	}

}
 