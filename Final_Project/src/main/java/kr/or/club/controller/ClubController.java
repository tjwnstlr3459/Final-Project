package kr.or.club.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
>>>>>>> branch 'main' of https://github.com/tjwnstlr3459/Final-Project.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.Board;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;

@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	
	@RequestMapping(value = "/myClub.do")
	public String myClub(@SessionAttribute(required = false) Member m,Model model){
		ArrayList<Club> clubList = service.memberClubList(m);
//		ArrayList<Board> clubPosts = service.memberClubPosts(m);
		int totalCount = service.totalCount(m);
		
		model.addAttribute("clubList",clubList);
//		model.addAttribute("clubPosts",clubPosts);
		model.addAttribute("totalCount",totalCount);
		return "club/myClub";
	}
	
	@ResponseBody
	@RequestMapping(value = "/photoMore.do")
	public ArrayList<Board> photoMore(@SessionAttribute(required = false) Member m,Model model, int start) {
		
		ArrayList<Board> list = service.morePhoto(start,m);
		model.addAttribute("listMore",list);
		return list;
	}
<<<<<<< HEAD
=======

	// 게시물 등록페이지
	@RequestMapping(value = "/insertPostWrite.do")
	public String insertPostWrite() {
		return "club/insertPostWrite";
	}
	
//	@RequestMapping(value="/insertPost.do", produces = "application/json; charset=utf8")
//	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request,Board b,Model model)  {
//		JsonObject jsonObject = new JsonObject();
//		System.out.println("test");
//        /*
//		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
//		 */
//		// 내부경로로 저장
//		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
//		String fileRoot = contextRoot+"resources/fileupload/postImg";
//		
//		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
//		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
//		
//		
//		File targetFile = new File(fileRoot + savedFileName);	
//		try {
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
//			jsonObject.addProperty("url", "/resources/fileupload/postImg"+savedFileName); 	//contextroot + resources + 저장할 내부 폴더명
//			jsonObject.addProperty("responseCode", "success");
//				
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//		String a = jsonObject.toString();
//		return "common/msg";
//	}
	
	
	
	
	
	
	
>>>>>>> branch 'main' of https://github.com/tjwnstlr3459/Final-Project.git
	
}
















