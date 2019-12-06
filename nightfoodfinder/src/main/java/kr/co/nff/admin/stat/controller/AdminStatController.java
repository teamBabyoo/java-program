package kr.co.nff.admin.stat.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.admin.stat.service.StatService;


@Controller("kr.co.nff.admin.stat.controller.AdminStatController")
@RequestMapping("/admin/stat")
public class AdminStatController {
	
	@RequestMapping("/statlist.do")
	public void storeList() {
		
	}
	
	@Autowired
	private StatService service;
	
	
	
}

