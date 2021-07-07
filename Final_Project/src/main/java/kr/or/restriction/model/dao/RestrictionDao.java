package kr.or.restriction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	public int deleteRestEndDate() {
		return session.delete("restriction.deleteRestEndRest");
	}

	public int updateEndRestMember() {
		return session.update("member.updateEndRestMember");
	}

	public List selectAllRest(HashMap<String, Integer> se) {
		return session.selectList("restriction.selectAllRest",se);
	}

	public int restCount() {
		return session.selectOne("restriction.restCount");
	}

	public int deleteRestMember(Restriction rest) {
		return session.delete("restriction.deleteRestMember",rest);
	}
}
