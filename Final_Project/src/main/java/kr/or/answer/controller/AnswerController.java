package kr.or.answer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.or.answer.model.service.AnswerService;

@Controller
public class AnswerController {
	@Autowired
	private AnswerService service;
}
