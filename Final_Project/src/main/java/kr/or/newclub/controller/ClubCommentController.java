package kr.or.newclub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.newclub.model.service.ClubCommentService;
import kr.or.newclub.model.vo.ClubComment;

@Controller
public class ClubCommentController {
	@Autowired
	private ClubCommentService service;

	@ResponseBody
	@RequestMapping(value = "/commentList.do", produces = "application/json;charset=utf-8")
	public String commentList(int boardNo) {
		List list1 = service.commentList(boardNo);
		//System.out.println("보드 번호 : " + boardNo);
		System.out.println(list1);
		return new Gson().toJson(list1);
	}

	
	@ResponseBody
	@RequestMapping(value = "/insertComment.do")
	public int insertComment(ClubComment ccm) {
		int result = service.insertComment(ccm);
		System.out.println("insert 결과" + result);
		return result;
	}
}
