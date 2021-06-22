package kr.or.newclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.club.model.service.ClubService;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.service.newClubService;

@Controller
public class newClubController {
	@Autowired
	private newClubService service;
	
	@RequestMapping(value = "/newClub.do")
	public String newClub(@SessionAttribute(required = false) Member m,Model model){
		int totalCount = service.totalCount(m);
		model.addAttribute("totalCount",totalCount);
		List list = service.boardList();
		model.addAttribute("list",list);
		return "newclub/newClub";
	}
	

}
