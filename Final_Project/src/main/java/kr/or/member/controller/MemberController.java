package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="/login.do")
		public String login(Member m, HttpSession session, Model model) {		
			Member member = service.selectOneMember(m);
			if(member != null) {
				session.setAttribute("m", member);
				System.out.println(member.getMemberNick()+"환영한다능");
				model.addAttribute("msg","로그인성공!");		
			}else {
				model.addAttribute("msg","아이디/비밀번호를 확인하세요");		
			}
			model.addAttribute("loc","main.jsp");
			return "common/msg";			
		}
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
