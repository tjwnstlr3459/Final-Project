package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

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
	public String join(Model model) {
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
	public String joinProcessing(@RequestParam(value = "hobby") List<String> hobbyArr, @RequestParam(value = "propimg") MultipartFile propimg,  HttpServletRequest request, Member m, Model model) {
		System.out.println(m.getFilename()); //빈문자열
//		m.setHobby1(hobbyArr.get(0));
//		m.setHobby2(hobbyArr.get(1));
//		m.setHobby3(hobbyArr.get(2));
		
		//관심 카테고리 분리 처리
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
		
		//파일 처리 시작
		String savePath = request.getSession().getServletContext().getRealPath("resources/image/userPic/");
		//파일명 처리
		String filename = propimg.getOriginalFilename();
		String onlyFilename = filename.substring(0, filename.indexOf("."));
		String extention = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while(true) {			
			if(count == 0) {
				filepath = onlyFilename + extention;
			} else {
				filepath = onlyFilename + "_" + count + extention;
			}
			File checkFile = new File(savePath + filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		//파일 저장
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = propimg.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//파일 처리 종료
		
		m.setFilename(filename);
		m.setFilepath(filepath);
		
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
