package kr.co.nff.repository.dao;
import java.util.List;
import java.util.Map;

import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.FileVO;
import kr.co.nff.repository.vo.Holiday;
import kr.co.nff.repository.vo.Menu;
import kr.co.nff.repository.vo.PriceType;
import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.Search;
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
	// 가격 타입 리스트
	List<PriceType> selectPriceType();
	// 스토어 리스트
    List<Store> storeList(Search search);
    // 스토어 검색 결과의 전체 크기
    int storeListCnt(Search search);
    
    Store selectOneStore(int no);
    Store selectContent(int no);
    List<Menu> storeMenuList(int storeNo);
    List<Holiday> storeHoliday(int no);
    List<Menu> storeMenuList();
    List<Holiday> storeHoliday();
    List<Store> adminSelectStore(Search search);
	Store adminSelectOneStore(int no);
	void adminDeleteStore(int no);
	void adminStatusStore(int no);
	//admin 권한으로 store 활동정지
	void withdrawStore(Store store);
	
	/*가게 수정*/
	//휴일 삭제
	void deleteHoliday(Store store);
	//휴일 업데이트 insert
	void updateHoliday(Store store);
	//가게정보수정
	void storeUpdateInfo(Store store);
	//가게 소개글 수정
	void storeContentUpdate(Store store);
	
	
	int adminStorePagingListCnt(Search search);
	
	
	
	/*가게 리뷰*/
	//리뷰 리스트
	List<Review> selectReview(Review review);
	//리뷰등록
	int registReview(Review review);
	//리뷰수정
	void updateReview(Review review);
	//리뷰삭제
	void deleteReview(int no);
	// 리뷰 등록시 스토어테이블 업데이트
	int updateStoreByReview(Map<String, Object> map);
	
	
	//리뷰신고
	void reportReview(Review review);
	
	//리뷰신고 제한수 
	int reviewcount(Review review);
	
	//좋아요
	void insertLike(Review review);
	//좋아요취소
	void deleteLike(Review review);
		
	//단골 체크 
	int checkfrequent(Store store);
	//단골등록
	void frequentRegist(Store store);
	//단골취소
	void frequentDelete(Store store);
	
	// 사장 답글 등록, 수정
	void insertRecomment(Review review);
	// 사장 답글 삭제
	void deleteRecomment(int reviewNo);
	
	
	
	//리뷰페이징을 위한 
	int getReviewCnt(int no);
	
	//메뉴 삭제
	void deleteMenuList(int no);
	//메뉴 수정(등록)
	void insertMenuList(Store store);
	
	List<FileVO> getImage(int no);
	
	int getImageCount(int storeNo);
	
	void updateStoreSeeCnt(int no);
	
	//나의 단골가져오기
	List<Integer> myfrequent(int no);
	
	//주소 업데이트하기
	void updateStoreAddr(Store store);
}
