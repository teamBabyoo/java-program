package kr.co.nff.admin.stat.service;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatService {
	Stat statFrequentStore(Search search);
}
