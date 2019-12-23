package kr.co.nff.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Award {
	private int awardNo;
	private String userGender;
	private String userAge;
	private String StoreNoList;
	private Date regDate;
}
