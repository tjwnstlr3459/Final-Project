package kr.or.member.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.user.model.vo.User;

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
	
	@RequestMapping(value="/join.do")
	public String join(User u, Model model) {
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/user/chkEmail.do")
	public String chkEmail(Member m, Model model) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/user/chkName.do")
	public String chkName(Member m, Model model) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}
	
	@RequestMapping(value="/joinProcessing.do")
	public String joinProcessing(@RequestParam(value = "hobby") List<String> hobbyArr, Member m, Model model) {
		System.out.println(m.getAddress()); //null
		System.out.println(m.getFilename()); //빈문자열
//		m.setHobby1(hobbyArr.get(0));
//		m.setHobby2(hobbyArr.get(1));
//		m.setHobby3(hobbyArr.get(2));
		
		if(hobbyArr.size() == 1) {
			m.setHobby1(hobbyArr.get(0));
		} else if(hobbyArr.size() == 2) {
			m.setHobby1(hobbyArr.get(0));
			m.setHobby2(hobbyArr.get(1));
		} else if(hobbyArr.size() == 3) {
			m.setHobby1(hobbyArr.get(0));
			m.setHobby2(hobbyArr.get(1));
			m.setHobby3(hobbyArr.get(2));
		}
		int result = service.insertMember(m);
		if(result > 0) {
			model.addAttribute("msg","회원가입 성공");
		} else {
			model.addAttribute("msg","회원가입 실패");
		}
		model.addAttribute("loc","main.jsp");
		return "common/msg";
	}
	//전체회원list get
	@RequestMapping(value="/adminMemberList.do")
	public String allMemberList(int page, Model model) {
		System.out.println(page);
		System.out.println("test");
		MemberPageData mpd = service.selectAllMember(page);
		for(Member m : mpd.getList()) {
			System.out.println(m.getEmail());
		}
		model.addAttribute("list",mpd.getList());
		model.addAttribute("navigation",mpd.getNavigation());
		return "admin/adminMemberList";
	}
}
