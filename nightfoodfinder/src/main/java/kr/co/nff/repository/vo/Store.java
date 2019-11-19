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
	private int storeTell;
	private String categoryName;
	private int storeCategory;
	private String openTime;
	private String closeTime;
	private int areaCode;
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
	private int storeOwnerPh;
	
	private String latitude;
	private String longitude;
	private String storeJoinDate;
	private int storeScopeTotal;
	private int reviewCntTotal;
	
	// 리뷰테이블에서 가져온 평점!(소수점 첫째 자리)
	private double scope;
	// 리뷰 갯수
	private int rcount;
	// 스토어 카테고리
	private String category;
	
	// ↙ 콜렉션 (메인페이지 리스트에서 사용)
	private List<Holiday> holidayList;
}
	
