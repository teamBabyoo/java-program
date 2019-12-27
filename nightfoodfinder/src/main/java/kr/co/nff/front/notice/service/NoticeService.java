package kr.co.nff.front.notice.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.co.nff.repository.vo.Notice;

public interface NoticeService {
	
	void insertNotice(Notice notice);
//	List<Notice> selectNotice(Notice notice);
//	int countAll(int no);
	Map<String, Object> noticeList(Notice notice, HttpSession session);
	
	void readNotice(int noticeNo);
	int countNewNotice(Notice notice);
	void deleteNotice(int noticeNo);
	void deleteAllNotice(Notice notice);
}
