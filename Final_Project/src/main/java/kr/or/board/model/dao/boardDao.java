package kr.or.board.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<Board> selectBoardList(int start, int end, int type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type",type);
		
		List<Board> list = session.selectList("board.selectBoardListBetween",map);
		return list;
	}
	public int totalCount(int type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type",type);
		return session.selectOne("board.totalCount");
	}
	public List selectOneBoard(Board bl) {
		return session.selectList("board.selectOneBoard",bl);
	}

}











