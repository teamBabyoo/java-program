package kr.co.nff.repository.vo;

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
	private int status;
	private int businessNum;
	private String storeOwner;
	private int storeOwnerPh;
//	private String latitude;
//	private String longitude;
}
