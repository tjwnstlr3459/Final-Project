package kr.or.newclub.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.board.model.vo.Board;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.service.newClubService;
import kr.or.newclub.model.vo.Apply;
import kr.or.newclub.model.vo.ClubMember;
import kr.or.newclub.model.vo.clubBoard;

@Controller
public class newClubController {
	@Autowired
	private newClubService service;
	
	@RequestMapping(value = "/newClub.do")
	public String newClub(@SessionAttribute(required = false) Member m,int clubNo,Model model){
		
		int totalCount = service.totalCount(clubNo);
		model.addAttribute("totalCount",totalCount);
		model.addAttribute("clubNo", clubNo);
		List list = service.boardList();
		model.addAttribute("list",list);
		
		//가입신청한 회원 출력
		ArrayList<Apply> applyList = service.selectApply(clubNo);
		model.addAttribute("applyList", applyList);
		//가입된 회원 출력
		ArrayList<ClubMember> clubMemberList = service.selectMemberList(clubNo);
		model.addAttribute("clubMemberList", clubMemberList);
		return "newclub/newClub";
	}
	
	@RequestMapping(value = "/allMemberChat.do")
	public String allMemberChat(){
		return "newclub/newClub";
	}
	
	@ResponseBody
	@RequestMapping(value = "/clubBoardMore.do",produces="application/json;charset=utf-8")
	public String clubBoardMore(int start, int clubNo){
		ArrayList<Board> list = service.clubBoardMore(start,clubNo);
		return new Gson().toJson(list);
	}
	
	//클럽 가입신청
	@ResponseBody
	@RequestMapping(value = "/memberClubJoin.do")
	public int memberClubJoin(Model model,Apply Apply) {
		int result = service.insertApply(Apply);
		return result;
	}
	
	
	
	/*아작스에서 제이슨 전달 방법
	@ResponseBody//모델은 컨트롤러에서 화면으로전달하기위한..
	@RequestMapping(value="/allMemberAjax.do",produces="application/json;charset=utf-8")//리턴해주는 값은 제이슨이고 한글깨짐 방지 utf-8
	public String allMembAjax() {
		ArrayList<Member> list = service.selectAllMember();
		return new Gson().toJson(list);
	}
	*/
	@Transactional
	@RequestMapping(value="/boardWrite.do")
		//jsp이름이랑 같아야함//3개받아오고(제목,내용,작성자등)/파일경로가지고오기)
		  public String boardWrite(clubBoard b, MultipartFile files[], HttpServletRequest request, Model model) {
			  //files이름 주의! input에 name과 달라야함
		      //파일 목록을 저장할 리스트 생성
		      //같은 클래스명이라 밑에 처럼 길게 나옴
		      ArrayList<clubBoard> fileList = new ArrayList<clubBoard>();
		      
		      //파일이 존재하지 않더라도 배열은 무조건 길이 1을 가짐
		      if(files[0].isEmpty()) { //첫번째 타입이 비어있는지 확인
		    	  //첨부파일이 없는 경우
		    	  
		      }else {
		    	  //첨부파일이 있는경우
		    	  //파일처리
		          //getRealPath() -> webapp 폴더
		          String savePath = request.getSession()
		        		  					.getServletContext()
		        		  					.getRealPath("/resources/image/clubimg/");
		          
		          //파일이 1~여러개라 for문으로 묶어준다
		          for(MultipartFile file : files) {
		        	  
		        	//실제 유저가 올린 파일명(filename)
		              String filename = file.getOriginalFilename();
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
		              clubBoard f = new clubBoard();
		              f.setFilename(filename);
		              f.setFilepath(filepath);
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
		      //DB에 넣기
		      int result = service.insertBoard(b, fileList);		      
		      if(result != -1 && result == fileList.size()) {
		    	  model.addAttribute("msg","등록성공");
		      }else {
		    	  model.addAttribute("msg","등록실패");
		      }
		      model.addAttribute("loc","/newClub.do?clubNo=38");
		      
		      return "common/msg";
		   }

	/*사진첩 등록
  @RequestMapping(value = "/photoWriteFrm.do")
   public String photoWriteFrm(int clubNo, Model model) {
		
		  clubBoard c = service.selectOne(clubNo); model.addAttribute("clubNo", c);
		 
      return "newclub/photoWriteFrm";
   }
  @RequestMapping(value="/photoWrite.do")
  public String photoWrite(clubBoard b, MultipartFile files[], HttpServletRequest request, Model model) {
	  //files이름 주의! input에 name과 달라야함
      //파일 목록을 저장할 리스트 생성
      //같은 클래스명이라 밑에 처럼 길게 나옴
      ArrayList<clubBoard> fileList = new ArrayList<clubBoard>();
      
      //파일이 존재하지 않더라도 배열은 무조건 길이 1을 가짐
      if(files[0].isEmpty()) { //첫번째 타입이 비어있는지 확인
    	  //첨부파일이 없는 경우
    	  
      }else {
    	  //첨부파일이 있는경우
    	  //파일처리
          //getRealPath() -> webapp 폴더
          String savePath = request.getSession()
        		  					.getServletContext()
        		  					.getRealPath("/resources/image/clubimg/");
          
          //파일이 1~여러개라 for문으로 묶어준다
          for(MultipartFile file : files) {
        	  
        	//실제 유저가 올린 파일명(filename)
              String filename = file.getOriginalFilename();
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
              clubBoard f = new clubBoard();
              f.setFilename(filename);
              f.setFilepath(filepath);
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
      //DB에 넣기
      int result = service.insertPhoto(b,fileList);
      if(result != -1 && result == fileList.size()) {
    	  model.addAttribute("msg","등록성공");
      }else {
    	  model.addAttribute("msg","등록실패");
      }
      model.addAttribute("loc","/newClub.do?clubNo=38");
      
      return "common/msg";
   }
  */
	
	
}






















