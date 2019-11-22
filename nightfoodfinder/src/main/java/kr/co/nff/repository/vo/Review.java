package kr.co.nff.repository.vo;


import java.util.List;

import lombok.Data;

	@Data
	public class Review {
		private String nickName;
		private String storeName;
		private String reviewContent;
		private int likeCount;
		private String regDate;
		private String reComment;
		private int reviewNo;
		private String reportNickname;
		private int reportCount;
		private int storeNo;
		private int userNo;
		private int reportNo;
		
		private List<ReportReview> reportlist;
		
		private int storeScope;
		private int fileGroupCode;

		
		// 리뷰 차단, 차단 풀기
		private List<Integer> reviewNoList;
		private int status;
	}


