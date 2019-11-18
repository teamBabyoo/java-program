package kr.co.nff.admin.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.storeDAO;
import kr.co.nff.repository.vo.Store;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private storeDAO dao;
	
	public List<Store> listStore() {
		return dao.adminSelectStore();
	}

	public Store detailStore(int no) {
		return dao.adminSelectOneStore(no);
	}

	public void deleteStore(int no) {
		dao.adminDeleteStore(no);
	}
	public void statusStore(int no) {
		dao.adminStatusStore(no);
	}

}
