package kr.co.nff.front.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.main.service.Service;
import kr.co.nff.repository.vo.Category;

@Controller
@RequestMapping("/front/main")
public class FrontMainController {
	@Autowired
	private Service service;
	
	
	@RequestMapping("/main.do")
	public void main(HttpSession session) {
		List<Category> cateList = service.selectCategory();
		System.out.println(cateList);
		session.setAttribute("cateList", cateList);
		
//		System.out.println("와써");
//		System.out.println(service.selectUser());
	}
}