package kr.or.newclub.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.newclub.model.vo.Apply;
import kr.or.newclub.model.vo.Calendar;
import kr.or.newclub.model.vo.ClubMember;
import kr.or.newclub.model.vo.clubBoard;

@Repository
public class newClubDao {
	@Autowired
	private SqlSessionTemplate session;

	public List boardList() {
		List list = session.selectList("newclub.boardList");
		return list;
	}

	public int totalCount(int clubNo) {
		return session.selectOne("newclub.totalCount", clubNo);
	}

	public ArrayList<Board> clubBoardMore(HashMap<Object, Object> map) {
		List list = session.selectList("newclub.boardMore", map);
		return (ArrayList<Board>) list;
	}
	//게시물 등록
	public int inserBoard(clubBoard b) {
		return session.insert("newclub.insertBoard", b);
	}
	/*
	 * String query =
	 * "insert into board values(board_seq.nextval,?,?,?,to_char(sysdate,'yyyy-mm-dd'))"
	 * ; Object[] params =
	 * {b.getBoardTitle(),b.getBoardWriter(),b.getBoardContent()}; int result =
	 * jdbcTemplate.update(query,params); return result;
	 */

//	public int insertBoard(Board b) {
//		return session.insert("newclub.insertBoard",b);
//	}
	// 최신 글번호 조회
	public int selectBoardNo() {
		return session.selectOne("newclub.selectBoardNo");
	}

	// 파일 업로드 db 저장
	public int insertFile(clubBoard f) {
		return session.insert("newclub.insertFile", f);
	}

	// 가입신청목록 출력
	public ArrayList<Apply> selectApply(int clubNo) {
		List<Apply> list = session.selectList("newclub.selectApply", clubNo);
		return (ArrayList<Apply>) list;
	}

	// 회원목록
	public ArrayList<ClubMember> selectMemberList(int clubNo) {
		List<ClubMember> list = session.selectList("newclub.selectMemberList", clubNo);
		return (ArrayList<ClubMember>) list;
	}

	// 가입신청
	public int insertApply(Object apply) {
		return session.insert("newclub.insertApply", apply);
	}

	// 가입신청 수락
	public int deleteApply(int no) {
		return session.delete("newclub.deleteApply", no);
	}

	// 가입신청시 클럽멤버에 넣어주기
	public int insertClubMember(int no, int clubNo) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("clubNo", clubNo);
		return session.insert("newclub.insertClubMemeber", map);
	}
	//가입 신청 거절
	public int deleteRefusal(int clubNo, int listNo) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("clubNo", clubNo);
		map.put("listNo", listNo);
		
		return session.delete("newclub.deleteRefusal",map);
	}

	public int viewUpdate(int boardNo) {
		return session.update("newclub.viewUpdate", boardNo);
	}

	//달력일정추가
	public int calendarAdd(Calendar calendar) {
		return session.insert("newclub.calendarAdd",calendar);
	}
	//달력일정 불러오기
	public ArrayList<Calendar> selectCalList(int clubNo) {
		List<Calendar> list = session.selectList("newclub.selectCalList",clubNo);
		return (ArrayList<Calendar>)list;
	}

}












