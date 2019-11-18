package kr.co.nff.repository.dao;

import java.util.List;


import kr.co.nff.repository.vo.Review;
import kr.co.nff.repository.vo.SearchRe;



public interface ReviewDAO {
	List<Review> selectReview(SearchRe search);
	int pagingGetListCnt(SearchRe search);
}
