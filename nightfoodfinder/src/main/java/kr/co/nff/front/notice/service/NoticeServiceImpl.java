package kr.co.nff.front.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.nff.repository.dao.NoticeDAO;
import kr.co.nff.repository.vo.Notice;

public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void insertNotice(Notice notice) {
		dao.insertNotice(notice);
	}
	
	@Override
	public List<Notice> selectNotice(Notice notice) {
		return dao.selectNotice(notice);
	}
	
	@Override
	public void readNotice(Notice notice) {
		dao.readNotice(notice);
	}
	
	@Override
	public int countNewNotice(Notice notice) {
		return dao.countNewNotice(notice);
	}
}
