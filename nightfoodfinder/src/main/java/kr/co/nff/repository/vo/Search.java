package kr.co.nff.repository.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Search extends Pagination {
	
	public Search() {
		super();
	}
	
	public Search(int pageNo, int listSize) {
		super(pageNo, listSize);
	}
	private String totalType;
	private String type;  
	private String types;  // 다중 type 검색
	private String keyword;  // 검색어          (이름, 지역, 메뉴 예정 - 스토어리스트)
	private int[] categoryCode; // 카테고리 : 중복허용
	private int[] priceType; // 가격대 : 중복허용
	private String[] cities; // 주소 : 중복허용 (구단위)
	private int includeClosed; // 영업끝난 가게 결과 포함하기 (1: 포함, 0: 포함안함 -> default가 1)
	
	private String filter;
	private List<String[]> filters;

	
	// 리스트 정렬
	public void setFilters(String ...strings) {
		List<String[]> list = new ArrayList<>();
		for(String filter : strings) {			
			switch (filter) {
			case "평점":
				list.add(new String [] {"scope",filter});
				break;
			case "조회수":
				list.add(new String [] {"seeCnt",filter});
				break;
			case "리뷰수":
				list.add(new String [] {"rcount",filter});
				break;
			}
		}
		
		this.filters = list;
	}
	
}
