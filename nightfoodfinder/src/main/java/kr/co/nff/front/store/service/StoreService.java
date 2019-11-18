package kr.co.nff.front.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	//전체리스트
	List<Store> storeList();
	//추후 int no 넣어주기
	public Store storeDetail(int no); 	
	//메뉴 가져오기
	public List<Menu> storeMenu(int no);
	//휴일 가져오기
	public List<Holiday> storeHoliday(int no);
	//가게 정보 수정폼으로 넘기기
	public Store storeupdateForm(int no);
	
}

