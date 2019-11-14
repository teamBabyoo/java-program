package kr.co.nff.repository.vo;

import java.util.Date;
import lombok.Data;

@Data
public class Store {
	private int storeNo;
	private String storeName;
	private String storeEmail;
	private int storeTell;
	private String storeCategory;
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
}