package kr.or.club.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;


import kr.or.club.model.service.ClubService;
import kr.or.club.model.vo.ClubBoard;
import kr.or.club.model.vo.ClubChart;
import kr.or.club.model.vo.Club;
import kr.or.member.model.vo.Member;
import kr.or.newclub.model.vo.ClubComment;

@Controller
public class ClubController {
	@Autowired
	private ClubService service;
	
	// 회원이 속한 모임에 클럽게시물 추출
	@RequestMapping(value = "/myClub.do")
	public String myClub(@SessionAttribute(required = false) Member m,Model model,String searchCon){
		//내가 속한 클럽 출력
		ArrayList<Club> clubList = service.memberClubList(m);
		model.addAttribute("clubList",clubList);
		//클럽게시물 총갯수 출력
		int totalCount = service.totalCount(m,0,searchCon);
		model.addAttribute("totalCount",totalCount);
		//나의 쪽지 확인
		int myMessage = service.myMessage(m);
		model.addAttribute("myMessage", myMessage);
		return "club/myClub";
	}
	//검색 아작스
	@ResponseBody
	@RequestMapping(value = "/searchContent.do",produces = "application/json;charset=utf-8")
	public String searchContent(@SessionAttribute(required = false)Member m,String searchCon,int start,int changeDate) {
		ArrayList<ClubBoard> list = service.morePhoto(start,m,changeDate,searchCon);
		return new Gson().toJson(list);
	}
	
	//회원이 속한 모임에 클럽게시물 상세출력(더보기/chagneDate로 날짜조건별 조회)
	@ResponseBody
	@RequestMapping(value = "/photoMore.do")
	public ArrayList<ClubBoard> photoMore(@SessionAttribute(required = false)Member m,String searchCon,Model model, int start,int changeDate) {
	
		ArrayList<ClubBoard> list = service.morePhoto(start,m,changeDate,searchCon);
		model.addAttribute("listMore",list);		
		return list;
	}
	//게시물 클릭시 댓글 조회
	@ResponseBody
	@RequestMapping(value = "/postMoment.do",produces="application/json;charset=utf-8")
	public String postMoment(int boardNo) {
		ArrayList<ClubComment> list = service.postMoment(boardNo);
		return new Gson().toJson(list);		
	}
	//마이클럽 댓글 입력
	@ResponseBody
	@RequestMapping(value ="/comentSend.do")
	public int comentSend(@SessionAttribute(required = false) Member m,int comentBoardNo,String comentCon) {
		int result = service.insertComent(m,comentBoardNo,comentCon);
		
		return result;
	}
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/mentOut.do")
	public int mentDelete(int mentNo) {
		int result = service.deleteMent(mentNo);
		return result;
	}
	
