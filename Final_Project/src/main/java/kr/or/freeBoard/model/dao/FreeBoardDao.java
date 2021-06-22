package kr.or.freeBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.freeBoard.model.vo.FreeBoard;

@Repository
public class FreeBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertFreeBoard(FreeBoard fb) {
		int result = sqlSession.insert("insertFreeBoard",fb);
		return result;
	} 
}
