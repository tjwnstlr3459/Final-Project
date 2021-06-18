package kr.or.club.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "/myClub.do")
	public String myClub(@SessionAttribute(required = false) Member m,Model model){
		ArrayList<Club> clubList = service.memberClubList(m);
		ArrayList<Club> clubPosts = service.memberClubPosts(m);
		model.addAttribute("clubList",clubList);
		model.addAttribute("clubPosts",clubPosts);
		return "club/myClub";
	}
}
