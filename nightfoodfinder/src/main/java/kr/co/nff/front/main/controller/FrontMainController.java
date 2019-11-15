package kr.co.nff.front.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.main.service.Service;

@Controller
@RequestMapping("/front/main")
public class FrontMainController {
	@Autowired
	private Service service;
	
	
	@RequestMapping("/main.do")
	public void main() {
		System.out.println("와써");
//		System.out.println(service.selectUser());
	}
}