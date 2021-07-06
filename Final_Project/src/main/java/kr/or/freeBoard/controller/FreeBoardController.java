package kr.or.freeBoard.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.freeBoard.model.service.FreeBoardService;
import kr.or.freeBoard.model.vo.FreeBoard;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;

	@ResponseBody
	@RequestMapping(value = "/selectFreeBoards.do")
	public ArrayList<FreeBoard> selectFreeBoards(HttpServletRequest request, int start, Model model) {
		ArrayList<FreeBoard> list = service.selectFreeBoards(start);
		return list;
	}

	@RequestMapping(value = "/freeBoardList.do")
	public String freeBoardList(Model model) {
		int FreeBoardtotalCount = service.FreeBoardtotalCount();
		model.addAttribute("totalCount", FreeBoardtotalCount);
		return "freeBoard/freeBoardList";
	}

	@RequestMapping(value = "/insertFreeBoardFrm.do")
	public String insertFreeBoardFrm() {
		return "freeBoard/freeBoardFrm";
	}

	
	@RequestMapping(value = "/insertFreeBoard.do")
	public String insertFreeBoard(MultipartFile files, HttpServletRequest request, FreeBoard fb, Model model) {
		// ArrayList<FreeBoard> fileList = new ArrayList<FreeBoard>();
		if (files.isEmpty()) {
			model.addAttribute("msg", "이미지를 등록하세요!");
			model.addAttribute("loc", "/insertFreeBoardFrm.do");
			return "common/msg";
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/freeBoardUpload/");
			// for (MultipartFile file : files) { // 파일들 처리를 위한 for문 받아온 file하나씩을 files 배열에
			// 하나하나 넣어줘ㅏ야지
			// 실제 유저가 올린 파일명(filename)
			String filename = files.getOriginalFilename();

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
			fb.setFilename(filename);
			fb.setFilepath(filepath);
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
                byte[] bytes = files.getBytes(); //try/catch 추가 설정
                bos.write(bytes);		//여기가파일을 진짜 올리는 쪽
                bos.close();		
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			int result = service.insertFreeBoard(fb);
			if (result > 0) {
				model.addAttribute("msg", "피드등록성공!");
			} else {
				model.addAttribute("msg", "피드등록실패!");
			}
			model.addAttribute("loc", "/freeBoardList.do");
		}
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/addHeart.do")
	public int addHeart(int fbNo, int userNo) {
		int result = service.addHeart(fbNo,userNo);
		if(result > 0) {			
			return 1;
		}else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value="/minusHeart.do")
	public int minusHeart(int fbNo, int userNo) {
		int result = service.minusHeart(fbNo,userNo);
		if(result > 0) {			
			return 1;
		}else {
			return 0;
		}
	}
	
	@RequestMapping(value="/updateFreeBoardFrm.do")
	public String updateFreeBoardFrm(int fbNo, Model model) {
		FreeBoard fb = service.selectFreeBoardByFbNo(fbNo);
		model.addAttribute("fb", fb);
		return "freeBoard/updateFreeBoardFrm";
	}
	@RequestMapping(value="/updateFreeBoard.do")
	public String updateFreeBoard(MultipartFile files, HttpServletRequest request,FreeBoard fb, Model model, String status, String oldFilename, String oldFilepath) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/freeBoardUpload/");
		String filename = files.getOriginalFilename();
		String filepath = null;
		  if(!status.equals("delete")) { 
			filename = oldFilename;
			filepath = oldFilepath;
		  }else {			  
			  File delFile = new File(savePath+"/"+oldFilepath);
			  delFile.delete();
			  String onlyFilename = filename.substring(0, filename.indexOf(".")); 
			  String extention = filename.substring(filename.indexOf("."));
			  int count = 0;
			  while (true) { 
				  if (count == 0) {
					  filepath = onlyFilename + extention;
				  } else {
					  filepath = onlyFilename + "_" + count + extention; 
				  }
				  File checkFile = new File(savePath + filepath);
				  if (!checkFile.exists()) { 
					  break;
				  }
				  count++;
			  }
			  
			  try {
				  FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				  BufferedOutputStream bos = new BufferedOutputStream(fos);
				  byte[] bytes = files.getBytes(); 
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
		  fb.setFilename(filename);
		  fb.setFilepath(filepath);
			int result = service.updateFreeBoard(fb);
			if (result > 0) {
				model.addAttribute("msg", "피드업데이트성공!");
			} else {
				model.addAttribute("msg", "피드업데이트실패!");
			}
			model.addAttribute("loc", "/freeBoardList.do");
			System.out.println(fb.toString());
		
		return "common/msg";
	}
	@RequestMapping(value="/deleteFreeBoard.do")
	public String deleteFreeBoard(int fbNo, Model model, HttpServletRequest request) {
		String filepath = service.selectFilepath(fbNo);
		int result = service.deleteFreeBoard(fbNo);
		if(result > 0) {			
		String savePath = request.getSession().getServletContext().getRealPath("/resources/freeBoardUpload/");
		File delFile = new File(savePath+"/"+filepath);
		  delFile.delete();
			model.addAttribute("msg", "삭제성공");
		}else {			
			model.addAttribute("msg", "삭제실패");
		}
		model.addAttribute("loc", "/freeBoardList.do");
		return "common/msg";
	}
	@ResponseBody
	@RequestMapping(value="/addViews.do")
	public int addViews(int fbNo) {
		int result = service.addViews(fbNo);
		if(result > 0) {			
			return 1;
		}else {
			return 0;
		}
	}
}