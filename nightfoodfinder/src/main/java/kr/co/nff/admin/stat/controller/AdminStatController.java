package kr.co.nff.admin.stat.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.admin.stat.service.StatService;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;


@Controller("kr.co.nff.admin.stat.controller.AdminStatController")
@RequestMapping("/admin/stat")
public class AdminStatController {
	
	@Autowired
	private StatService service;
	
	@RequestMapping("/statlist.do")
	public void storeList(Search search, Model model) {
		model.addAttribute("statList", service.statFrequentStore(search));
	}
	
	@RequestMapping("/visitorcount.do")
	public void visitorcount(Model model) {
		model.addAttribute("visitorList", service.visitorList());
		model.addAttribute("countByDate", service.countByDate());
		model.addAttribute("countJoinUser", service.countJoinUser());
		model.addAttribute("countJoinStore", service.countJoinStore());
		
	}
	
	

	
}

