package kr.or.newclub.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.club.model.vo.ClubBoard;
import kr.or.newclub.model.vo.apply;
import kr.or.newclub.model.vo.clubBoard;
import kr.or.newclub.model.vo.clubMember;

@Repository
public class newClubDao {
	@Autowired
	private SqlSessionTemplate session;

	public List boardList() {
		List list = session.selectList("newclub.boardList");
		return list;
	}

	 public int totalCount(int clubNo) {
	      return session.selectOne("newclub.totalCount",clubNo);
	 }


	public ArrayList<Board> clubBoardMore(HashMap<Object, Object> map) {
		List list = session.selectList("newclub.boardMore",map);
		return (ArrayList<Board>)list;
	}

	public int inserBoard(clubBoard n) {
		return session.insert("newclub.insertBoard",n);
	}
		/*
		 * String query =
		 * "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'))"
		 * ; Object[] params =
		 * {b.getBoardTitle(),b.getBoardWriter(),b.getBoardContent()}; int result =
		 * jdbcTemplate.update(query,params); return result;
		 */

	//게시물 등록
	public int insertBoard(clubBoard b) {
		return session.update("newclub.insertBoard",b);
	}

	public int insertBoard(Board b) {
		return session.insert("newclub.insertBoard",b);
	}

	public int selectBoardNo() {
		return session.selectOne("newclub.selectBoardNo");
	}

	public int insertFile(clubBoard f) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	//회원목록, 가입신청목록 출력
	public ArrayList<apply> selectApply(int clubNo) {
		List<apply> list =session.selectList("newclub.selectApply",clubNo);
		return (ArrayList<apply>) list;
	}

	public ArrayList<clubMember> selectMemberList(int clubNo) {
		List<clubMember> list =session.selectList("newclub.selectMemberList",clubNo);
		return (ArrayList<clubMember>) list;
	}

	
	}

	
