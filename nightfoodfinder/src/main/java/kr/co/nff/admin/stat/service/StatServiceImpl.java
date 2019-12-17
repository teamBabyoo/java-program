package kr.co.nff.admin.stat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StatDAO;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

@Service("kr.co.nff.admin.stat.service.StatServiceImpl")
public class StatServiceImpl implements StatService{

	@Autowired
	private StatDAO dao;
	
	@Override
	public Stat statFrequentStore(Search search) {
		return dao.statFrequentStore(search);
	}
	
	@Override
	public void insertVisitor(Stat stat) {
		dao.insertVisitor(stat);
	}
	
	@Override
	public Stat visitorList() {
		return dao.visitorList();
	}
	
	@Override
	public List<Stat> countByDate() {
		return dao.countByDate();
	}
	
	@Override
	public Stat countJoinUser() {
		return dao.countJoinUser();
	}
	
	@Override
	public Stat countJoinStore() {
		return dao.countJoinStore();
	}
	
	


}
