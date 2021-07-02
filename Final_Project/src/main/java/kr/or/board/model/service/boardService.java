package kr.or.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.answer.model.vo.Answer;
import kr.or.board.model.dao.boardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;
import kr.or.club.model.vo.ClubBoard;

@Service
public class boardService {
	
	@Autowired
	private boardDao dao;
	
	@Transactional
	public ArrayList<Board> boardList() {
		List<Board> list = dao.boardList();
		return (ArrayList<Board>)list;
	}

	public BoardPageData selectBoardList(int reqPage,int type) {
		int numberPage = type==1?10:50;	//한 페이지에 몇개를 보여줄건지
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1. -> start : 1, end : 10; 2 -> start : 11, end :20, 3-> start : 21, end : 30
		int end = reqPage*numberPage;
		int start = end-numberPage + 1;
		
		//공지게시물 조회
		List<Board> listList = dao.selectBoardList(start,end,type);
		ArrayList<Board> list = (ArrayList<Board>)listList;
		
		//페이지 네비게이션 
		//1) 전체 페이지수를 구해야함 100/10
		int totalCount = dao.totalCount(type);
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
		String pageNavi = type==1?"<ul class='pagination pagination-lg'>":"<div>";
		//페이지 네비 시작번호가 1이 아닌경우는 이전버튼 생성
		if(pageNo != 1) {
			if(type == 1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&lt;</a></li>";				
			}else {
				pageNavi += "<a class='' href='/adminBoardList.do?reqPage="+(pageNo-1)+"&type="+type+"'>&lt;</a></li>";								
			}
		}
		//페이지 숫자 생성
		for(int i=0; i<pageNaviSize; i++) {	//1/2/3/4/5 페이지숫자를 보여주기위해 반복하는것
		if(pageNo == reqPage) {
			if(type == 1) {
				pageNavi += "<li class='page-item active'>";	//눌러진페이지 엑티브 ex)3페이지 누르면 3이 엑티브되게
				pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";				
			}else {
				//눌러진페이지 엑티브 ex)3페이지 누르면 3이 엑티브되게
				pageNavi += "<a class='' href='/adminBoardList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			}
		}else {												//reqPage는 누른페이지 지정
			if(type == 1) {
				pageNavi += "<li class='page-item'>";//누르지 않는 페이지들
				pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";				
			}else {
				//누르지 않는 페이지들
				pageNavi += "<a class='' href='/adminBoardList.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			}
		}
		pageNo++;	
		if(pageNo > totalPage) { //다음페이지가 없으면 break	
			break;
			}
		}
		//다음버튼 생성
		if(pageNo <=totalPage) {
			if(type==1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/boardList.do?reqPage="+(pageNo)+"&type="+type+"'>&gt;</a></li>";
			}else {
				pageNavi += "<a class='' href='/adminBoardList.do?reqPage="+(pageNo)+"&type="+type+"'>&gt;</a></li>";
			}
		}
		pageNavi += type==1?"</ul>":"</div>";
		
		BoardPageData npd = new BoardPageData(list,pageNavi);	//보내는 순서 중요!!
		return npd;
	}
	
	//게시물 상세보기
	public Board selectBoard(int abNo) {
		return dao.selectBoard(abNo);

	}
	//댓글 등록
	@Transactional
	public int insertComent(Answer an) {
		return dao.insertComent(an);
	}
	//댓글찾기
	public ArrayList<Answer> selectMoment(int abNo) {
		return dao.selectMoment(abNo);
	}
	
	//공지/문의/신고 등록
	@Transactional
	public int insertBoard(Board bl, ArrayList<Board> fileList) {
		//파일은 board_no가 필요하기 때문에 board테이블의 insert가 먼저
		int result1 = dao.insertBoard(bl);
		int result = 0;
		if(result1>0) {
			//파일 insert하기 전에 board_no가 필요함
			int abNo = dao.selectBoardNo();
			for(Board f : fileList) {
				f.setAbNo(abNo);
				result += dao.insertFile(f);
			}
		}else {
			return -1;
		}
		return result;
	}
	//공지사항 삭제
	@Transactional
	public int deleteBoard(int abNo) {
		return dao.deleteBoard(abNo);
	}
	//공지사항 수정
	@Transactional
	public int boardUpdate(Board bl, ArrayList<Board> fileList) {
		//파일은 board_no가 필요하기 때문에 board테이블의 insert가 먼저
		int result1 = dao.boardUpdate(bl);
		System.out.println(result1);
		int result = 0;
		if(result1>0) {
			//파일 insert하기 전에 board_no가 필요함
			int abNo = dao.selectBoardNo();
			for(Board f : fileList) {
				f.setAbNo(abNo);
				result += dao.insertFile(f);
			}
		}else {
			return -1;
		}
		return result;
	}
	//조회수 변경
	@Transactional
	public void updateCount(int abNo) {
		dao.updateCount(abNo);
	}


}
















