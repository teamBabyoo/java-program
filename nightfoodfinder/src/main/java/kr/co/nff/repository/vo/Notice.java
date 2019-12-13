package kr.co.nff.repository.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private int userNo;
	private int storeNo;
	private String regDate;
	private String noticeCode;
	private int status;
	/* 알림을 준 유저 */
	private int fromUserNo;
	private int fromStoreNo;
	private String fromUserName; // 여긴 닉네임
	private String fromStoreName;
	
	private String noticeContent;
	
}
