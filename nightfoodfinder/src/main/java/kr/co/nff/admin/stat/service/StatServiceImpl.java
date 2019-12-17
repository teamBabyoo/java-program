package kr.co.nff.admin.stat.service;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StatDAO;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;

@Service("kr.co.nff.admin.stat.service.StatServiceImpl")
public class StatServiceImpl implements StatService{

	@Autowired
	private StatDAO dao;
	
	// 통계 랭킹 알고리즘 (동순위 고려)
	@Override
	public List<Stat> setRankMethod(List<Stat> statList) {
		int i = 0;
		int j = 0;
		int k = 0;
		int xFq = 0;
		for (Stat stat : statList) {
			if (stat.getFqCount() != xFq) {
				i = (j + i + 1);
				j = 0;
			}
			else j++;
			stat.setRank(i);
			System.out.println(stat.getStoreName() + " : " + stat.getRank());
			xFq = stat.getFqCount();
			
			k++;
			
			if (k == statList.size()) {
				i = 0;
				j = 0;
				k = 0;
				xFq = 0;
				System.out.println("------------------");
			}
		}
		System.out.println("<------------------>");
		return statList;
	}
	
	
	

	// 통계 그래프를 위해 컬럼별 list로 묶어주기 (최대 10위까지)
	@Override
	public Map<String, Object> listToMap(List<Stat> statList){
		List<Object> rankList = new ArrayList<>();
		List<Object> storeNameList = new ArrayList<>();
		List<Object> fqCountList = new ArrayList<>();
					
		Map<String, Object> statMap = new HashMap<>();
		
		int k = 0;
		
		for (Stat stat : statList) {	
			if (k < 10) {
				//그래프 순위 가게 이름 앞에 붙이기 
				if (stat.getRank() != 0)
			stat.setStoreName(stat.getRank() + "위  " + stat.getStoreName());
			rankList.add(k, stat.getRank());
			storeNameList.add(k, stat.getStoreName());
			fqCountList.add(k, stat.getFqCount());
			}
			if (k == 10 || k + 1 == statList.size()) {
				statMap.put("rankList", rankList);
				statMap.put("storeNameList", storeNameList);
				statMap.put("fqCountList", fqCountList);
				break;
			}
			k++;
		}	
		return statMap;
	}
	
	//위의 두 메서드를 사용해서 그래프에 뿌리기 쉬운 형태로 list 변형
	@Override
	public Map<String, Object> statFrequentStore(Search search) {
		
		Map<String, Object> allMap = listToMap(setRankMethod(dao.statFrequentStore(search)));
		Map<String, Object> maleMap = listToMap(setRankMethod(dao.statMaleFrequentStore(search)));
		Map<String, Object> femaleMap = listToMap(setRankMethod(dao.statFemaleFrequentStore(search)));
		
		Map<String, Object> statMap = new HashMap<>();
		statMap.put("allMap", allMap);
		statMap.put("maleMap", maleMap);
		statMap.put("femaleMap", femaleMap);
	
		
		return statMap;
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
