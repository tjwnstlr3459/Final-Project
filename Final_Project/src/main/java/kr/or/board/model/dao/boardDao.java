package kr.or.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.answer.model.vo.Answer;
import kr.or.board.model.vo.Board;

@Repository
public class boardDao {

	@Autowired
	private SqlSessionTemplate session;
	//총 공지게시물 출력
	public List<Board> boardList() {
		List<Board> list = session.selectList("board.selectBoardList");
		return list;
	}
	//공지게시물 네비 10개단위
	public List<Board> selectBoardList(int start, int end, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type",type);
		List<Board> list = session.selectList("board.selectBoardListBetween",map);
		return list;
	}
	//공지게시판 총게시물 수
	public int totalCount(int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type",type);
		return session.selectOne("board.totalCount", map);
	}
	//공지정보출력
	public Board selectBoard(int abNo) {
		return session.selectOne("board.selectBaord",abNo);
	}
    //댓글등록
	public int insertComent(Answer an) {
		return session.update("answer.insertComent",an);
	}
	//댓글정보출력
	public ArrayList<Answer> selectMoment(int abNo) {
		List<Answer> list =session.selectList("answer.selectMoment",abNo);
		return (ArrayList<Answer>)list;
	}
	//공지/문의/신고 글 등록
	public int insertBoard(Board bl) {
		return session.insert("board.insertBoard",bl);
	}
	//최신 게시물 번호 출력
	public int selectBoardNo() {
		return session.selectOne("board.selectLastBoard");
	}
	//최신게시물에 첨부파일 등록
	public int insertFile(Board bl) {
		return session.update("board.insertBoardFile",bl);
	}
//	//쪽지 등록
//	public int insertReport(Board bl) {
//		return session.insert("board.insertReport",bl);
//	}

}











