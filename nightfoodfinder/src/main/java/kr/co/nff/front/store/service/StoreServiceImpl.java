package kr.co.nff.front.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.Store;

public class StoreServiceImpl {
	
	@Autowired
	private StoreDAO dao;
	
	// 가게 전체 리스트
	public List<Store> storeList(){
		return dao.storeList();
	}
}
