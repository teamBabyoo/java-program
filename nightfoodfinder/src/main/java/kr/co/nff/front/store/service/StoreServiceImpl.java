package kr.co.nff.front.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.glass.ui.Menu;

import kr.co.nff.repository.dao.storeDAO;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Store;

@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	private storeDAO dao;

	@Override
	public Store storeDetail() {
		return dao.selectOneStore();
	}

	@Override
	public List<Menu> storeMenu() {
		return dao.storeMenuList();
	}

	@Override
	public List<Holiday> storeHoliday() {
		return dao.storeHoliday();
	}
}
