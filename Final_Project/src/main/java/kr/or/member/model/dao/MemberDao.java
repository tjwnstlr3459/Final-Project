package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Friends;
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

	public List selectCategory() {
		return sqlSession.selectList("category.selectCategory");
	}

	public int updateLastDate(Member m) {
		return sqlSession.update("member.updateLastdate", m);
	}

	public int deleteMemer(String memberNo) {
		return sqlSession.delete("member.deleteMember",memberNo);
	}

	public Member selectOneMember(String user) {
		return sqlSession.selectOne("member.selectUser", user);
	}

	public Friends selectFriend(Friends f) {
		return sqlSession.selectOne("member.selectFriend", f);
	}

	public int insertFriend(Friends f) {
		return sqlSession.insert("member.insertFriend", f);
	}

	public int updateFriend(Friends f) {
		return sqlSession.update("member.updateFriend", f);
	}

	public List selectFriend(String memberNick) {
		return sqlSession.selectList("member.selectFriendList", memberNick);
	}

	public List selectFriendPending(String memberNick) {
		return sqlSession.selectList("member.selectPendingList", memberNick);
	}

	public List selectFriendRequest(String memberNick) {
		return sqlSession.selectList("member.selectFriendRequest", memberNick);
	}

	public int friendRequestCount(String memberNick) {
		return sqlSession.selectOne("member.friendRequestCount", memberNick);
	}

	public int updatePw(Member m) {
		return sqlSession.update("member.updatePw", m);
	}


}
