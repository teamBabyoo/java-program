package kr.co.nff.front.award.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.AwardDAO;
import kr.co.nff.repository.vo.Award;
import kr.co.nff.repository.vo.Store;


@Service("kr.co.nff.front.award.service.AwardServiceImpl")
public class AwardServiceImpl implements AwardService {

	@Autowired
	private AwardDAO dao;

	@Override
	public List<Award> listAwardStore() {
		return dao.listAwardStore();
	}
	
	@Override
	public List<Store> detailAwardStore(String storeNoList) {
		List<Store> storeList = new ArrayList<>();
		String[] storeString = storeNoList.split(",");
		for (int i = 0; i < storeString.length; i++) {
			String storeNo = storeString[i];
			storeList.add(i, (Store) dao.detailAwardStore(Integer.parseInt(storeNo)));
		}
		return storeList;
	}

	@Override
	public Award awardStore(int awardNo) {
		Award award = dao.awardStore(awardNo);
		String userAge = award.getUserAge();
		String[] userAgeArr = userAge.split("0",2);
		if(userAgeArr[0] != null) {
			award.setUserAge(userAgeArr[0] + "0대");
		}
		return award;
	}
	
}
