package kr.co.nff.front.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nff.front.notice.service.NoticeService;
import kr.co.nff.repository.vo.Notice;

@Controller("kr.co.nff.front.notice.controller.FrontNoticeController")
public class FrontNoticeController {
	
	@Autowired
	private NoticeService service;
	
	
	/* 알림 리스트 */
	@RequestMapping("/notice_list.do")
	@ResponseBody
	public List<Notice> noticeListAjax(Notice notice) {
		System.out.println(notice.getNoticeNo() + "알림남바");
		return service.selectNotice(notice);
	}
	
	/* 알림 확인시 */
	@RequestMapping("/read_notice.do")
	@ResponseBody
	public void readNoticeAjax(Notice notice) {
		service.readNotice(notice);
	}
}
