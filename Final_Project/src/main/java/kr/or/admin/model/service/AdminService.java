package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.admin.model.dao.AdminDao;
import kr.or.admin.model.vo.AdminCount;
import kr.or.admin.model.vo.BestCategory;
import kr.or.admin.model.vo.DestroyMemberCountMonth;
import kr.or.admin.model.vo.MemberCountMonth;
import kr.or.admin.model.vo.Visit;
import kr.or.category.model.vo.Category;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

	public AdminCount selectAdminCount() {
		AdminCount ac = dao.selectAdminCount();
		if(ac != null) {
			ArrayList<BestCategory> bcList = (ArrayList<BestCategory>)dao.selectBestCategory();
			ac.setBcList(bcList);
			
		}
		return ac;
	}
	@Transactional
	public int insertVisit(String visitorIp) {
		int result = 0;
		if(dao.searchIp(visitorIp) == null) {
			result = dao.insertVisit(visitorIp);
		}
		return result;
	}
	public int selectVisit(Visit selectType) {
		return dao.selectVisit(selectType);
	}
	public ArrayList<MemberCountMonth> selectMemberCountMonth() {
		return (ArrayList<MemberCountMonth>)dao.selectMemberCountMonth();
	}
	public ArrayList<DestroyMemberCountMonth> selectDestroyCountMember() {
		return (ArrayList<DestroyMemberCountMonth>)dao.selectDestroyMemberCountMonth();
	}
	public ArrayList<Member> selectAllAdmin() {
		/*
		int listLength = 50; // 목록(화면)에 보여줄 게시글 갯 수
		int naviPages = 5;
		int end = listLength * page; // list 끝 값
		int start = end - listLength + 1; // list 시작 값

		HashMap<String, Object> se = new HashMap<String, Object>();
		se.put("start", start);
		se.put("end", end);

		List list = dao.selectAllAdmin(se); // 전체 회원을 가지고온다.
		int memberCount = dao.adminCount(); // 전체 게시글 갯 수
		// 페이지 네비게이션 만들기 전 페이지 설정
		int totalNaviPage = memberCount % listLength == 0 ? memberCount / listLength : memberCount / listLength + 1; // %
																														// ==
																														// 0인경우
																														// 다음페이지
																														// 네비게이션을
																														// 만들지
																														// 않기
																														// 위함
		int navi = ((page - 1) / naviPages) * naviPages + 1; // 페이지 네비게이션의 시작 값 > 1~5 : 1 / 6 ~ 10 : 6
		String navigation = "<div class='naviPage-wrap'>";
		// 이전버튼 생성 여부
		if (navi != 1) {
			navigation += "<a href='/adminMemberList.do?page=" + (navi - 1) + "&sort="+sort+"'>이전</a>";
		}
		// 1~5단위 페이지 생성
		for (int i = 0; i < naviPages; i++) {
			// 사용자가 클릭해서 보고있는 페이지인 경우 효과
			if (navi == page) {
				navigation += "<a href='/adminMemberList.do?page=" + navi + "&sort="+sort+"' class='naviFocus' id='naviFocus'>" + navi + "</a>";
			} else {
				navigation += "<a href='/adminMemberList.do?page=" + navi + "&sort="+sort+"'>" + navi + "</a>";
			}
			// 시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			navi++;
			if (navi > totalNaviPage) {
				break;
			}
		}
		// 다음버튼 생성 여부
		if (navi <= totalNaviPage) {
			navigation += "<a href='/adminMemberList.do?page=" + navi + "&sort="+sort+"'>다음</a>";
		}
		navigation += "</div>";

		List cgList = dao.selectAllCategory();
		MemberPageData mpd = new MemberPageData();
		mpd.setNavigation(navigation);
		mpd.setList((ArrayList<Member>) list);
		mpd.setCgList((ArrayList<Category>) cgList);
		return mpd;
		*/
		return (ArrayList<Member>)dao.selectAllAdmin();
	}
	public int insertDestroyed(String type) {
		return dao.insertDestroyed(type);
	}
	public int updateClubLastDate(Club c) {
		return dao.updateClubLastDate(c);
	}
	public int updateClubLastDateBoardNo(int boardNo) {
		return dao.updateClubLastDateBoardNo(boardNo);
	}
}
