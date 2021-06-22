package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member m) {
		Member member = dao.selectOneMember(m);
		return member;
	}
	
	@Transactional
	public int insertMember(Member m) {
		int result = dao.insertMember(m);
		return result;
	}

	public MemberPageData selectAllMember(int page) {
		int listLength = 10;														//목록(화면)에 보여줄 게시글 갯 수
		int naviPages = 5;
		int end = listLength * page;					//list 끝 값
		int start = end - listLength + 1;				//list 시작 값
		
		HashMap<String, Integer> se = new HashMap<String, Integer>();
		se.put("start", start);
		se.put("end",end);
		
		List list = dao.selectAllMember(se);	// 전체 게시글을 가지고온다.
		int memberCount = dao.memberCount();										//전체 게시글 갯 수
		//페이지 네비게이션 만들기 전 페이지 설정
		int totalNaviPage = memberCount%listLength == 0 ? memberCount/listLength : memberCount/listLength+1;		//% == 0인경우 다음페이지 네비게이션을 만들지 않기 위함
		int navi = ((page - 1) / naviPages)*naviPages+1;					//페이지 네비게이션의 시작 값 > 1~5 : 1 / 6 ~ 10 : 6
		String navigation = "<div>";
		//이전버튼 생성 여부
		if(navi!=1) {
			navigation += "<a href='/adminMemberList.do?page="+(navi-1)+"'>이전</a>";
		}
		//1~5단위 페이지 생성
		for(int i=0;i<naviPages;i++) {
			//사용자가 클릭해서 보고있는 페이지인 경우 효과
			if(navi==page) {
				navigation += "<a href='/adminMemberList.do?page="+navi+"' class='naviFocus'>"+navi+"</a>";
			}else {
				navigation += "<a href='/adminMemberList.do?page="+navi+"'>"+navi+"</a>";				
			}
			//시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			navi++;
			if(navi>totalNaviPage) {
				break;
			}
		}
		//다음버튼 생성 여부
		if(navi<=totalNaviPage) {
			navigation += "<a href='/adminMemberList.do?page="+navi+"'>다음</a>";
		}
		navigation += "</div>";
		MemberPageData mpd = new MemberPageData(navigation,(ArrayList<Member>)list);
		return mpd;
	}
	//회원 관리자로 등록 update
	public int updateGrade(List<String> memberNo) {
		return dao.updateGrade(memberNo);
	}
}
