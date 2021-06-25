package kr.or.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.answer.model.service.AnswerService;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService service;
	
	//관리자에게 문의/쪽지 보내기
	
}
