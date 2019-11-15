package kr.co.nff.repository.vo;

import java.util.Date;

import lombok.Data;

	@Data
	public class Review {
		private String nickName;
		private String storeName;
		private String reviewContent;
		private int likeCount;
		private Date regDate;
		private String recomment;
	}


