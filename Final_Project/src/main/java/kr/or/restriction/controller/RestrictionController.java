package kr.or.restriction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.restriction.model.service.RestrictionService;
import kr.or.restriction.model.vo.Restriction;

@Controller
public class RestrictionController {
	@Autowired
	private RestrictionService service;
	
	//이용제한 insert, 회원 등급 수정
	@RequestMapping(value="/insertRest.do")
	public String insertRest(Restriction rest, Model model) {
		int result = service.insertRest(rest);
		if(result >0) {
			int result1 = service.updateMemberGrade(rest);
			if(result1 >0) {
				model.addAttribute("msg","작성 완료");
			}else {
				model.addAttribute("msg","작성 오류!");
			}
			model.addAttribute("loc","/adminMemberList.do?page=1");
		}else {
			model.addAttribute("msg","작성 오류!");
		}
		return "common/msg";
	}
}
