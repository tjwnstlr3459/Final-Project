package kr.or.club.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.or.club.model.dao.ClubDao;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubChart;
import kr.or.club.model.vo.ClubPageData;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.vo.ClubComment;

@Service
public class ClubService {

	@Autowired
	private ClubDao dao;

	//내가 속한 클럽명들 출력
	public ArrayList<Club> memberClubList(Member m) {
		List<Club> list = dao.memberClubList(m);
		return (ArrayList<Club>)list;
	}
	
	//회원이 속한 모임에 클럽게시물 상세출력(더보기/chagneDate로 날짜조건별 조회)
	public ArrayList<ClubBoard> morePhoto(int start, Member m, int changeDate) {
		//5개씩 사진 가져올거라서
		int length = 10;
		int end = start+length-1;
		List<ClubBoard> list = dao.morePhoto(start,end,m,changeDate);
		return (ArrayList<ClubBoard>)list;
	}
	
	//changeDate값에따라 날짜별 게시물조회 의 총갯수
	public int totalCount(Member m, int changeDate) {
		return dao.totalCount(m,changeDate);
	}

	//임시게시물 등록
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
	//마이클럽 차트(회원이 속한 클럽별 게시물갯수)
	public ArrayList<ClubChart> selectClubPostCount(Member m) {
		List<ClubChart> list =dao.selectClubPostCount(m);
		return (ArrayList<ClubChart>)list;
	}

	
		
		
		//영범이구역 뿌잉뿌잉
	public ArrayList<Club> viewClubList(int cgNo) {
		List<Club> ybClubList = dao.viewClubList(cgNo);
		return (ArrayList<Club>)ybClubList;
	}

	public String selectCategoryName(int cgNo) {
		String cgName = dao.selectCategoryName(cgNo);
		return cgName;
	}
	@Transactional
	public int createClub(Club c) {
		int result = dao.createClub(c);
		return result;
	}

	public ClubPageData selectAllClub(int page, int sort, String category, String keyword) {
		int listLength = 50; // 목록(화면)에 보여줄 클럽 갯 수
		int naviPages = 5;
		int end = listLength * page; // list 끝 값
		int start = end - listLength + 1; // list 시작 값

		HashMap<String, Object> se = new HashMap<String, Object>();
		se.put("start", start);
		se.put("end", end);
		se.put("sort",sort);
		se.put("keyword", keyword);
		se.put("category",category);

		List list = dao.selectAllClub(se); // 전체 클럽을 가지고온다.
		int clubCount = dao.clubCount(se); // 전체 클럽 갯 수
		// 페이지 네비게이션 만들기 전 페이지 설정
		int totalNaviPage = clubCount % listLength == 0 ? clubCount / listLength : clubCount / listLength + 1; 
		int navi = ((page - 1) / naviPages) * naviPages + 1; // 페이지 네비게이션의 시작 값 > 1~5 : 1 / 6 ~ 10 : 6
		String navigation = "<div class='naviPage-wrap'>";
		// 이전버튼 생성 여부
		if (navi != 1) {
			navigation += "<a href='/adminClubList.do?page=" + (navi - 1) + "&sort="+sort+"&category="+category+"&keyword="+keyword+"'>&lt;</a>";
		}
		// 1~5단위 페이지 생성
		for (int i = 0; i < naviPages; i++) {
			// 사용자가 클릭해서 보고있는 페이지인 경우 효과
			if (navi == page) {
				navigation += "<a href='/adminClubList.do?page=" + navi + "&sort="+sort+"&category="+category+"&keyword="+keyword+"' class='naviFocus' id='naviFocus'>" + navi + "</a>";
			} else {
				navigation += "<a href='/adminClubList.do?page=" + navi + "&sort="+sort+"&category="+category+"&keyword="+keyword+"'>" + navi + "</a>";
			}
			// 시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			navi++;
			if (navi > totalNaviPage) {
				break;
			}
		}
		// 다음버튼 생성 여부
		if (navi <= totalNaviPage) {
			navigation += "<a href='/adminClubList.do?page=" + navi + "&sort="+sort+"&category="+category+"&keyword="+keyword+"'>&gt;</a>";
		}
		navigation += "</div>";

		ClubPageData cpd = new ClubPageData();
		cpd.setNavigation(navigation);
		cpd.setList((ArrayList<Club>) list);
		return cpd;
	}
	//읽지않은 쪽지 확인
	public int myMessage(Member m) {
		return dao.myMessage(m);
	}
	//나의 클럽 넘버들 가져오기
	public int deleteClub(int clubNo) {
		return dao.deleteClub(clubNo);
	}
	//클릭한 게시물 댓글 조회
	public ArrayList<ClubComment> postMoment(int boardNo) {
		return dao.postMoment(boardNo);
	}
	//댓글등록
	public int insertComent(Member m, int boardNo, String comentCon) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("m", m);
		map.put("boardNo", boardNo);
		map.put("comentCon", comentCon);
		return dao.insertComent(map);
	}
	//댓글 삭제
	public int deleteMent(int mentNo) {
		return dao.deleteMent(mentNo);
	}

	
	
	/*
	 * //마이클럽 날짜별 게시물 조회 public ArrayList<ClubBoard> selectPostList(Member m, int
	 * start, String changeDate) { //5개씩 사진 가져올거라서 int length = 10; int end =
	 * start+length-1;
	 * 
	 * List<ClubBoard> list = dao.morePhoto(start,end,m,changeDate); return
	 * (ArrayList<ClubBoard>)list; }
	 */

	
}
