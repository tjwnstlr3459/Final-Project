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

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import kr.or.answer.model.vo.Answer;
import kr.or.board.model.service.boardService;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.BoardPageData;
import kr.or.club.model.vo.ClubBoard;

@Controller
public class BoardController {

	@Autowired
	private boardService service;
	
	//공지사항 출력
	@RequestMapping(value = "/boardList.do")
	public String boardList(Model model,int reqPage, int type) {	//페이지네비reqPage
//		ArrayList<Board> boardList = service.boardList();//공지사항목록
//		model.addAttribute("boardList",boardList);		//공지사항목록
		BoardPageData bpd = service.selectBoardList(reqPage,type);	//공지목록,페이지네비 구해오기
		model.addAttribute("boardList", bpd.getList());
		model.addAttribute("pageNavi", bpd.getPageNavi());
		return "board/boardList";			
	}
	//문의/신고 출력
	@RequestMapping(value="/adminBoardList.do")
	public String adminBoardList(Model model, int reqPage, int type) {
		BoardPageData bpd = service.selectBoardList(reqPage,type);	//공지목록,페이지네비 구해오기
		model.addAttribute("list", bpd.getList());
		model.addAttribute("navigation", bpd.getPageNavi());
		return "admin/adminBoardList";
	}
	//번호로 공지,문의/신고 selectOne > ajax 
	@RequestMapping(value="/selectOneBoard.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String selectOneBoard(int abNo) {		
		Board b = service.selectBoard(abNo);
		return new Gson().toJson(b);
	}
	//공지상세보기
	@RequestMapping(value = "/boardOne.do")
	public String boardOne(Model model,int abNo) {
		Board board = service.selectBoard(abNo);
		ArrayList<Answer> an = service.selectMoment(abNo);
		model.addAttribute("board", board);
		model.addAttribute("abNo", abNo);
		model.addAttribute("answer", an);
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
		
        /*String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.*/
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
            //bos -> byte타입 변환
            byte[] bytes = multipartFile.getBytes(); //try/catch 추가 설정
            bos.write(bytes);
            bos.close();
            //contextroot + resources + 저장할 내부 폴더명
            jsonObject.addProperty("url", "/resources/fileupload/boardImg/"+savedFileName); 
			jsonObject.addProperty("responseCode", "success");
            
         } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
        	 jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
         }
	
		String a = jsonObject.toString();	//Ajax에 값 전달
		return a;
	}
	
	
	//공지사항 댓글작성
	@RequestMapping(value = "/insertComent.do")
	public String insertComent(Answer an,Model model,int abNo) {
		an.setAbNo(abNo);
		int result = service.insertComent(an);
		if(result>0) {
			model.addAttribute("msg", "등록되었습니다.");
		}else {
			model.addAttribute("msg", "등록실패.");
		}
		model.addAttribute("loc", "boardOne.do?abNo="+abNo);
		return "common/msg";
	}
	
	//공지/문의/신고 등록
	@RequestMapping(value = "/boardInsert.do")
	public String boardInsert(Board bl, Model model, MultipartFile files1[], HttpServletRequest request) {

		 //파일 목록을 저장할 리스트 생성
	      //같은 클래스명이라 밑에 처럼 길게 나옴
	      ArrayList<Board> fileList = new ArrayList<Board>();
	      
	      System.out.println(files1.length);
	      //파일이 존재하지 않더라도 배열은 무조건 길이 1을 가짐
	      if(files1[0].isEmpty()) { //첫번째 타입이 비어있는지 확인
	    	  //첨부파일이 없는 경우
	    	  
	      }else {
	    	  //첨부파일이 있는경우
	    	  //파일처리
	          //getRealPath() -> webapp 폴더
	          String savePath = request.getSession()
	        		  					.getServletContext()
	        		  					.getRealPath("/resources/fileupload/board/");
	          
	          //파일이 1~여러개라 for문으로 묶어준다
	          for(MultipartFile file : files1) {
	        	  
	        	//실제 유저가 올린 파일명(filename)
	              String filename = file.getOriginalFilename();
	              System.out.println(filename);
	              //유저가 올린 파일명을 마지막  . 기준으로 분리 test.txt -> test / .txt 로 나누고 겹치면 넘버링을 해주는 형식
	              // indexof : .위치 추출 / substring : begin ~ end 까지 자르기
	              //0부터 filename.indexOf(".") ""안에있는 것까지 onlyFilename에 집어넣어라
	              String onlyFilename = filename.substring(0 , filename.indexOf(".")); 
	              String extention = filename.substring(filename.indexOf("."));// .txt 
	              String filepath = null;
	              int count = 0;
	              
	              // 중복이름 필터
	              while(true) {
	                 if(count == 0) {
	                    filepath = onlyFilename + extention; //test.txt
	                 }else {
	                    filepath = onlyFilename + "_" + count + extention; //test_카운트 숫자.txt
	                 }
	                 File checkFile = new File(savePath+filepath);
	                 if(!checkFile.exists()) { //존재하지 않으면 
	                    break;
	                 }
	                 count++;
	              }
	              Board f = new Board();
	              f.setFileName(filename);
	              f.setFilePath(filepath);
	              fileList.add(f);
	              
	              System.out.println("filename : "  +filename);
	              System.out.println("filepath : "  +filepath);
	              
	              try {
	            	 //스트림 생성
	                 FileOutputStream fos = new FileOutputStream(new File(savePath+filepath)); // 경로 + 파일명
	                 //속도개선 보조 스트림
	                 BufferedOutputStream bos = new BufferedOutputStream(fos);
	                 //bos -> byte타입 벼환
	                 byte[] bytes = file.getBytes(); //try/catch 추가 설정
	                 bos.write(bytes);
	                 bos.close();
	                 
	              } catch (FileNotFoundException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              } catch (IOException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              }
	          }
	       }
	      
		  int result = service.insertBoard(bl,fileList);
		  System.out.println(result);
		  System.out.println(fileList.size());
	      //DB에 넣기
	      if(result != -1 && result == fileList.size()) {
	    	  model.addAttribute("msg","등록되었습니다.");
	      }else {
	    	  model.addAttribute("msg","등록실패");
	      }
	      model.addAttribute("loc","/boardList.do?reqPage="+1+"&type="+1);
	      return "common/msg";
	}
	
	//공지글 삭제
	@RequestMapping(value = "/delete.do")
	public String delete(int abNo,Model model) {
		int result = service.deleteBoard(abNo);
		if(result>0) {
			model.addAttribute("msg", "공지가 삭제되었습니다.");
		}else {
			model.addAttribute("msg", "삭제 실패");
		}
		model.addAttribute("loc","/boardList.do?reqPage="+1+"&type="+1);
		return "common/msg";
	}
	
	//수정페이지 이동
	@RequestMapping(value = "/modify")
	public String modify(Model model,int abNo,Board bl) {
		model.addAttribute("board", abNo);
		Board boardOne = service.selectBoard(abNo);
		model.addAttribute("boardOne", boardOne);
		return "board/boardOneInsert";
	}
	
	//공지글 수정
	@RequestMapping(value = "/boardUpdate.do")
	public String boardUpdate(Board bl,Model model, MultipartFile files2[], HttpServletRequest request) {
		//파일 목록을 저장할 리스트 생성
	      //같은 클래스명이라 밑에 처럼 길게 나옴
	      ArrayList<Board> fileList = new ArrayList<Board>();
	      
	      System.out.println(files2.length);
	      //파일이 존재하지 않더라도 배열은 무조건 길이 1을 가짐
	      if(files2[0].isEmpty()) { //첫번째 타입이 비어있는지 확인
	    	  //첨부파일이 없는 경우
	    	  
	      }else {
	    	  //첨부파일이 있는경우
	    	  //파일처리
	          //getRealPath() -> webapp 폴더
	          String savePath = request.getSession()
	        		  					.getServletContext()
	        		  					.getRealPath("/resources/fileupload/board/");
	          
	          //파일이 1~여러개라 for문으로 묶어준다
	          for(MultipartFile file : files2) {
	        	  
	        	//실제 유저가 올린 파일명(filename)
	              String filename = file.getOriginalFilename();
	              System.out.println(filename);
	              //유저가 올린 파일명을 마지막  . 기준으로 분리 test.txt -> test / .txt 로 나누고 겹치면 넘버링을 해주는 형식
	              // indexof : .위치 추출 / substring : begin ~ end 까지 자르기
	              //0부터 filename.indexOf(".") ""안에있는 것까지 onlyFilename에 집어넣어라
	              String onlyFilename = filename.substring(0 , filename.indexOf(".")); 
	              String extention = filename.substring(filename.indexOf("."));// .txt 
	              String filepath = null;
	              int count = 0;
	              
	              // 중복이름 필터
	              while(true) {
	                 if(count == 0) {
	                    filepath = onlyFilename + extention; //test.txt
	                 }else {
	                    filepath = onlyFilename + "_" + count + extention; //test_카운트 숫자.txt
	                 }
	                 File checkFile = new File(savePath+filepath);
	                 if(!checkFile.exists()) { //존재하지 않으면 
	                    break;
	                 }
	                 count++;
	              }
	              Board f = new Board();
	              f.setFileName(filename);
	              f.setFilePath(filepath);
	              fileList.add(f);
	              
	              System.out.println("filename : "  +filename);
	              System.out.println("filepath : "  +filepath);
	              
	              try {
	            	 //스트림 생성
	                 FileOutputStream fos = new FileOutputStream(new File(savePath+filepath)); // 경로 + 파일명
	                 //속도개선 보조 스트림
	                 BufferedOutputStream bos = new BufferedOutputStream(fos);
	                 //bos -> byte타입 벼환
	                 byte[] bytes = file.getBytes(); //try/catch 추가 설정
	                 bos.write(bytes);
	                 bos.close();
	                 
	              } catch (FileNotFoundException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              } catch (IOException e) {
	                 // TODO Auto-generated catch block
	                 e.printStackTrace();
	              }
	          }
	       }
		int result = service.boardUpdate(bl,fileList);
		if(result != -1 && result == fileList.size()) {
			model.addAttribute("msg", "수정되었습니다.");
		}else {
			model.addAttribute("msg", "수정실패");
		}
		model.addAttribute("loc","/boardList.do?reqPage="+1+"&type="+1);
		return "common/msg";
	}
}


















