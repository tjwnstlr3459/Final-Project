package kr.or.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.board.model.service.boardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;

@Controller
public class BoardController {

	@Autowired
	private boardService service;
	
	//공지사항 출력
	@RequestMapping(value = "/boardList.do")
	public String boardList(Model model,int reqPage) {	//페이지네비reqPage
//		ArrayList<Board> boardList = service.boardList();//공지사항목록
//		model.addAttribute("boardList",boardList);		//공지사항목록
		BoardPageData bpd = service.selectBoardList(reqPage);	//공지목록,페이지네비 구해오기
		model.addAttribute("boardList", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";
	}
	
	//공지상세보기
	@RequestMapping(value = "/boardOne.do")
	public String boardOne(Model model) {
		return "board/boardOne";
		}
	
	//공지글 작성페이지
	@RequestMapping(value = "/boardOneInsert.do")
	public String boardOneInsert(Model model) {
		return "board/boardOneInsert";
		}
	
}









