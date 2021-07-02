package kr.or.directMessage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.directMessage.model.service.DirectMessageService;
import kr.or.directMessage.model.vo.DirectMessage;

@Controller
public class DirectMessageController {
	@Autowired
	private DirectMessageService service;
	
	@RequestMapping(value="/insertDm.do")
	public String insertDm(DirectMessage dm, Model model) {
		int result = service.insertDm(dm);
		if(result >0) {
			int result1 = service.updateWarningCount(dm);
			model.addAttribute("msg","작성 완료!");
			
		}else {
			model.addAttribute("msg","작성 실패");			
		}
		model.addAttribute("loc","/adminMain.do");
		return "common/msg";
	}
	@RequestMapping(value="/insertMultiDm",method=RequestMethod.POST)
	@ResponseBody
	public String insertMultiDm(@RequestParam(value="memberNo[]")String[] memberNo, DirectMessage dm ) {
		System.out.println(dm.getSender());
		System.out.println(dm.getReceiver());
		System.out.println("==================");
		for(int i=0;i<memberNo.length;i++) {
			System.out.println(memberNo[i]);
		}
		int result = service.insertMultiDm(dm,memberNo);
		if(result == memberNo.length) {
			return "1";
		}
		return "0";
	}
	
	//유저 쪽지 전송
	@ResponseBody
	@RequestMapping(value="/user/sendDm.do")
	public String userSendDm(DirectMessage dm) {
		int result = service.insertDm(dm);
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}	
	
	//유저 쪽지 1개 select
	@ResponseBody
	@RequestMapping(value="/user/selectDm.do", produces="application/json;charset=utf-8")
	public String userSelectDm(DirectMessage dm) {
		DirectMessage oneDm = service.userSelectDm(dm);
		return new Gson().toJson(oneDm);		
	}
	
	//유저 쪽지 읽음
	@ResponseBody
	@RequestMapping(value="/user/updateDm.do")
	public String updateDm(DirectMessage dm) {
		int result = service.updateDm(dm);
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}	
	
	
}
