package kr.co.nff.front.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.nff.front.notice.service.NoticeService;

@Controller("kr.co.nff.front.notice.controller.FrontNoticeController")
public class FrontNoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
}
