package kr.co.nff.front.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	//전체리스트
	List<Store> storeList();
	public Store storeDetail(); //추후 int no 넣어주기
	public List<Menu> storeMenu();
	public List<Holiday> storeHoliday();
	
}

