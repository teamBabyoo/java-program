package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Store;


public interface storeDAO {
	
	List<Store> adminSelectStore();
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
}
