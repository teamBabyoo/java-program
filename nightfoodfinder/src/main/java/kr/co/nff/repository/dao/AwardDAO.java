package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Award;
import kr.co.nff.repository.vo.Store;

public interface AwardDAO {

	List<Award> listAwardStore();	
	Store detailAwardStore(int storeNo);
	Award awardStore(int awardNo);
	
}
