package kr.co.nff.repository.vo;

import lombok.Data;

@Data
public class ReportReview {
	private int reportNo;
	private int userNo;
	private int reviewNo;
	private int reason;
}