package kr.co.nff.front.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.main.service.FrontService;
import kr.co.nff.repository.vo.Category;

@Controller
@RequestMapping("/front/main")
public class FrontMainController {
	@Autowired
	private FrontService service;
	
	// 최상위 5개 스토어
	@RequestMapping("/main.do")
	public void main(HttpSession session, Model model) {
		List<Category> cateList = service.selectCategory();
//		System.out.println(cateList);
		session.setAttribute("cateList", cateList);
		
		model.addAttribute("sList", service.mainStoreList());
		
		System.out.println(service.mainStoreList());
	}
}