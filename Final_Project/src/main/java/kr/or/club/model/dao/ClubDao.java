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
	
	//회원이 가입한 클럽들 출력
	public List<Club> memberClubList(Member m) {
		List list = session.selectList("club.memberClubList",m);
		return list;
	}
	
	//게시물 총출력
//	public List<Board> memberClubPosts(Member m) {
//		List list = session.selectList("club.memberClubPosts",m);
//		return list;
//	}

	//더보기로 5개씩 출력하기
	public List<Board> morePhoto(int start, int end, Member m) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("m",m.getMemberNick());
		
		List<Board> list = session.selectList("club.phtoMore",map);
		return list;
	}
	
	//전체게시물 수 확인
	public int totalCount(Member m) {
		return session.selectOne("club.totalCount",m);
	}
	
	//게시물 등록
	public int insertBoard(Board b) {
		return session.update("club.insertPost",b);
	}
	
	//게시물 등록시 board_no를 알아내기위한 메소드
	public int selectBoardNo() {
		return session.selectOne("club.selectBoardNo");
	}

	public int insertFile(Board f) {
		return session.update("club.insertFile",f);
	}
	
	
	
	
}

























