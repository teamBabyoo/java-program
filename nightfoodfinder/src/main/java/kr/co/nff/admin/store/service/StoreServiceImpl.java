package kr.co.nff.admin.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.SearchRe;
import kr.co.nff.repository.vo.Store;

@Service("kr.co.nff.admin.store.service.StoreServiceImpl")
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO dao;
	
	public List<Store> listStore(SearchRe search) {
		return dao.adminSelectStore(search);
	}

//	public Store detailStore(int no) {
//		return dao.adminSelectOneStore(no);
//	}

	public void deleteStore(int no) {
		dao.adminDeleteStore(no);
	}
	public void statusStore(int no) {
		dao.adminStatusStore(no);
	}
	public int GetListCnt(SearchRe search) {
		return dao.adminStorePagingListCnt(search);
	}
}
