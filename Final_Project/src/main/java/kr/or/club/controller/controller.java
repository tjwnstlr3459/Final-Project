package kr.or.club.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class controller {

	@RequestMapping(value = "/myClub.do")
	public String myClub(){
		
		return "club/myClub";
	}
}
