package kr.co.nff.repository.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class Store  {
	private int storeNo;
	private String storeName;
	private String storeEmail;
	private String storePass;
	private String storeTell;
	private String categoryName;
	private int storeCategory;
	private String openTime;
	private String closeTime;
	
	private String city;
	private String streetLoad;
	private String sggNm;
	private String zipNo;
	private String addrDetail;
	private String roadFullAddr;
	
	private String storeContent;
	private Date regDate;
	private String[] menuName;
	private int[] menuPrice;
	//private int[] price;
	private int priceTypeNo;
	private int seeCnt;
	
	private String weekName;
	private int status;
	private int businessNum;
	private String storeOwner;
	private String storeOwnerPh;
	private int frequentCnt; // 단골 수
	
	private String entX;
	private String entY;
	private String storeJoinDate;
	private int storeScopeTotal;	// 전체 평점
	private int reviewCntTotal;		// 리뷰 갯수
	
	// 평점(store_scope_total / review_cnt_total)(소수점 첫째 자리)
	private double scope;
	// 스토어 카테고리
	private String category;
	// 가격 타입 (1만원 미만..등)
	private String priceType;
	
	// ↙ 콜렉션 (메인페이지 리스트에서 사용)
	private List<Holiday> holidayList;
	
	
	//휴무일 받을 리스트 
	private List<Integer> day;
	
	// 메뉴리스트
	private List<Map<String, Object>> menulist;
	
	
	//  storeNo 받을 리스트
		private List<Integer> storeNoList;

		//단골을 위한
		private int userNo;
		//단골 체크를 위한
		private int checkit;
		
		// XY 좌표 받기
		private String longitude;
		private String latitude;
	
	private List<FileVO> fileVoList;
		
		
}
	
