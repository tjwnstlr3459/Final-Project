package kr.or.newclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.club.model.service.ClubService;
import kr.or.newclub.model.service.newClubService;

@Controller
public class newClubController {
	@Autowired
	private newClubService service;
	
	@RequestMapping(value = "/newClub.do")
	public String newClub(Model model){
		List list = service.boardList();
		model.addAttribute("list",list);
		return "newclub/newClub";
	}
}
