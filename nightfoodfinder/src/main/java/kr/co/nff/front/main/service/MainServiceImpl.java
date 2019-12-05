package kr.co.nff.front.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.NoticeDAO;
import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Store;

@Service("kr.co.nff.front.main.service.MainServiceImpl")
public class MainServiceImpl implements MainService{
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private StoreDAO sDao;
	
	
	
	// 검색 헤더 카테고리
	@Override
	public List<Category> selectCategory() {
		return sDao.selectCategory(); 
	}
	
	// 검색 헤더 지역구
	@Override
	public List<String> cityList() {
		return sDao.cityList();
	}

	
	@Override
	public void selectUser() {
		
	}
	
	// 메인페이지 상위 5개 스토어 조회
	public List<Store> mainStoreList() {
//		return sdao.storeList();
		return sDao.mainStoreList();
	}
	

}
