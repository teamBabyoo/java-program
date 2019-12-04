package kr.co.nff.repository.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Store {
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
	private String storeContent;
	private Date regDate;
	private String menu;
	private int price;
	private int priceType; // 가격대
	private int seeCnt;
	
	private String weekName;
	private int status;
	private int businessNum;
	private String storeOwner;
	private String storeOwnerPh;
	
	private String latitude;
	private String longitude;
	private String storeJoinDate;
	private int storeScopeTotal;	// 전체 평점
	private int reviewCntTotal;		// 리뷰 갯수
	
	// 평점(store_scope_total / review_cnt_total)(소수점 첫째 자리)
	private double scope;
	// 스토어 카테고리
	private String category;
	
	// ↙ 콜렉션 (메인페이지 리스트에서 사용)
	private List<Holiday> holidayList;
	
	
	//휴무일 받을 리스트 
	private List<Integer> day;
	
	
	//  storeNo 받을 리스트
		private List<Integer> storeNoList;

		//단골을 위한
		private int userNo;
		//단골 체크를 위한
		private int checkit;
		
}
	
