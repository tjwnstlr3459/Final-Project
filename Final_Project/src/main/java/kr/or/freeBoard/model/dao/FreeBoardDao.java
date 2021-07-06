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


	public FreeBoard selectFreeBoardByFbNo(int fbNo) {
		return sqlSession.selectOne("freeBoard.selectFreeBoardByFbNo",fbNo);
	}

	public int updateFreeBoard(FreeBoard fb) {
		return sqlSession.update("freeBoard.updateFreeBoard",fb);
	}

	public int deleteFreeBoard(int fbNo) {
		return sqlSession.delete("freeBoard.deleteFreeBoard",fbNo);
	}

	public String selectFilepath(int fbNo) {
		return sqlSession.selectOne("freeBoard.selectFilepath",fbNo);
	}

	public int addViews(int fbNo) {
		return sqlSession.update("freeBoard.addViews",fbNo);
	}

	public int addHeart(HashMap<String,Integer> map) {
		int result = sqlSession.insert("likes.addHeart",map);
		return result;
	}
	public int minusHeart(HashMap<String, Integer> map) {
		int result = sqlSession.delete("likes.minusHeart",map);
		return result;
	} 
}
