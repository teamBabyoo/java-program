package kr.co.nff.front.notice.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.NoticeDAO;
import kr.co.nff.repository.vo.Notice;


@Service("kr.co.nff.front.notice.service.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void insertNotice(Notice notice) {
		dao.insertNotice(notice);
	}
	
	
	public List<Notice> selectNotice(Notice notice) {
		return dao.selectNotice(notice);
		
	}
	
	@Override
	public void readNotice(int noticeNo) {
		dao.readNotice(noticeNo);
	}
	
	@Override
	public int countNewNotice(Notice notice) {
		return dao.countNewNotice(notice);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		dao.deleteNotice(noticeNo);
	}
	
	@Override
	public void deleteAllNotice(Notice notice) {
		dao.deleteAllNotice(notice);
	}


}
