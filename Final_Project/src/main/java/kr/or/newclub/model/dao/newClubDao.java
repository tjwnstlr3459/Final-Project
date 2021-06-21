package kr.or.newclub.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class newClubDao {
	@Autowired
	private SqlSessionTemplate session;

	public List boardList() {
		List list = session.selectList("newclub.boardList");
		return list;
	}
}