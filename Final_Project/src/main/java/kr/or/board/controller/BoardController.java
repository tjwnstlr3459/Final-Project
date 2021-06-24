package kr.or.board.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

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

import com.google.gson.JsonObject;

import kr.or.board.model.service.boardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;

@Controller
public class BoardController {

	@Autowired
	private boardService service;
	
	//공지사항 출력
	@RequestMapping(value = "/boardList.do")
	public String boardList(Model model,int reqPage) {	//페이지네비reqPage
//		ArrayList<Board> boardList = service.boardList();//공지사항목록
//		model.addAttribute("boardList",boardList);		//공지사항목록
		BoardPageData bpd = service.selectBoardList(reqPage);	//공지목록,페이지네비 구해오기
		model.addAttribute("boardList", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";
	}
	
	//공지상세보기
	@RequestMapping(value = "/boardOne.do")
	public String boardOne(Model model) {
		return "board/boardOne";
		}
	
	//공지글 작성페이지
	@RequestMapping(value = "/boardOneInsert.do")
	public String boardOneInsert(Model model) {
		return "board/boardOneInsert";
		}
	
	
	//서머노트로 드래그한 이미지 서버에 max용량 설정해서 업로드
	@RequestMapping(value="/adminImageUpload.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/boardImg/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
       	 //스트림 생성
            FileOutputStream fos = new FileOutputStream(targetFile); // 경로 + 파일명
            //속도개선 보조 스트림
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            //bos -> byte타입 벼환
            byte[] bytes = multipartFile.getBytes(); //try/catch 추가 설정
            bos.write(bytes);
            bos.close();
            jsonObject.addProperty("url", "/resources/fileupload/boardImg/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
            
         } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
        	 jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
         }
	
		String a = jsonObject.toString();
		return a;
	}
	
}