	//날짜별 조회시 totalCount를 다시 가져온다
	@ResponseBody
	@RequestMapping(value="/selectTotalCount.do")
	public String selectTotalCount(@SessionAttribute(required = false) Member m,String searchCon, int changeDate) {
		System.out.println(changeDate);
		int totalCount = service.totalCount(m,changeDate,searchCon);
		return String.valueOf(totalCount);
	}
	
	
	//임시 게시물 등록페이지
	@RequestMapping(value = "/insertPostWrite.do")
	public String insertPostWrite() {
		return "club/insertPostWrite";
	}
	
	
	//임시게시물 등록
	@RequestMapping(value="/insertPost.do")
   public String boardWrite(ClubBoard b, MultipartFile files[], HttpServletRequest request, Model model) {
      //파일 목록을 저장할 리스트 생성
      //같은 클래스명이라 밑에 처럼 길게 나옴
      ArrayList<ClubBoard> fileList = new ArrayList<ClubBoard>();
      
      System.out.println(b.getBoardContent());
      System.out.println(b.getBoardCg());
      System.out.println(b.getBoardTitle());
      System.out.println(b.getBoardWriter());
      
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
              ClubBoard f = new ClubBoard();
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
      //DB에 넣기
      int result = service.insertPost(b,fileList);
      if(result != -1 && result == fileList.size()) {
    	  model.addAttribute("msg","등록성공");
      }else {
    	  model.addAttribute("msg","등록실패");
      }
      model.addAttribute("loc","/myClub.do");
      
      return "common/msg";
   }
	//마이클럽 차트(회원이 속한 클럽별 게시물갯수)
	@ResponseBody
	@RequestMapping(value = "/clubPostCount.do", produces="application/json;charset=utf-8")
	public String clubPostCount(@SessionAttribute(required = false) Member m){
		ArrayList<ClubChart> list = service.selectClubPostCount(m);
		return new Gson().toJson(list);
		}

	
	//영범이구역 뿌잉 뿌잉
	@RequestMapping(value="/viewClubList.do")
	public String viewClubList(int cgNo, Model model) {
		ArrayList<Club> ybClubList = service.viewClubList(cgNo);
		String cgName = service.selectCategoryName(cgNo);
		model.addAttribute("list",ybClubList);
		model.addAttribute("cgName", cgName);
		return "club/viewClubList";
	}
	@RequestMapping(value="/createClubFrm.do")
	public String createClubFrm() {
		return "club/createClubFrm";
	}
	@RequestMapping(value="/createClub.do")
	public String createClub(Member m,Club c, MultipartFile file, HttpServletRequest request, Model model) {
		if (file.isEmpty()) {
			model.addAttribute("msg", "클럽 이미지를 등록하세요!");
			model.addAttribute("loc", "/createClubFrm.do");
			return "common/msg";
		}else {
		}
			String savePath = request.getSession().getServletContext().getRealPath("/resources/clubImgUpload/");
			// for (MultipartFile file : files) { // 파일들 처리를 위한 for문 받아온 file하나씩을 files 배열에
			// 하나하나 넣어줘ㅏ야지
			// 실제 유저가 올린 파일명(filename)
			String filename = file.getOriginalFilename();

			// 유저가 올린 파일명을 마지막. 기준으로 분리 ex) test.txt ->test_1.txt /img01.jpg -> img01_1.jpg
			// 이렇게 저장 됐었다.
			// 그래서 제일먼저 하는 일이 test 와 .txt이렇게 나눌건데 만약 겹치면 뒤에 넘버링 할거다
			String onlyFilename = filename.substring(0, filename.indexOf(".")); // 0번부터 indexOf가 안에 인자가 몇번째에 있어 ? 라고
																				// 그래서 이 전까지 substrting 그니깐 . 전까지
																				// substring이 짤라내 ! 라고 하는거다 ==> test
																				// 가 들어가고
			String extention = filename.substring(filename.indexOf("."));// .부터 끝까지 다 가져와 -->.txt 가 들어가고
			String filepath = null;
			int count = 0;
			while (true) { // 겹치는 파일명이 있는지 확인하고 겹치는 파일명이 없을 때 까지 반복문 있다면 +1,2,3이런식으로 뒤에 붙인다
				if (count == 0) {
					filepath = onlyFilename + extention; // -->test.txt 이런식으로 되겠죠
				} else {
					filepath = onlyFilename + "_" + count + extention; // -->test_1.txt 이런식으로 되겠죠
				}
				File checkFile = new File(savePath + filepath);
				if (!checkFile.exists()) { // 체크파일이 존재안한다면 ? 겹치는 파일이 없다면 브레이꾸 있다면 while문으로 계속 돌겠죠
					// 근데 존재하면 while문이 또 돌겠죠 그래서 test_1.txt 하고 그 파일패스로 다시 이 if문 검사
					break;
				}
				count++;
			}
			c.setFileName(filename);
			c.setFilePath(filepath);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
                byte[] bytes = file.getBytes(); //try/catch 추가 설정
                bos.write(bytes);		//여기가파일을 진짜 올리는 쪽
                bos.close();		
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int result = service.createClub(c);
			if (result > 0) {
				model.addAttribute("msg", "클럽 등록완료!");
			} else {
				model.addAttribute("msg", "클럽등록실패!");
			}
			model.addAttribute("loc", "/viewClubList.do?cgNo="+c.getClubCg());
			System.out.println(c.toString());
			return "common/msg";
		}
	
	
	@RequestMapping(value="/deleteClub.do")
	@ResponseBody
	public String deleteClub(int clubNo) {
		System.out.println("clubNo : "+clubNo);
		int result = service.deleteClub(clubNo);
		System.out.println(result);
		if(result>0) {
			return "1";
		}
		return "0";
	}
	
	
	}




























