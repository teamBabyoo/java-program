package kr.co.nff.repository.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class Category implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int categoryNo;
	private String categoryName;
}
