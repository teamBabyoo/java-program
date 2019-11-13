package kr.co.nff.front.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.nff.front.main.controller.FrontMainController")
@RequestMapping("/front/main")
public class FrontMainController {
	@RequestMapping("/main.do")
	public void main() {}
}