package kr.co.nff.util;

import kr.co.nff.repository.vo.Review;

public interface FileUpload {
	// 이미지 업로드하는 리뷰등록
	public int upload(Review review) throws Exception;
	
}
