package kr.co.nff.admin.stat.service;

import java.util.List;
<<<<<<< HEAD
=======
import java.util.Map;
>>>>>>> karam/admin-user

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatService {
	
	void insertVisitor(Stat stat);
	List<Stat> visitorList(Stat stat);
	List<Stat> countByDate(Stat stat);
	Map<String, Object> statFrequentStore(Search search);
	List<Stat> setRankMethod(List<Stat> statList);
	Map<String, Object> listToMap(List<Stat> statList);
}
