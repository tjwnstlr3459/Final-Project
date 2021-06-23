package kr.or.club.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Service
public class ClubService {

	@Autowired
	private ClubDao dao;

	public ArrayList<Club> memberClubList(Member m) {
		List<Club> list = dao.memberClubList(m);
		return (ArrayList<Club>)list;
	}

//	public ArrayList<Board> memberClubPosts(Member m) {
//		List<Board> list = dao.memberClubPosts(m);
//		return (ArrayList<Board>)list;
//	}

	public ArrayList<ClubBoard> morePhoto(int start, Member m) {
		//5개씩 사진 가져올거라서
		int length = 10;
		int end = start+length-1;
		
		List<ClubBoard> list = dao.morePhoto(start,end,m);
		return (ArrayList<ClubBoard>)list;
	}

	public int totalCount(Member m) {
		return dao.totalCount(m);
	}

	@Transactional
	public int insertPost(ClubBoard b, ArrayList<ClubBoard> fileList) {
		//파일은 board_no가 필요하기 때문에 board테이블의 insert가 먼저
		int result1 = dao.insertBoard(b);
		int result = 0;
		if(result1>0) {
			//파일 insert하기 전에 board_no가 필요함
			int boardNo = dao.selectBoardNo();
			for(ClubBoard f : fileList) {
				f.setBoardNo(boardNo);
				result += dao.insertFile(f);
			}
		}else {
			return -1;
		}
		return result;
	}
	
	//영범이구역 뿌잉뿌잉
}
