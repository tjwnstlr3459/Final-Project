package kr.or.restriction.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.restriction.model.vo.Restriction;

@Repository
public class RestrictionDao {
	@Autowired
	private SqlSession session;

	public int insertRest(Restriction rest) {
		return session.insert("restriction.insertRest",rest);
	}

	public int updateMemberGrade(Restriction rest) {
		return session.update("restriction.updateMemberGrade",rest);
	}
}
