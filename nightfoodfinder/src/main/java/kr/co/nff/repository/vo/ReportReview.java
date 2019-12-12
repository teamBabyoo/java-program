package kr.co.nff.repository.vo;

import lombok.Data;

@Data
public class ReportReview extends Pagination{
	private int reportNo;
	private int userNo;
	private int reviewNo;
	private String reason;
	//신고한 사람들
	private String nickName;
}
