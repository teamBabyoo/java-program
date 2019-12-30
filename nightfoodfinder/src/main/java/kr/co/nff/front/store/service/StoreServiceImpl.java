package kr.co.nff.front.store.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.FileDAO;
import kr.co.nff.repository.dao.NoticeDAO;
import kr.co.nff.repository.dao.StoreDAO;
import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Pagination;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.util.FileDownload;
import kr.co.nff.util.FileUpload;

@Service("kr.co.nff.front.store.service.StoreServiceImpl")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private FileUpload fileUpService;
	@Autowired
	private FileDownload fileDnService;
	
	@Autowired
	private StoreDAO dao;
	@Autowired FileDAO fDao;
	@Autowired NoticeDAO noticeDAO;
	
	/* 가게 전체 리스트 */
	@Override
	public Map<String, Object> storeList(Search search){
		Map<String, Object> result = new HashMap<>();
		result.put("search", search);
		result.put("sList", dao.storeList(search));
		result.put("pi", new Pagination(search.getPage(), dao.storeListCnt(search), 10, 5));
		return result;
	}
	
	/* 내 주변 맛집 기능 */
	@Override
	public Map<String, Object> surroundingStore(Search search) {
		Map<String, Object> result = new HashMap<>();
		result.put("search", search);
		result.put("sList", dao.surroundingStoreCnt(search));
		result.put("pi", new Pagination(search.getPage(), dao.surroundingStoreCnt(search), 10, 5));
		return result;
	}
	

	@Override
	public Store storeDetail(int no) {
		/*조회수 올리기*/
		dao.updateStoreSeeCnt(no);
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
		dao.updateStoreAddr(store);
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

	// 리뷰등록
	@Override
	public int reviewRegist(Review review, boolean fileFlag) throws Exception {
		int fileGroupCode = 0;
		if (fileFlag == true) {
//			System.out.println("파일 올바르게 넘어옴");
//			System.out.println("파일서비스 갔다오기 전 : " + fileGroupCode);
//			fileGroupCode = fileUpService.upload(review.getAttach());
			fileGroupCode = fileUpService.upload(review);
			review.setFileGroupCode(fileGroupCode);
		}
//		System.out.println("파일서비스 갔다오기 전 (파일 올렸으면 숫자, 안 올렸으면 0): " + fileGroupCode);
		// ---------- 망하면 여기 주석 풀기
//		dao.registReview(review);
//		return dao.selectReview(review);
		// --------------------------
		return dao.registReview(review);
	}
	
	// 리뷰 등록시 가게테이블 총 리뷰수, 총 별점 업데이트
	@Override
	public int updateStoreByAddReview(Map<String, Object> map) {
		return dao.updateStoreByAddReview(map);
	}
	// 리뷰 이미지 노출
	public void getReviewImg(HttpServletRequest req, HttpServletResponse res, Review review) throws ServletException, IOException {
		fileDnService.download(req, res, review);
	}

	// 이미지 다운로드 하지 않으면서 그냥 경로로 가져오기
	@Override
	public List<FileVO> selectFileList(HttpServletRequest req, HttpServletResponse res, Review review) throws IOException {
		List<FileVO> fList = new ArrayList<>(); 
		fList = fDao.selectFileList(review.getReviewNo());
		
		return fList;
	}

	// 리뷰 삭제
	public int deleteReview(int no) {
		return dao.deleteReview(no);
	}

	// 리뷰를 삭제하면 store테이블이 총 별점, 총 리뷰개수를 업데이트한다
	public int updateStoreByDelReview(Map<String, Object> map) {
		return dao.updateStoreByDelReview(map);
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
	
	public int frequentRegist(Store store, Notice notice) {
		 dao.frequentRegist(store);
		 noticeDAO.insertNotice(notice);
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
	
	
	/*알림*/
	public void insertNotice(Notice notice) {
		noticeDAO.insertNotice(notice);
	}
	
	public List<Integer> myfrequent(int no){
		return dao.myfrequent(no);
	}

}
