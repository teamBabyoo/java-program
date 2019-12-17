package kr.co.nff.admin.stat.service;

import java.util.List;
import java.util.Map;

import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

public interface StatService {
	Map<String, Object> statFrequentStore(Search search);
	List<Stat> setRankMethod(List<Stat> statList);
	Map<String, Object> listToMap(List<Stat> statList);
}
