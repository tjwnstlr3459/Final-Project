package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.AdminCount;
import kr.or.admin.model.vo.BestCategory;
import kr.or.admin.model.vo.DestroyMemberCountMonth;
import kr.or.admin.model.vo.MemberCountMonth;
import kr.or.admin.model.vo.Visit;
import kr.or.member.model.vo.Member;

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

	public List selectMemberCountMonth() {
		return session.selectList("admin.selectMemberCountMonth");
	}

	public List selectDestroyMemberCountMonth() {
		return session.selectList("admin.selectDestroyMemberCountMonth");
	}

	public List selectBestCategory() {
		return session.selectList("admin.selectBestCategory");
	}

	public List selectAllAdmin() {
		return session.selectList("admin.selectAllAdmin");
	}

	public int insertDestroyed(String type) {
		return session.insert("admin.insertDestroyed",type);
	}
}
