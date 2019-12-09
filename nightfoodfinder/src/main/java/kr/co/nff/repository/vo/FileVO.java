package kr.co.nff.repository.vo;

import lombok.Data;

@Data
public class FileVO {
	private int fileNo;
	private int fileGroupCode;
	private String orgName;
	private String sysName;
	private String path;
}
