package kr.co.nff.front.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.Store;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private StoreDAO sDao;
	
	@Override
	public void selectUser() {
		
	}
	
	public List<Store> storeList() {
//		System.out.println("서비스OK");
//		System.out.println("서비스 : " + sDao.storeList());
		return sDao.storeList();
	}

}
