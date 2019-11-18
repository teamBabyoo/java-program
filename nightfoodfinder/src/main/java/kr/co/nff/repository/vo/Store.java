package kr.co.nff.repository.vo;

import java.util.Date;
import lombok.Data;

@Data
public class Store {
	private int storeNo;
	private String storeName;
	private String storeEmail;
	private String storePass;
	private int storeTell;
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
	private String weekName;
	private int status;
	private int businessNum;
	private String storeOwner;
	private int storeOwnerPh;
	
	// 리뷰테이블에서 가져온 평점!(소수점 첫째 자리)
	private double scope;
	// 리뷰 갯수
	private int rcount;
	// 스토어 카테고리
	private String category;
}
	
