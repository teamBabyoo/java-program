package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatDAO {
	
	// 방문자
	public void insertVisitor(Stat stat);
	public List<Stat> visitorList(Stat stat);
	public List<Stat> countByDate(Stat stat);
	List<Stat> statFrequentStore(Search search);
	List<Stat> statMaleFrequentStore(Search search);
	List<Stat> statFemaleFrequentStore(Search search);
}
