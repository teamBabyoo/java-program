package kr.co.nff.front.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.Store;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO dao;
	
	// 가게 전체 리스트
	public List<Store> storeList(){
		return dao.storeList();
	}
}
