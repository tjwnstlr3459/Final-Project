package kr.or.freeBoard.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.freeBoard.model.service.FreeBoardService;
import kr.or.freeBoard.model.vo.FreeBoard;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService service;

	@RequestMapping(value = "/freeBoardList.do")
	public String freeBoardList() {
		return "freeBoard/freeBoardList";
	}

	@RequestMapping(value = "/insertFreeBoardFrm.do")
	public String insertFreeBoardFrm() {
		return "freeBoard/freeBoardFrm";
	}

	@RequestMapping(value = "/insertFreeBoard.do")
	public String insertFreeBoard(MultipartFile files, HttpServletRequest request, FreeBoard fb, Model model) {
		//ArrayList<FreeBoard> fileList = new ArrayList<FreeBoard>();
		if (files.isEmpty()) {
			model.addAttribute("msg", "이미지를 등록하세요!");
			model.addAttribute("loc", "/insertFreeBoardFrm.do");
			return "common/msg";
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/freeBoardUpload/");
			//for (MultipartFile file : files) { // 파일들 처리를 위한 for문 받아온 file하나씩을 files 배열에 하나하나 넣어줘ㅏ야지
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
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				int result = service.insertFreeBoard(fb);
				if(result > 0) {
					model.addAttribute("fb", fb);
					return "freeBoard/freeBoardList";
				}else {
					model.addAttribute("msg", "피드등록실패!");										
				}
				model.addAttribute("loc", "/freeBoardList.do");
				System.out.println(fb.toString());
			}
			return "common/msg";
		}
	}
//}