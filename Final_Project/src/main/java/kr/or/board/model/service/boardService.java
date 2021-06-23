package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.dao.boardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;

@Service
public class boardService {
	
	@Autowired
	private boardDao dao;
	
	@Transactional
	public ArrayList<Board> boardList() {
		List<Board> list = dao.boardList();
		return (ArrayList<Board>)list;
	}

	public BoardPageData selectBoardList(int reqPage) {
		int numberPage = 10;	//한 페이지에 몇개를 보여줄건지
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1. -> start : 1, end : 10; 2 -> start : 11, end :20, 3-> start : 21, end : 30
		int end = reqPage*numberPage;
		int start = end-numberPage + 1;
		
		//공지게시물 조회
		List<Board> listList = dao.selectBoardList(start,end);
		ArrayList<Board> list = (ArrayList<Board>)listList;
		
		//페이지 네비게이션 
		//1) 전체 페이지수를 구해야함 100/10
		int totalCount = dao.totalCount();
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount%numberPage == 0) {
			totalPage = totalCount/numberPage;
		}else {
			totalPage = totalCount/numberPage+1;
		}
		//페이지 네비 길이지정
		int pageNaviSize = 5;
		//1~5페이지 요청시 페이지 네비 시작번호 : 1
		//6~10페이지 요청하면 페이지 네비 시작 : 6
		//11~15페이지 요청하면 페이지 네비 시작  : 11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//페이지네비 시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		//페이지 네비 시작번호가 1이 아닌경우는 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+(pageNo-1)+"'>&lt;</a></li>";
		}
		//페이지 숫자 생성
		for(int i=0; i<pageNaviSize; i++) {	//1/2/3/4/5 페이지숫자를 보여주기위해 반복하는것
		if(pageNo == reqPage) {
			pageNavi += "<li class='page-item active'>";	//눌러진페이지 엑티브 ex)3페이지 누르면 3이 엑티브되게
			pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
		}else {												//reqPage는 누른페이지 지정
			pageNavi += "<li class='page-item'>";//누르지 않는 페이지들
			pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
		}
		pageNo++;	
		if(pageNo > totalPage) { //다음페이지가 없으면 break	
			break;
			}
		}
		//다음버튼 생성
		if(pageNo <=totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+(pageNo)+"'>&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		BoardPageData npd = new BoardPageData(list,pageNavi);	//보내는 순서 중요!!
		return npd;
	}
}















