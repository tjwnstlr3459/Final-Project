package kr.or.newclub.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.club.model.vo.ClubBoard;
import kr.or.newclub.model.vo.clubBoard;

@Repository
public class newClubDao {
	@Autowired
	private SqlSessionTemplate session;

	public List boardList() {
		List list = session.selectList("newclub.boardList");
		return list;
	}

	 public int totalCount(int clubNo) {
	      return session.selectOne("newclub.totalCount",clubNo);
	 }


	public ArrayList<Board> clubBoardMore(HashMap<Object, Object> map) {
		List list = session.selectList("newclub.boardMore",map);
		return (ArrayList<Board>)list;
	}
	//게시물 등록
	public int inserBoard(clubBoard b) {
		return session.insert("newclub.insertBoard",b);
	}
		/*
		 * String query =
		 * "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'))"
		 * ; Object[] params =
		 * {b.getBoardTitle(),b.getBoardWriter(),b.getBoardContent()}; int result =
		 * jdbcTemplate.update(query,params); return result;
		 */


/*
	// 최신 글번호 조회
	public int selectBoardNo() {
		return session.selectOne("newclub.selectBoardNo");
	}
	// 파일 업로드 db 저장
	public int insertFile(clubBoard f) {
		return session.insert("newclub.insertFile", f);
	}
*/
	
	}

	
