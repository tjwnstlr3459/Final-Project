package kr.or.freeBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.freeBoard.model.service.FreeBoardService;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;
	@RequestMapping(value="/freeBoardList.do")
	public String freeBoardList() {
		return "freeBoard/freeBoardList";
	}
	@RequestMapping(value="/insertFreeBoardFrm.do")
	public String insertFreeBoardFrm() {
		return "freeBoard/freeBoardFrm";
	}
}
