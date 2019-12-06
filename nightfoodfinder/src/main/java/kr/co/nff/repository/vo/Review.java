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
		private int reviewNo;
		private String reComment;
		private String recomment;
		private String reportNickname;
		private int reportCount;
		private int storeNo;
		private int writerNo;
		private int reportNo;
		
//		private List<ReportReview> reportList;
		
		private int storeScope;
		private int fileGroupCode;

		
		// 리뷰 차단, 차단 풀기
		private List<Integer> reviewNoList;
		private int status;
		
		//좋아요
		private int good;
		
		//신고사유
		private int reportWhy;
		
		//리뷰번호 받기 위한
		private Integer storeReviewNo;
		
		//컬렉션 받을 좋아요 리스트
		private List<Like> reviewLikeList;
		
		private int mylikecheck;
		
		private int userNo;
	}


