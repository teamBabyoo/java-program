package kr.co.nff.repository.vo;

import lombok.Data;

@Data
public class FileVO {
	private int fileNo;
	private int fileGroupCode;
	private String orgName;
	private String sysName;
	private String path;
	private String extension;
	private int count;
	private int storeNo;
	@Override
	public String toString() {
		return "FileVO [fileNo=" + fileNo + ", fileGroupCode=" + fileGroupCode + ", orgName=" + orgName + ", sysName="
				+ sysName + ", path=" + path + ", extension=" + extension + ", count=" + count + ", storeNo=" + storeNo
				+ "]";
	}
	
}
