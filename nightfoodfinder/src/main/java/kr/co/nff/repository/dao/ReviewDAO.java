package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Review;

public interface ReviewDAO {
	List<Review> selectReview();
}
