package kr.or.directMessage.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.directMessage.model.dao.DirectMessageDao;
import kr.or.directMessage.model.vo.DirectMessage;
import kr.or.directMessage.model.vo.DirectMessageData;

@Service
public class DirectMessageService {
	@Autowired
	private DirectMessageDao dao;
	
	@Transactional
	public int insertDm(DirectMessage dm) {
		return dao.insertDm(dm);
	}
	public ArrayList<DirectMessage> selectAllDm() {
		return (ArrayList<DirectMessage>)dao.selectAllDm();
	}

	@Transactional
	public int updateWarningCount(DirectMessage dm) {
		return dao.updateWarningCount(dm);
	}
	@Transactional
	public int updateWarningCountClub(int clubNo) {
		return dao.updateWarningCountClub(clubNo);
	}
	
	@Transactional
	public int insertMultiDm(DirectMessage dm, String[] memberNo) {		
		return dao.insertMultiDm(dm,memberNo);
	}

	public DirectMessageData selectDmByName(String memberNick, int index) {
		DirectMessageData dmData = new DirectMessageData();
		System.out.println(index);
		
		int paging = 5;
		int dataPerPage = 10;
		int end = index * dataPerPage;
		int start = end - dataPerPage + 1;
		
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("start", Integer.toString(start));
		param.put("end", Integer.toString(end));
		param.put("memberNick", memberNick);
		System.out.println(param.get("start"));
		System.out.println(param.get("end"));
		
		
		
		dmData.setUnreadDmList((ArrayList<DirectMessage>)dao.selectUnreadDmByName(param));
		dmData.setDmList((ArrayList<DirectMessage>)dao.selectDmByName(param));
		System.out.println(dmData.getDmList().size());
		int unreadDm = dao.selectUnreadDm(memberNick);
		dmData.setUnread(unreadDm);
		int allDm = dao.selectAllDmCount(memberNick);
		System.out.println(allDm);		
		
		//전체 DM 페이지 내비게이션
		int allTotalNaviPage = allDm % dataPerPage == 0 ? allDm / dataPerPage : allDm / dataPerPage + 1;
		
		int allNavi = ((index - 1) / paging) * paging + 1;
		String allDmNavigation = "<div class='paging'>";
		// 이전버튼 생성 여부
		if (allNavi != 1) {
			allDmNavigation += "<a href='javascript:void(0)' onclick='readPaging(" + (index - paging) + ")'>" + "&#60;</a>";
		} else {
			allDmNavigation += "<div class='pageDisabled'>&#60;</div>";
		}
		// 1~5단위 페이지 생성
		for (int i = 0; i < paging; i++) {
			// 사용자가 클릭해서 보고있는 페이지인 경우 효과
			if (allNavi == index) {
				allDmNavigation += "<div class='pageThis'>" + allNavi + "</div>";
			} else {
				allDmNavigation += "<a href='javascript:void(0)' onclick='readPaging(this)'>" + allNavi + "</a>";
			}
			// 시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			allNavi++;
			if (allNavi > allTotalNaviPage) {
				break;
			}
		}
		// 다음버튼 생성 여부
		if (allNavi <= allTotalNaviPage) {
			allDmNavigation += "<a href='javascript:void(0)' onclick='readPaging(" + (index + paging) + ")'>" + "&#60;</a>";
		} else {
			allDmNavigation += "<div class='pageDisabled'>&#60;</div>";
		}
		allDmNavigation += "</div>";
		
		dmData.setAllPaging(allDmNavigation);
		return dmData;		
	}
	
	@Transactional
	public int updateDm(DirectMessage dm) {
		return dao.updateDm(dm);
	}

	public DirectMessage userSelectDm(DirectMessage dm) {
		return dao.selectOneDm(dm);
	}

}
