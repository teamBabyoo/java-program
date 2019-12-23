package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;
import kr.co.nff.repository.vo.User;

public interface StatDAO {
	
	// 방문자
	public void insertVisitor(Stat stat);
	public Stat visitorList();
	public List<Stat> countByDate();
	
	// 가입자
	public Stat countJoinUser();
	public Stat countJoinStore();
	
	public void insertAward(Search search);
	public void deleteAward(Search search);
	
	List<Stat> statFrequentStore(Search search);
	List<Stat> statMaleFrequentStore(Search search);
	List<Stat> statFemaleFrequentStore(Search search);
}
