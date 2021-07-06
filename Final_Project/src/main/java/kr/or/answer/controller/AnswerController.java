package kr.or.answer.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.answer.model.service.AnswerService;
import kr.or.answer.model.vo.Answer;
import kr.or.board.model.service.boardService;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService service;
	@Autowired
	private boardService bService;
	
	@RequestMapping(value="/insertAnswer.do")
	public String insertAnswer(Answer an, Model model) {
		int result = service.insertAnswer(an);
		if(result>0) {
			int result1 = bService.updateBoardStatus(an);
			model.addAttribute("msg","답변을 완료하였습니다.");
		}else {
			model.addAttribute("msg","오류가 발생하였습니다. 다시 시도해주세요.");
		}
		model.addAttribute("loc","/adminBoardList.do?reqPage=1&type=2&sort=1");
		return"common/msg";
	}
}
