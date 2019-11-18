package kr.co.nff.repository.vo;

import java.util.Date;

import lombok.Data;

@Data
public class User {
	private int userNo;
	private String userEmail;
	private String nickName;
	private Date joinDate;
	
	/*특정한 유저의 총 리뷰 수 */
	private int reviewCnt;
}
