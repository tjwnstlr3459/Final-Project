package kr.or.club.controller;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequestWrapper;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.JsonObject;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Board;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Controller
public class ClubController {
	@Autowired
	private ClubService service;

	// 게시물 추출,총 게시물 수
	@RequestMapping(value = "/myClub.do")
	public String myClub(@SessionAttribute(required = false) Member m, Model model) {
		ArrayList<Club> clubList = service.memberClubList(m);
		int totalCount = service.totalCount(m);
		// 회원이 속한 모임에 클럽게시물 추출
//		ArrayList<Board> clubPosts = service.memberClubPosts(m);
//		model.addAttribute("clubPosts",clubPosts);
		model.addAttribute("clubList", clubList);
		model.addAttribute("totalCount", totalCount);
		return "club/myClub";
	}

	// 회원이 속한 모임에 클럽게시물 상세출력
	@ResponseBody
	@RequestMapping(value = "/photoMore.do")
	public ArrayList<Board> photoMore(@SessionAttribute(required = false) Member m, Model model, int start) {
		ArrayList<Board> list = service.morePhoto(start, m);
		model.addAttribute("listMore", list);
		return list;
	}

	// 게시물 등록페이지
	@RequestMapping(value = "/insertPostWrite.do")
	public String insertPostWrite() {
		return "club/insertPostWrite";
	}


}
