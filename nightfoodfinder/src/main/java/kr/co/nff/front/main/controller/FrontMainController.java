package kr.co.nff.front.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.main.service.MainService;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Notice;
import kr.co.nff.repository.vo.Store;
import kr.co.nff.repository.vo.User;

@Controller
@RequestMapping("/front/main")
public class FrontMainController {
	@Autowired
	private MainService service;
	
	// 최상위 5개 스토어
	@RequestMapping("/main.do")
	public void main(HttpSession session, Model model) {
		
		/* 검색 헤더 부분 */
		session.setAttribute("cateList", service.selectCategory()); 
		session.setAttribute("cityList", service.cityList());
		session.setAttribute("priceList" ,service.selectPriceType());
		
		model.addAttribute("sList", service.mainStoreList());
		List<Store> mList = service.mainStoreList();
		
	}
}