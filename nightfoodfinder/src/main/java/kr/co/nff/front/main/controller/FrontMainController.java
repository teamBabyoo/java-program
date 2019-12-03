package kr.co.nff.front.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nff.front.main.service.MainService;
import kr.co.nff.repository.vo.Category;
import kr.co.nff.repository.vo.Store;

@Controller
@RequestMapping("/front/main")
public class FrontMainController {
	@Autowired
	private MainService service;
	
	// 최상위 5개 스토어
	@RequestMapping("/main.do")
	public void main(HttpSession session, Model model) {
		
		// 검색 헤더에서 쓸 카테고리 리스트 세션에 올린다.
		List<Category> cateList = service.selectCategory();
		session.setAttribute("cateList", cateList); 
		// 현재 DB에 있는 스토어들의 지역구도 세션에 올린다.
		List<String> cityList = service.cityList();
		session.setAttribute("cityList", cityList);
		
		model.addAttribute("sList", service.mainStoreList());
		List<Store> mList = service.mainStoreList();
//		System.out.println(mList.size());
	}
}