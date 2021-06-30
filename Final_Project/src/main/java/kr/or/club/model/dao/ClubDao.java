package kr.or.club.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.ClubBoard;
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
//		List list  session.selectList("club.memberClubPosts",m);
//		return list;
//	}

	//더보기로 5개씩 출력하기
	public List<ClubBoard> morePhoto(int start, int end, Member m, int changeDate) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("m",m.getMemberNick());
		map.put("changeDate", changeDate);
		
		List<ClubBoard> list = session.selectList("club.phtoMore",map);
		return list;
	}
	
	//전체게시물 수 확인
	public int totalCount(Member m, int changeDate) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberNick", m.getMemberNick());
		map.put("changeDate", changeDate);
		
		return session.selectOne("club.totalCount",map);
	}
	
	//게시물 등록
	public int insertBoard(ClubBoard b) {
		return session.update("club.insertPost",b);
	}
	
	//최신게시물 번호 알아내기
	public int selectBoardNo() {
		return session.selectOne("club.selectBoardNo");
	}

	public int insertFile(ClubBoard f) {
		return session.update("club.insertFile",f);
	}

	public List<Club> viewClubList(int cgNo) {
		List ybClubList = session.selectList("club.viewClubList",cgNo);
		return ybClubList;
	}

	public String selectCategoryName(int cgNo) {
		String cgName = session.selectOne("category.selectCategoryName",cgNo);
		return cgName;
	}

	public int createClub(Club c) {
		return session.insert("club.createClub",c);
	}
	
	
	
	
}

























