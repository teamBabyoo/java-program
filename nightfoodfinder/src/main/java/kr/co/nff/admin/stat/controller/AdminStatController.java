package kr.co.nff.admin.stat.controller;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.nff.admin.stat.service.StatService;
import kr.co.nff.repository.vo.Search;
import kr.co.nff.repository.vo.Stat;
import kr.co.nff.repository.vo.User;
import net.sf.json.JSONArray;


@Controller("kr.co.nff.admin.stat.controller.AdminStatController")
@RequestMapping("/admin/stat")
public class AdminStatController {
	
	@Autowired
	private StatService service;
	
	@RequestMapping("/statlist.do")
	public void storeList(Search search, Model model) {
		
		Map<String, Object> statMap = service.statFrequentStore(search);
		
		System.out.println(statMap);
//		model.addAttribute("statMap", statMap);
		JSONArray jsonArray = new JSONArray();
		System.out.println(statMap);
		model.addAttribute("search", search);
		model.addAttribute("statMap", jsonArray.fromObject(statMap));
	}
	
	@RequestMapping("/visitorcount.do")
	public void visitorcount(Model model) {
		model.addAttribute("visitorList", service.visitorList());
		model.addAttribute("countByDate", service.countByDate());
		model.addAttribute("countJoinUser", service.countJoinUser());
		model.addAttribute("countJoinStore", service.countJoinStore());
	}
	
	@RequestMapping("/insertAward.do")
	public String insertAward(Search search) {
		
		service.insertAward(search);
		
		String userAge = search.getUserAge();
		
		String url = "redirect:statlist.do?" + "userAge=" + userAge;
		
		return url;
	}

	
}

