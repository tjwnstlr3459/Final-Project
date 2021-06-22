package kr.or.directMessage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.directMessage.model.service.DirectMessageService;
import kr.or.directMessage.model.vo.DirectMessage;

@Controller
public class DirectMessageController {
	@Autowired
	private DirectMessageService service;
	
	@RequestMapping(value="/insertDm.do")
	public String insertDm(DirectMessage dm, Model model) {
		int result = service.insertDm(dm);
		if(result >0) {
			model.addAttribute("msg","작성 완료!");
		}else {
			model.addAttribute("msg","작성 실패");			
		}
		model.addAttribute("loc","/adminMain.do");
		return "common/msg";
	}
}
