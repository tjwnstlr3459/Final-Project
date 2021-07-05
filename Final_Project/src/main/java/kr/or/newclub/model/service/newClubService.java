package kr.or.newclub.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.board.model.vo.Board;
import kr.or.club.model.vo.Club;
import kr.or.club.model.vo.ClubBoard;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.dao.newClubDao;
import kr.or.newclub.model.vo.Apply;
import kr.or.newclub.model.vo.Calendar;
import kr.or.newclub.model.vo.clubBoard;
import kr.or.newclub.model.vo.ClubMember;

@Service
public class newClubService {


@Autowired
private newClubDao dao;

public List boardList() {
	return dao.boardList();

}

public int totalCount(int clubNo) {
    return dao.totalCount(clubNo);
 }

public ArrayList<Board> clubBoardMore(int start, int clubNo) {
	//3개씩가져올거다
	int length = 3;
	int end = start + length - 1;
	HashMap<Object, Object> map = new HashMap<Object, Object>();
	map.put("start", start);
	map.put("end", end);
	map.put("clubNo", clubNo);
	
	return dao.clubBoardMore(map);
}

		//해당 클럽에 게시물 등록
		@Transactional
		public int insertBoard(clubBoard b) {
		//파일은 board_no가 필요하기 떄문에 board테이블에 insert하는것이 먼저
		int result = dao.inserBoard(b);
		return result;
	}

		//가입신청한 회원 출력
		public ArrayList<Apply> selectApply(int clubNo) {
			return dao.selectApply(clubNo);
		}
		//가입된 회원 출력
		public ArrayList<ClubMember> selectMemberList(int clubNo) {
			return dao.selectMemberList(clubNo);
		}
		//가입신청
		@Transactional
		public int insertApply(Object apply) {
			return dao.insertApply(apply);
		}
		//가입신청 수락
		@Transactional
		public int deleteApply(int no) {
			return dao.deleteApply(no);
		}
		//가입신청시 클럽멤버로 넣기
		@Transactional
		public int insertClubMember(int no, int clubNo) {
			return dao.insertClubMember(no,clubNo);
		}
		//가입신청 거절
		@Transactional
		public int deleteRefusal(int clubNo, int listNo) {
			return dao.deleteRefusal(clubNo,listNo);
		}
		//조회수 업데이트
		public int viewUpdate(int boardNo) {
			return dao.viewUpdate(boardNo);
		}
		//달력일정추가
		@Transactional
		public int calendarAdd(Calendar calendar) {
			return dao.calendarAdd(calendar);
		}
		//달력 일정 불러오기
		public ArrayList<Calendar> selectCalList(int clubNo) {
			return dao.selectCalList(clubNo);
		}
		//클럽정보 출력
		public Club selectClub(int clubNo) {
			return dao.selectClub(clubNo);
		}
		//클럽소개글 수정
		public int clubIntroModify(int clubNo, String clubIntro) {
			HashMap<Object, Object> map = new HashMap<Object, Object>();
			map.put("clubNo", clubNo);
			map.put("clubIntro", clubIntro);
			return dao.clubIntroModify(map);
		}
		public ArrayList<Club> selectMemberClubNo(Member m) {
			return dao.selectMemberClubNo(m);
		}
		
		//게시글 삭제
		@Transactional
		public int boardDelete(int boardNo) {
			return dao.boardDelete(boardNo);
		}
}

