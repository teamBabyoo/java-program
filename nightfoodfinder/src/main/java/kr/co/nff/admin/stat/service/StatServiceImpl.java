package kr.co.nff.admin.stat.service;

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


}
