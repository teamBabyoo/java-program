package kr.co.nff.repository.vo;

public class Page {
	private int pageNo;  // 현재 페이지 번호
	private int listSize;  // 한 페이지당 보여줄 게시글의 갯수

	public Page() {
		this(1,10);
	}
	
	public Page(int pageNo) {
		this(pageNo, 10);
	}
	
	
	public Page(int pageNo, int listSize) {
		this.pageNo = pageNo;
		this.listSize = listSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public int getBegin() {
		return (pageNo - 1) * listSize;
	}
	
	public int getEnd() {
		return pageNo * listSize;
	}
	
}
