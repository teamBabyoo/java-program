package kr.co.nff.front.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nff.front.notice.service.NoticeService;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

@Controller("kr.co.nff.front.notice.controller.FrontNoticeController")
@RequestMapping("/front/main")
public class FrontNoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	/* 알림 리스트 */
	@RequestMapping("/notice_list.do")
	@ResponseBody
	public List<Notice> noticeListAjax(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Notice notice = new Notice();
		notice.setUserNo(loginUser.getUserNo());
		return service.selectNotice(notice);
	}
	
	/* 알림 확인시 */
	@RequestMapping("/read_notice.do")
	@ResponseBody
	public void readNoticeAjax(Notice notice) {
		service.readNotice(notice);
	}

	/* 알림 갯수 */
	@RequestMapping("/count_notice.do")
	@ResponseBody
	public int countNoticeAjax(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Store storeUser = (Store)session.getAttribute("storeUser");
		
		Notice notice = new Notice();
		if (storeUser == null && loginUser != null) notice.setUserNo(loginUser.getUserNo());
		else if (storeUser != null && loginUser == null) notice.setStoreNo(storeUser.getStoreNo());
		
		int noticeCnt = service.countNewNotice(notice);
		
		// 알림 갯수가 0이라면 0 반환. -> script단에서 걸러준다.
		if (noticeCnt != 0) return service.countNewNotice(notice);
		return 0;

	}
	
	/* 알림 하나 삭제 */
	@RequestMapping("/delete_notice.do")
	@ResponseBody
	public void deleteNoticeAjax(int noticeNo) {
		service.deleteNotice(noticeNo);
	}
	
	/* 알림 전부 삭제 */
	@RequestMapping("/deleteall_notice.do")
	@ResponseBody
	public void deleteAllNoticeAjax(Notice notice) {
		service.deleteAllNotice(notice);
	}
	
	
}
