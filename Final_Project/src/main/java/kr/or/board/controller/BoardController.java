package kr.or.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.board.model.service.boardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;

@Controller
public class BoardController {

	@Autowired
	private boardService service;
	
	//공지사항 출력
	@RequestMapping(value = "/boardList.do")
	public String boardList(Model model,int reqPage, int type) {	//페이지네비reqPage
//		ArrayList<Board> boardList = service.boardList();//공지사항목록
//		model.addAttribute("boardList",boardList);		//공지사항목록
		BoardPageData bpd = service.selectBoardList(reqPage,type);	//공지목록,페이지네비 구해오기
		model.addAttribute("boardList", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";			
	}
	//문의/신고 출력
	@RequestMapping(value="/adminBoardList.do")
	public String adminBoardList(Model model, int reqPage, int type) {
		BoardPageData bpd = service.selectBoardList(reqPage,type);	//공지목록,페이지네비 구해오기
		model.addAttribute("list", bpd.getList());
		model.addAttribute("navigation", bpd.getPageNavi());
		return "admin/adminBoardList";
	}
	//번호로 공지,문의/신고 selectOne > ajax 
	@RequestMapping(value="/selectOneBoard.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectOneBoard(Board bl) {		
		Board b = service.selectOneBoard(bl);
		return new Gson().toJson(b);
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









