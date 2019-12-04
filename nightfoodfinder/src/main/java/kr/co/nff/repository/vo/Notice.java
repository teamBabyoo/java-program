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
}
