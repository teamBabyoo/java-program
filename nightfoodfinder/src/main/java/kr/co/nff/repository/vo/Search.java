package kr.co.nff.repository.vo;

import java.util.ArrayList;
import java.util.List;

public class Search extends Page {
	
	
	public Search() {
		super();
	}
	
	public Search(int pageNo) {
		super(pageNo);
	}
	
	public Search(int pageNo, int listSize) {
		super(pageNo, listSize);
	}

	private String type;  // 어떤 컬럼을 검색할지 타입선택 예) 스토어이름, 이메일, 닉네임 
	private String keyword;  // 검색어
	private int storeNo;
	private int[] categoryCode;
	private String filter;
	private String email;
	private List<String[]> types;
	private List<String[]> filters;
	private int[] addrCode;
	private String addrCodes;
	
	
	public String getAddrCodes() {
		return addrCodes;
	}

	public void setAddrCodes(String addrCodes) {
		this.addrCodes = addrCodes;
	}

	public int[] getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(int[] addrCode) {
		this.addrCode = addrCode;
	}
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public void setTypes(List<String[]> types) {
		this.types = types;
	}

	public void setFilters(List<String[]> filters) {
		this.filters = filters;
	}

	public List<String[]> getTypes() {
		return types;
	}

	public List<String[]> getFilters() {
		return filters;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int[] getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int[] categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	
	// 리스트 정렬
	public void setFilters(String ...strings) {
		List<String[]> list = new ArrayList<>();
		for(String filter : strings) {			
			switch (filter) {
			case "일자": case "개설날짜":
				list.add(new String [] {"regDate",filter});
				break;
			case "조회수":
				list.add(new String [] {"seeCnt",filter});
				break;
			case "별점":
				list.add(new String [] {"score",filter});
				break;
			case "신청일":
				list.add(new String [] {"partDate",filter});
				break;
			case "신고사유":
				list.add(new String [] {"reseaon",filter});
				break;
			case "신고된 횟수":
				list.add(new String [] {"rpcount",filter});
				break;
			}
		}
		
		this.filters = list;
	}
	
	// 검색할 컬럼
	public void setTypes(String ...strings) {
		List<String[]> list = new ArrayList<>();
		for(String type : strings) {			
			switch (type) {
			case "스토어이름":
				list.add(new String [] {"name",type});
				break;
			case "글쓴이": case "이메일":
				list.add(new String [] {"email",type});
				break; 
			case "내용":
				list.add(new String [] {"content",type});
				break;
			case "신고사유":
				list.add(new String [] {"reseaon",type});
				break;
			case "신고된 사람":
				list.add(new String [] {"reportTarget",type});
				break;
			}
		}
		
		this.types = list;

	}

}
