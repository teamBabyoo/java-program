package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;

public interface StoreDAO {
	public List<Store> storeList();
	Store selectOneStore();
	List<Menu> storeMenuList(); 
	List<Holiday> storeHoliday();
}
