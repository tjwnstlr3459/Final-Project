package kr.or.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	
	//관리자 페이지 이동
	@RequestMapping(value="/adminMain.do")
	public String adminMain() {
		return "admin/adminMain";
	}
	//관리자 문의/신고 이동
	@RequestMapping(value="/adminInquiryList.do")
	public String adminInquityList() {
		return "admin/adminInquiryList";
	}
	//관리자 회원목록 이동
	@RequestMapping(value="/adminMemberList.do")
	public String adminUserList() {
		return "admin/adminMemberList";
	}
	//관리자 모임목록 이동
	@RequestMapping(value="/adminClubList.do")
	public String adminClubList() {
		return "admin/adminClubList";
	}
	//관리자 제재목록 이동
	@RequestMapping(value="/adminRestrictionList.do")
	public String adminRestrictionList() {
		return "admin/adminRestrictionList";
	}
	//관리자 공지목록 이동
	@RequestMapping(value="/adminNoticeList.do")
	public String adminNoticeList() {
		return "admin/adminNoticeList";
	}
}
