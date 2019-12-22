package kr.co.nff.front.award.service;

import java.util.List;

import kr.co.nff.repository.vo.Award;
import kr.co.nff.repository.vo.Store;

public interface AwardService {

	List<Award> listAwardStore();

	List<Store> detailAwardStore(String storeNoList);	
}
