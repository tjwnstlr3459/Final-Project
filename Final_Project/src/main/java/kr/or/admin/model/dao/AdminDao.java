package kr.or.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.vo.AdminCount;

@Repository
public class AdminDao {
	@Autowired
	private SqlSession session;

	public AdminCount selectAdminCount() {
		return session.selectOne("admin.selectAdminCount");
	}
}
