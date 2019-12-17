package kr.co.nff.admin.stat.service;

import java.util.List;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatService {
	Stat statFrequentStore(Search search);
	
	void insertVisitor(Stat stat);
	List<Stat> visitorList(Stat stat);
	List<Stat> countByDate(Stat stat);
}
