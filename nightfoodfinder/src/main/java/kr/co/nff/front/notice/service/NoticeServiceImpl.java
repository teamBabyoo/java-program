package kr.co.nff.front.notice.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nff.repository.dao.NoticeDAO;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;


@Service("kr.co.nff.front.notice.service.NoticeServiceImpl")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void insertNotice(Notice notice) {
		dao.insertNotice(notice);
	}
	
/*	
	public List<Notice> selectNotice(Notice notice) {
		return dao.selectNotice(notice);
		
	}
*/
	
	@Override
	public Map<String, Object> noticeList(Notice notice, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Store loginStore = (Store)session.getAttribute("loginStore");
		if (loginUser != null) {
			notice.setUserNo(loginUser.getUserNo());	
		}
		if (loginStore != null) {
			notice.setStoreNo(loginStore.getStoreNo());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", dao.selectNotice(notice));
		map.put("countAll", dao.countAll(notice));
		return map;
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
