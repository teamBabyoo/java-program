package kr.co.nff.repository.dao;
import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;
public interface StoreDAO {
	// 카테고리 리스트
	List<Category> selectCategory();
	// 스토어 리스트
    List<Store> storeList();
    Store selectOneStore();
    List<Menu> storeMenuList();
    List<Holiday> storeHoliday();
    List<Store> adminSelectStore();
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
}