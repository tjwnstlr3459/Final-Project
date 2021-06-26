package kr.or.freeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertFreeBoard(FreeBoard fb) {
		int result = sqlSession.insert("freeBoard.insertFreeBoard",fb);
		return result;
	}

	public int FreeBoardtotalCount() {
		return sqlSession.selectOne("freeBoard.FreeBoardTotalCount");
	}

	public ArrayList<FreeBoard> selectFreeBoards(HashMap<String,Object> map) {
		List<FreeBoard> list = sqlSession.selectList("freeBoard.selectFreeBoards",map);
		return (ArrayList<FreeBoard>)list;
	}

	public int addHeart(int fbNo) {
		int result = sqlSession.update("freeBoard.addHeart",fbNo);
		return result;
	}

	public FreeBoard selectFreeBoardByFbNo(int fbNo) {
		return sqlSession.selectOne("freeBoard.selectFreeBoardByFbNo",fbNo);
	} 
}
