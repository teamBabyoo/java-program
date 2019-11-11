package kr.co.nff.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.nff.admin.controller.MainController")
public class MainController {
	@RequestMapping("/main.do")
	public void main() {}
}