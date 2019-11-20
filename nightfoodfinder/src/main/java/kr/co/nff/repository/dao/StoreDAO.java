package kr.co.nff.repository.dao;
import java.util.List;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.Store;
public interface StoreDAO {
	// 메인 스토어 상세정보 리스트 조회
	List<Store> mainStoreList();
	
	// 메인 요일 리스트 조회
//	List<Holiday> selectHolidayListByStoreNo(int storeNo);
	
	// 카테고리 리스트
	List<Category> selectCategory();
	// 지역구 리스트
	List<String> cityList();
	// 스토어 리스트
    List<Store> storeList();
    Store selectOneStore(int no);
    List<Menu> storeMenuList(int no);
    List<Holiday> storeHoliday(int no);
    Store selectOneStore();
    List<Menu> storeMenuList();
    List<Holiday> storeHoliday();
    List<Store> adminSelectStore(SearchRe search);
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
	
	/*가게 수정*/
	//휴일 삭제
	void deleteHoliday(Store store);
	//휴일 업데이트 insert
	void updateHoliday(Store store);
	//가게정보수정
	void storeUpdateInfo(Store store);
	
	
	int adminStorePagingListCnt(SearchRe search);
}
