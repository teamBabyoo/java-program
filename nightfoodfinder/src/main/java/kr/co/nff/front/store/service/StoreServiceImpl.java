package kr.co.nff.front.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Pagination;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.util.FileUpload;

@Service("kr.co.nff.front.store.service.StoreServiceImpl")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private FileUpload fileService;
	
	@Autowired
	private StoreDAO dao;
	
	// 가게 전체 리스트
	@Override
	public Map<String, Object>  storeList(Search search){
		Map<String, Object> result = new HashMap<>();
		// 지워야함
		System.out.println("llll : " + search.getPage());
		System.out.println("llll : " + search.getStartList());
		result.put("sList", dao.storeList(search));
		result.put("pi", new Pagination(1, dao.storeListCnt(search), 2, 3));
		return result;
	}

	@Override
	public Store storeDetail(int no) {
		return dao.selectOneStore(no);
	}

	@Override
	public List<Menu> storeMenu(int storeNo) {
		return dao.storeMenuList(storeNo);
	}

	@Override
	public List<Holiday> storeHoliday(int no) {
		return dao.storeHoliday(no);
	}
	
	public Store storeContent(int no) {
		return dao.selectContent(no);
	}


	@Override
	public Store storeupdateForm(int no) {
		return dao.selectOneStore(no);
	}
	
	//소개글 수정폼으로 보냄
	public Store storeContentUpdateForm(int no) {
		return dao.selectContent(no);
	}
	

	

	@Override
	public void updateHoliday(Store store) {
		dao.storeUpdateInfo(store);
		dao.deleteHoliday(store);
		dao.updateHoliday(store);
		dao.storeContentUpdate(store);
	}
	
	public List<Review> reviewList(Review review) {
//		System.out.println("댓글 리스트 요청  OK");
		return dao.selectReview(review);
	}
	
	public List<Review> updateReview(Review review){
		dao.updateReview(review);
		return dao.selectReview(review);
	}
	
	//신고하기
	public List<Review> reviewReport(Review review) {
		dao.reportReview(review);
		return dao.selectReview(review);
	}

	@Override
	public List<Review> reviewRegist(Review review, boolean fileFlag) throws Exception {
		int fileGroupCode = 0;
		if (fileFlag == true) {
//			System.out.println("파일 올바르게 넘어옴");
//			System.out.println("파일서비스 갔다오기 전 : " + fileGroupCode);
			fileGroupCode = fileService.upload(review.getAttach());
			review.setFileGroupCode(fileGroupCode);
		}
//		System.out.println("파일서비스 갔다오기 전 (파일 올렸으면 숫자, 안 올렸으면 0): " + fileGroupCode);
		dao.registReview(review);
		
		return dao.selectReview(review);
	}
	
	//리뷰 신고제한
	public int reviewcount(Review review) {
		return dao.reviewcount(review);
	}
	
	//좋아요
	public List<Review> insertLike(Review review){
		dao.insertLike(review);
		return dao.selectReview(review);
	}
	//좋아요 취소
	public List<Review> deleteLike(Review review){
		dao.deleteLike(review);
		return dao.selectReview(review);
	}
	
	// 단골인지 체크
	public int frequentCount(Store store) {
		return dao.checkfrequent(store);
	}
	
	public int frequentRegist(Store store) {
		 dao.frequentRegist(store);
		 return dao.checkfrequent(store);
	}
	
	public int frequentDelete(Store store) {
		 dao.frequentDelete(store);
		 return dao.checkfrequent(store);
	}

	
	
	// 사장 답글 등록, 수정
	public List<Review> insertRecomment(Review review) {
		dao.insertRecomment(review);
		return dao.selectReview(review);
		}

	// 사장 답글 삭제
	public List<Review> deleteRecomment(Review review) {
		dao.deleteRecomment(review.getReviewNo());
		return dao.selectReview(review);
	}
	
	
	//리뷰 페이징을 위한
	public int getReviewCnt(int no) {
		return dao.getReviewCnt(no);
	}
	
	//메뉴 업데이트
	public void updateMenuList(Store store, int no) {
		dao.deleteMenuList(no);
		dao.insertMenuList(store);
	}
	


	@Override
	public List<FileVO> getImage(int no) {
		return dao.getImage(no);
	}
	
	public int getImageCount(int storeNo) {
		return dao.getImageCount(storeNo);
	}


}
