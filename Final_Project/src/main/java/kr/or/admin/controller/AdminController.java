package kr.or.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.admin.model.service.AdminService;
import kr.or.admin.model.vo.AdminCount;
import kr.or.admin.model.vo.DestroyMemberCountMonth;
import kr.or.admin.model.vo.MemberCountMonth;
import kr.or.admin.model.vo.Visit;
import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.ClubPageData;
import kr.or.member.model.vo.Member;



@Controller
public class AdminController {
	@Autowired
	private AdminService service;
	@Autowired
	private ClubService cService;
	

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
	public String adminClubList(int page, int sort, String category, String keyword, Model model) {
		ClubPageData cpd = cService.selectAllClub(page, sort, category, keyword);
		model.addAttribute("navigation", cpd.getNavigation());
		model.addAttribute("list",cpd.getList());
		model.addAttribute("sort",sort);
		model.addAttribute("category",category);
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
	//세션에 등록된(로그인 된) email get
	@RequestMapping(value="/insertVisit.do", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insertVisit(HttpServletRequest request) {
		//getRemoteAddr() : 유저의 ip를 리턴하는 메소드 HttpServletRequest를 import해서 사용
		String visitorIp = request.getRemoteAddr();
		Map<String, String> map = new HashMap<String, String>();
		//루프백ip 와 로컬호스트로 접속할 경우 visit 테이블에 insert 하지않는다.
		if(!(visitorIp.equals("127.0.0.1") || visitorIp.equals("0:0:0:0:0:0:0:1"))) {
			if(service.insertVisit(visitorIp) >0) {
				map.put("result","success");
				return new Gson().toJson(map);
			};
		}
		map.put("result","failed");
		return new Gson().toJson(map);
	}
	//type값을 받아서 오늘 방문자와 총 방문자수 select
	@RequestMapping(value="/selectVisit.do")
	@ResponseBody
	public String selectVisit(Visit selectType) {
		int count = service.selectVisit(selectType);
		return Integer.toString(count);
	}
	//한 달 기준 회원 count
	@RequestMapping(value="/memberCountMonth.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String memberCountMonth() {
		ArrayList<MemberCountMonth> list = service.selectMemberCountMonth();
		return new Gson().toJson(list);
	}
	//한 달 기준 탈퇴 회원 count
	@RequestMapping(value="/destroyMemberCountMonth.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String destroyMemberCountMonth() {
		ArrayList<DestroyMemberCountMonth> list = service.selectDestroyCountMember();
		return new Gson().toJson(list);
	}
	
	
	
}
