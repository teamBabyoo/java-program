package kr.co.nff.front.store.service;

import java.util.List;

import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	//전체리스트
	List<Store> storeList();
	//추후 int no 넣어주기
	public Store storeDetail(int no); 	
	//메뉴 가져오기
	public List<Menu> storeMenu(int no);
	//휴일 가져오기
	public List<Holiday> storeHoliday(int no);
	//가게 소개글 가져오기
	public Store storeContent(int no);
	
	//가게 정보 수정폼으로 넘기기
	public Store storeupdateForm(int no);
	public Store storeContentUpdateForm(int no);
	
	//휴일 수정하기
	//휴일 집어넣기
	public void updateHoliday(Store store);
	
	// 리뷰 리스트 조회
	public List<Review> reviewList(int no);
	
	
	
}

