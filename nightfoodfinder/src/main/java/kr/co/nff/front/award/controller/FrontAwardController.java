package kr.co.nff.front.award.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.award.service.AwardService;

@Controller("kr.co.nff.front.award.controller.FrontAwardController")
@RequestMapping("/front/award")
public class FrontAwardController {
	
	@Autowired
	private AwardService service;
	
	@RequestMapping("/awardlist.do")
	public void awardList(Model model) {
		model.addAttribute("awardList", service.listAwardStore());
	}
	
	@RequestMapping("/awarddetail.do")
	public void awardDetail(String storeNoList, Model model) {
		model.addAttribute("awardDetail", service.detailAwardStore(storeNoList));
	}
	
}
