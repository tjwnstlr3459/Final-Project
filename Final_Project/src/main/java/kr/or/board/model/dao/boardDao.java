package kr.or.board.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;

@Repository
public class boardDao {

	@Autowired
	private SqlSessionTemplate session;
	public List<Board> boardList() {
		List<Board> list = session.selectList("board.selectBoardList");
		return list;
	}

}
