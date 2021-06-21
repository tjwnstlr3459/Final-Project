package kr.or.club.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Board;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "/myClub.do")
	public String myClub(@SessionAttribute(required = false) Member m,Model model){
		ArrayList<Club> clubList = service.memberClubList(m);
//		ArrayList<Board> clubPosts = service.memberClubPosts(m);
		int totalCount = service.totalCount(m);
		
		model.addAttribute("clubList",clubList);
//		model.addAttribute("clubPosts",clubPosts);
		model.addAttribute("totalCount",totalCount);
		return "club/myClub";
	}
	
	@ResponseBody
	@RequestMapping(value = "/photoMore.do")
	public ArrayList<Board> photoMore(@SessionAttribute(required = false) Member m,Model model, int start) {
		
		ArrayList<Board> list = service.morePhoto(start,m);
		model.addAttribute("listMore",list);
		return list;
	}
	
}
