package kr.co.nff.repository.dao;
import java.util.List;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Store;
public interface StoreDAO {
    public List<Store> storeList();
    Store selectOneStore(int no);
    List<Menu> storeMenuList(int no);
    List<Holiday> storeHoliday(int no);
    List<Store> adminSelectStore();
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
}
