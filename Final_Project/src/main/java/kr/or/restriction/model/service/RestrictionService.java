package kr.or.restriction.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.category.model.vo.Category;
import kr.or.restriction.model.dao.RestrictionDao;
import kr.or.restriction.model.vo.Restriction;
import kr.or.restriction.model.vo.RestrictionPageData;

@Service
public class RestrictionService {
	@Autowired
	private RestrictionDao dao;

	@Transactional
	public int insertRest(Restriction rest) {
		return dao.insertRest(rest);
	}
	@Transactional
	public int updateMemberGrade(Restriction rest) {
		return dao.updateMemberGrade(rest);
	}
	@Transactional
	public void deleteRestEndDate() {
		int result1 = dao.updateEndRestMember();
		int result2 = dao.deleteRestEndDate();
		System.out.println("회원 등급 update : "+result1);
		System.out.println("이용제한 회원 delete : "+result2);
	}
	public RestrictionPageData selectAllRest(int page) {
		int listLength = 50;														//목록(화면)에 보여줄 게시글 갯 수
		int naviPages = 5;
		int end = listLength * page;					//list 끝 값
		int start = end - listLength + 1;				//list 시작 값
		
		HashMap<String, Integer> se = new HashMap<String, Integer>();
		se.put("start", start);
		se.put("end",end);
		
		List list = dao.selectAllRest(se);	// 전체 회원을 가지고온다.
		int restCount = dao.restCount();										//전체 게시글 갯 수
		//페이지 네비게이션 만들기 전 페이지 설정
		int totalNaviPage = restCount%listLength == 0 ? restCount/listLength : restCount/listLength+1;		//% == 0인경우 다음페이지 네비게이션을 만들지 않기 위함
		int navi = ((page - 1) / naviPages)*naviPages+1;					//페이지 네비게이션의 시작 값 > 1~5 : 1 / 6 ~ 10 : 6
		String navigation = "<div>";
		//이전버튼 생성 여부
		if(navi!=1) {
			navigation += "<a href='/adminRestrictionList.do?page="+(navi-1)+"'>이전</a>";
		}
		//1~5단위 페이지 생성
		for(int i=0;i<naviPages;i++) {
			//사용자가 클릭해서 보고있는 페이지인 경우 효과
			if(navi==page) {
				navigation += "<a href='/adminRestrictionList.do?page="+navi+"' class='naviFocus'>"+navi+"</a>";
			}else {
				navigation += "<a href='/adminRestrictionList.do?page="+navi+"'>"+navi+"</a>";				
			}
			//시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			navi++;
			if(navi>totalNaviPage) {
				break;
			}
		}
		//다음버튼 생성 여부
		if(navi<=totalNaviPage) {
			navigation += "<a href='/adminRestrictionList.do?page="+navi+"'>다음</a>";
		}
		navigation += "</div>";

		RestrictionPageData rpd = new RestrictionPageData(navigation, (ArrayList<Restriction>)list);
		return rpd;
	}
}
