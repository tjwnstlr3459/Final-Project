package kr.or.newclub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class newController {

	@RequestMapping(value = "newClub.do")
	public String newClub(){
		
		return "newclub/newClub";
	}
}