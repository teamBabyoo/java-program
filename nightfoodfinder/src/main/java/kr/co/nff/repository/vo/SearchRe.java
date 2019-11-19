package kr.co.nff.repository.vo;


public class SearchRe extends Pagination {
	private String type;
	private String keyword;
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
}
