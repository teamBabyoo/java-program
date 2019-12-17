package kr.co.nff.repository.vo;


import java.util.Date;

import lombok.Data;

@Data
public class Stat {
	private int storeNo;
	private String storeName;
	private String storeEmail;
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
	
	private String storeJoinDate;
	private int storeScopeTotal;	// 전체 평점
	private int reviewCntTotal;		// 리뷰 갯수
	
	// 평점(store_scope_total / review_cnt_total)(소수점 첫째 자리)
	private double scope;

	private int userNo;
	private String userEmail;
	private String nickName;
	private Date joinDate;
	private int userType;
	private String userGender;
	private String userId;
	private String userName;
	private String userAge;
	
	//단골 count
	private int fqCount;
	
	// 랭킹
	private int rank;
	
}
