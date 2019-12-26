package kr.co.nff.repository.vo;

import java.io.Serializable;

import lombok.Data;

@Data
public class PriceType implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int priceTypeNo;
	private String priceType;
}
