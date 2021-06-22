package kr.or.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.board.model.service.boardService;
import kr.or.board.model.vo.Board;

@Controller
public class BoardController {

	@Autowired
	private boardService service;
	
	//공지사항 출력
	@RequestMapping(value = "/boardList.do")
	public String boardList(Model model) {
		ArrayList<Board> boardList = service.boardList();
		model.addAttribute("boardList",boardList);
		return "board/boardList";
	}
}
