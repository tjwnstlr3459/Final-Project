package kr.or.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value="/adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
}
