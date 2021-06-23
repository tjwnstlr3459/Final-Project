package kr.or.newclub.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.board.model.vo.Board;

import kr.or.member.model.vo.Member;
import kr.or.newclub.model.service.newClubService;

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
	/*아작스에서 제이슨 전달 방법
	@ResponseBody//모델은 컨트롤러에서 화면으로전달하기위한..
	@RequestMapping(value="/allMemberAjax.do",produces="application/json;charset=utf-8")//리턴해주는 값은 제이슨이고 한글깨짐 방지 utf-8
	public String allMembAjax() {
		ArrayList<Member> list = service.selectAllMember();
		return new Gson().toJson(list);
	}
	*/
}
