package kr.or.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.oreilly.servlet.MultipartRequest;


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
	//서머노트에 드래그한 이미지를 서버에 업로드
	
	
	
	@ResponseBody
	@RequestMapping(value="/imageUpload.do", method=RequestMethod.POST)
	public String imageUpload(HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");
		String saveDirectory = root+"resource/fileupload";
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest mRequest = null;
		return null;
	}
	
	
	
	
}
