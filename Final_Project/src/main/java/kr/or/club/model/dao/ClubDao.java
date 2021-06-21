package kr.or.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.Board;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Repository
public class ClubDao {
	@Autowired
	private SqlSessionTemplate session;

	public List<Club> memberClubList(Member m) {
		List list = session.selectList("club.memberClubList",m);
		return list;
	}

//	public List<Board> memberClubPosts(Member m) {
//		List list = session.selectList("club.memberClubPosts",m);
//		return list;
//	}

	public List<Board> morePhoto(int start, int end, Member m) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("m",m.getMemberNick());
		
		List<Board> list = session.selectList("club.phtoMore",map);
		return list;
	}

	public int totalCount(Member m) {
		return session.selectOne("club.totalCount",m);
	}
	
	
	
	
}
