package kr.co.nff.repository.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class User {
	private int userNo;
	private String userEmail;
	private String nickName;
	private Date joinDate;
	
	
	/*특정한 유저의 총 리뷰 수 */
	private int reviewCnt;
	
	// 유저 강제탈퇴, 탈퇴 풀기
	private int userType;
	private List<Integer> userNoList;

	// 네이버로그인 유저입력 테스트 
	private String userGender;
	private String userId;
	private String userName;
	private String userAge;
	
	// 유저의 단골 가게 번호, 리뷰 남긴 가게번호
	private int storeNo;
	private int rstoreNo;
	private String reviewContent;
	private String regDate;
	private int storeScope;
	private int fileGroupCode;
	private int status;
	
	
}
