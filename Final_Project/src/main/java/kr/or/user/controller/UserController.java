package kr.or.user.controller;

import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.user.model.vo.User;

@Controller
public class UserController {
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "user/login";
	}
	
	@RequestMapping(value="/loginProcessing.do")
	public String loginProcessing(User u, Model model) {
		return "user/login";
	}
	
	@RequestMapping(value="/gLogin.do")
	public String gLogin() {
		return "user/login";
	}
	
	@RequestMapping(value="/kLogin.do")
	public String kLogin() {
		return "user/login";
	}
	
	@RequestMapping(value="/nLogin.do")
	public String nLogin() {
		return "user/login";
	}
}
