package kr.co.nff.repository.dao;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatDAO {
	Stat statFrequentStore(Search search);
}
