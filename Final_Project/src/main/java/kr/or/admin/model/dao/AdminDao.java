package kr.or.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.AdminCount;
import kr.or.admin.model.vo.Visit;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession session;

	public AdminCount selectAdminCount() {
		return session.selectOne("admin.selectAdminCount");
	}

	public Visit searchIp(String visitorIp) {
		return session.selectOne("visit.searchIp", visitorIp);
	}

	public int insertVisit(String visitorIp) {
		return session.insert("visit.insertVisit",visitorIp);
	}

	public int selectVisit(Visit selectType) {
		return session.selectOne("visit.selectVisit",selectType);
	}
}
