package kr.or.freeBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession; 
}
