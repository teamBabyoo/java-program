package kr.co.nff.front.store.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Store;

public interface StoreService {
	//전체리스트
	Map<String, Object> storeList(Search search);
	//추후 int no 넣어주기
	public Store storeDetail(int storeNo); 	
	//메뉴 가져오기
	public List<Menu> storeMenu(int storeNo);
	//휴일 가져오기
	public List<Holiday> storeHoliday(int storeNo);
	//가게 소개글 가져오기
	public Store storeContent(int storeNo);
	
	//가게 정보 수정폼으로 넘기기
	public Store storeupdateForm(int storeNo);
	public Store storeContentUpdateForm(int storeNo);
	
	//휴일 수정하기
	//휴일 집어넣기
	public void updateHoliday(Store store);
	
	// 리뷰 리스트 조회
	public List<Review> reviewList(Review review);
	
	// 리뷰 등록 & 이미지 업로드
	public int reviewRegist(Review review, boolean fileFlag) throws Exception;
	// 리뷰 이미지 가져오기
//	public List<FileVO> selectFileList(int reviewNo);
	// 리뷰 이미지
	public List<FileVO> selectFileList(HttpServletRequest req, HttpServletResponse res, Review review) throws UnsupportedEncodingException, FileNotFoundException, IOException;

	//리뷰신고
	public List<Review> reviewReport(Review review);
	
	//리뷰신고제한
	public int reviewcount(Review review);
	
	//좋아요
	public List<Review> insertLike(Review review);
	//좋아요 취소
	public List<Review> deleteLike(Review review);	
	
	//단골체크
	public int frequentCount(Store store);
	
	//단골등록
	public int frequentRegist(Store store, Notice notice);
	
	//단골 취소 
	public int frequentDelete(Store store);
	
	
	// 사장 답글 
	public List<Review> insertRecomment(Review review);
	public List<Review> deleteRecomment(Review review);
	
	//리뷰 페이징 처리를 위한
	public int getReviewCnt(int no);
	
	//메뉴 업데이트
	public void updateMenuList(Store store, int no);
	
	//파일가져오기
	public List<FileVO> getImage(int no);
	
	public int getImageCount(int storeNo);
	
	//좋아요알림
	public void insertNotice(Notice notice);
	
	public List<Integer> myfrequent(int no);
}

