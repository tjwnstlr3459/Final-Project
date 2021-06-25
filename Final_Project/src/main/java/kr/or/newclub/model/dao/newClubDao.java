package kr.or.newclub.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
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

	public int inserBoard(clubBoard n) {
		return session.insert("newclub.insertBoard",n);
	}
		/*
		 * String query =
		 * "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'))"
		 * ; Object[] params =
		 * {b.getBoardTitle(),b.getBoardWriter(),b.getBoardContent()}; int result =
		 * jdbcTemplate.update(query,params); return result;
		 */
	}

	
