package kr.or.newclub.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.vo.Board;
import kr.or.club.model.vo.ClubBoard;
import kr.or.newclub.model.dao.newClubDao;
import kr.or.newclub.model.vo.Apply;
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
		public int insertApply(Object apply) {
			return dao.insertApply(apply);
		}
		//가입신청 수락
		public int deleteApply(int no) {
			return dao.deleteApply(no);
		}
		//가입신청시 클럽멤버로 넣기
		public int insertClubMember(int no, int clubNo) {
			return dao.insertClubMember(no,clubNo);
		}


}

