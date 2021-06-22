package kr.or.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectOneMember(Member m) {
		Member member = sqlSession.selectOne("member.selectOneMember",m);
		return member;
	}

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember", m);
		return result;
	}

	public List selectAllMember(HashMap<String, Integer> se) {
		return sqlSession.selectList("member.selectAllMember",se);
	}

	public int memberCount() {
		return sqlSession.selectOne("member.memberCount");
	}

	public int updateGrade(String[] memberNo) {
		int count = sqlSession.update("member.updateGrade",memberNo);
		System.out.println("update : "+count);
		return count;
	}

	public List selectAllCategory() {
		return sqlSession.selectList("category.selectAllCategory");
	}

}
