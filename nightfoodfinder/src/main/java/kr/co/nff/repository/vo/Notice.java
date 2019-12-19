package kr.co.nff.repository.vo;

import java.util.List;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private int userNo; // 사용자
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
	
	/*단골 유저들*/
	private List<Integer> people;
	
}
