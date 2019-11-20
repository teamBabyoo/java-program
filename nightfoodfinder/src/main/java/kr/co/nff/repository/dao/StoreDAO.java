package kr.co.nff.repository.dao;
import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;
public interface StoreDAO {
	// 메인 스토어 상세정보 리스트 조회
	List<Store> mainStoreList();
	
	// 메인 요일 리스트 조회
//	List<Holiday> selectHolidayListByStoreNo(int storeNo);
	
	// 카테고리 리스트
	List<Category> selectCategory();
	// 스토어 리스트
    List<Store> storeList();
    Store selectOneStore(int no);
    List<Menu> storeMenuList(int no);
    List<Holiday> storeHoliday(int no);
    Store selectOneStore();
    List<Menu> storeMenuList();
    List<Holiday> storeHoliday();
    List<Store> adminSelectStore();
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
}
