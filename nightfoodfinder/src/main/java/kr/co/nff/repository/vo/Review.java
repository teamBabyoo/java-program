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
		private List<Integer> reviewNo;
		private int status;
	}


