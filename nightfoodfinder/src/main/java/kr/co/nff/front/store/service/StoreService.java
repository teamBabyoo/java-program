package kr.co.nff.front.store.service;

import java.util.List;

import com.sun.glass.ui.Menu;

import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	public Store storeDetail(); //추후 int no 넣어주기
	public List<Menu> storeMenu();
	public List<Holiday> storeHoliday();

}
