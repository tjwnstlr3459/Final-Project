package kr.or.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.AdminCount;
import kr.or.directMessage.model.service.DirectMessageService;
import kr.or.directMessage.model.vo.DirectMessage;
import kr.or.member.model.service.MemberService;



@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	private DirectMessageService dmService;
	

	//관리자 문의/신고 이동
//	@RequestMapping(value="/adminInquiryList.do")
//	public String adminInquityList() {
//		return "admin/adminInquiryList";
//	}
	//관리자 회원목록 이동
//	@RequestMapping(value="/adminMemberList.do")
//	public String adminUserList() {
//		return "admin/adminMemberList";
//	}
	//관리자 모임목록 이동
	@RequestMapping(value="/adminClubList.do")
	public String adminClubList() {
		return "admin/adminClubList";
	}
	//관리자 제재목록 이동
//	@RequestMapping(value="/adminRestrictionList.do")
//	public String adminRestrictionList() {
//		return "admin/adminRestrictionList";
//	}
	//서머노트에 드래그한 이미지를 서버에 업로드
	@RequestMapping(value="/imageUpload.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	//관리자 페이지 메인 이동 시 차트/통계에 필요한 값 가져오기 > 사이트 서비스 시작 시점부터 현재
	@RequestMapping(value="/adminMain.do")
	public String adminMain(Model model) {
		AdminCount ac = service.selectAdminCount();
		model.addAttribute("ac",ac);
		return "admin/adminMain";
	}
	//관리자 페이지 로드 시 AdminCount 가져오기
	@RequestMapping(value="/selectAdminCount.do", produces = "appication/json;charset=utf-8")
	@ResponseBody
	public String selectAdminCount() {
		AdminCount ac = service.selectAdminCount();
		return new Gson().toJson(ac);
	}
	
	
	
}
