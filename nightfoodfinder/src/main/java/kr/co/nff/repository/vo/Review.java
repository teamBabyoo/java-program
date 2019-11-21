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
		
		// 리뷰 차단, 차단 풀기
		private List<Integer> reviewNoList;
		private int status;
	}


