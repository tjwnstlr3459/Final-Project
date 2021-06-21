package kr.or.directMessage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.directMessage.model.vo.DirectMessage;

@Repository
public class DirectMessageDao {
	@Autowired
	private SqlSession session;
	
	public int insertDm(DirectMessage dm) {
		return session.insert("directMessage.insertDm",dm);
	}

	public List selectAllDm() {
		return session.selectList("directMessage.selectAllDm");
	}

	public int updateWarningCount(DirectMessage dm) {
		System.out.println("dm디에오");
		return session.update("directMessage.updateWarningCount",dm);
	}

}
