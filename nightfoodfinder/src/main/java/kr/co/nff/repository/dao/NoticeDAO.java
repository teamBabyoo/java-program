package kr.co.nff.repository.dao;

import java.util.List;

import kr.co.nff.repository.vo.Notice;

public interface NoticeDAO {
	// 알림 생성
	void insertNotice(Notice notice);
	
	// 알림 리스트
	List<Notice> selectNotice(Notice notice);
	
	// 알림 읽음 처리
	void readNotice(int noticeNo);
	
	// 새알림 갯수
	int countNewNotice(Notice notice);
	
	// 알림 삭제
	void deleteNotice(int noticeNo);
	
	// 알림 모두 삭제
	void deleteAllNotice(Notice notice);
	
	int countAll(Notice notice);
}
