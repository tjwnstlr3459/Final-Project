package kr.or.club.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubChart;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.vo.ClubComment;

@Repository
public class ClubDao {
	@Autowired
	private SqlSessionTemplate session;
	
	//회원이 가입한 클럽들 출력
	public List<Club> memberClubList(Member m) {
		List<Club> list = session.selectList("club.memberClubList",m);
		return list;
	}
	

	//더보기로 5개씩 출력하기(changeDate값별로 날짜별 조회 조건걸기)
	public List<ClubBoard> morePhoto(int start, int end, Member m, int changeDate, String searchCon) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("m",m.getMemberNick());
		map.put("changeDate", changeDate);
		map.put("searchCon", searchCon);
		List<ClubBoard> list = session.selectList("club.phtoMore",map);
		return list;
	}
	
	//전체게시물 수 확인
	public int totalCount(Member m, int changeDate, String searchCon) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberNick", m.getMemberNick());
		map.put("changeDate", changeDate);
		map.put("searchCon", searchCon);
		
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
	
	//최신게시물에 최신파일 값 넣기
	public int insertFile(ClubBoard f) {
		return session.update("club.insertFile",f);
	}
	//마이클럽 차트(회원이 속한 클럽별 게시물갯수)
	public List<ClubChart> selectClubPostCount(Member m) {
		return session.selectList("club.selectClubPostCount",m);
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


	public int clubCount(HashMap<String, Object> se) {
		return session.selectOne("club.clubCount",se);
	}


	public List selectAllClub(HashMap<String, Object> se) {
		return session.selectList("club.selectAllClub",se);
	}

	//나의 읽지 않은 메세지
	public int myMessage(Member m) {
		return session.selectOne("club.myMessage",m);
	}

	//나의 클럽넘버들 가져오기
	public int deleteClub(int clubNo) {
		return session.delete("club.deleteClub",clubNo);
	}

//	//댓글 가져오기
//	public ArrayList<ClubComment> selectComent() {
//		List<ClubComment> list = session.selectList("club.selectComent");
//		return (ArrayList<ClubComment>)list;
//	}

	//클릭 게시물 댓글 조회
	public ArrayList<ClubComment> postMoment(int boardNo) {
		List<ClubComment> list = session.selectList("club.postMoment",boardNo);
		return (ArrayList<ClubComment>)list;
	}

	//마이클럽 댓글 등록
	public int insertComent(HashMap<String, Object> map) {
		return session.insert("club.insertComent",map);
	}

	//댓글 삭제
	public int deleteMent(int mentNo) {
		return session.delete("club.deleteMent",mentNo);
	}

	//게시물 좋아요
	public int postLike(HashMap<String, Object> map) {
		return session.insert("club.postLike",map);
	}

	//게시물 좋아요 취소
	public int postDeletLike(HashMap<String, Object> map) {
		return session.delete("club.postDeletLike",map);
	}


	
	
	
	
	
	
	
}

























