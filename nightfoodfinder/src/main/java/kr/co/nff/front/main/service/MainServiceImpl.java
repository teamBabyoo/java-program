package kr.co.nff.front.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.front.award.service.AwardService;
import kr.co.nff.repository.dao.AwardDAO;
import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.dao.UserDAO;
import kr.co.nff.repository.vo.Award;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.PriceType;
import kr.co.nff.repository.vo.Store;

@Service("kr.co.nff.front.main.service.MainServiceImpl")
public class MainServiceImpl implements MainService{
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private StoreDAO sDao;

	@Autowired
	private AwardDAO aDao;
	
	@Autowired
	private AwardService awdService;
	
	
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
	public List<PriceType> selectPriceType() {
		return sDao.selectPriceType();
	}
	
	

	
	@Override
	public void selectUser() {
		
	}
	
	// 메인페이지 상위 5개 스토어 조회
	public List<Store> mainStoreList() {
//		return sdao.storeList();
		return sDao.mainStoreList();
	}
	
	// 메인 어워즈 조회
	public List<Store> mainAwardList() {
		List<Award> awardList = awdService.listAwardStore();
		
		List<Store> storeList = new ArrayList<>();
		Iterator iterator = awardList.iterator();
		for (Award a : awardList) {
			String[] storeString = a.getStoreNoList().split(",");
			for (int i = 0; i < storeString.length; i++) {
				String storeNo = storeString[i];
				a.setStoreList(storeList);
				storeList.add(i, aDao.detailAwardStore(Integer.parseInt(storeNo)));
			}
		}
		return storeList;
	}
	
	// 메인 어워즈 조회2
	public List<Map<String, Object>> mainAwardList2() {
		List<Map<String, Object>> result = new ArrayList<>();
		List<Award> awardList = aDao.listAwardStore();
		for (Award a : awardList)  {
			List<Store> storeList = new ArrayList<>();
			String[] strStoreNo = a.getStoreNoList().split(",");
			for (int i = 0; i < strStoreNo.length; i++) {
				String storeNo = strStoreNo[i];
				Store store = aDao.detailAwardStore(Integer.parseInt(storeNo));
				storeList.add(i, store);
			}
			Map<String, Object> map = new HashMap<>();
			map.put("gender", a.getUserGender());
			map.put("age", a.getUserAge().substring(0,  2));
			map.put("list", storeList);
			result.add(map);
		}
		return result;
	}
}
