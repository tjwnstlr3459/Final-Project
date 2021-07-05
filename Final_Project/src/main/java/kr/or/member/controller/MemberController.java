package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutionException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;

import kr.or.category.model.vo.Category;
import kr.or.directMessage.model.service.DirectMessageService;
import kr.or.directMessage.model.vo.DirectMessage;
import kr.or.directMessage.model.vo.DirectMessageData;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Friends;
import kr.or.member.model.vo.FriendsData;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.member.model.vo.NaverLogin;
import kr.or.restriction.model.vo.Restriction;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private DirectMessageService dmService;
	
	private NaverLogin naverLogin;
	@Autowired
	private void setNaverLoginBO(NaverLogin naverLogin){
		this.naverLogin = naverLogin;
	}
	
	//로그인 페이지로 이동
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	//로그인
	@RequestMapping(value="/login.do")
		public String login(Member m, HttpSession session, Model model) {		
			Member member = service.selectOneMember(m);
			Restriction rest = service.selectOneRestriction(m.getEmail());
			if(member != null && rest == null) {
				int result = service.changeLastDate(m);
				session.setAttribute("m", member);
				model.addAttribute("msg","로그인되었습니다.");	
				model.addAttribute("loc","main.jsp");
				return "common/msg";
			} else if(member != null && rest != null) {
				model.addAttribute("name", member.getMemberNick());	
				model.addAttribute("email", member.getEmail());	
				model.addAttribute("rest", rest);
				return "user/restricted";
			} else {
				model.addAttribute("msg","아이디 또는 비밀번호를 확인하세요");
				model.addAttribute("loc","/loginFrm.do");
				return "common/msg";
			}			
						
		}
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//회원가입 페이지
	@RequestMapping(value="/join.do")
	public String join(HttpSession session, Model model) {		
//		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
//        String naverAuthUrl = naverLogin.getAuthorizationUrl(session);        
//        /* 생성한 인증 URL을 View로 전달 */
//        model.addAttribute("nUrl",naverAuthUrl);
		ArrayList<Category> category = service.getCategory();
		model.addAttribute("category", category);
		return "user/join";
	}
	
	//이메일 체크(비밀번호 찾기, 가입 시 중복 체크	)
	@ResponseBody
	@RequestMapping(value="/user/chkEmail.do")
	public String chkEmail(Member m) {
		System.out.println(m.getEmail());
		Member member = service.selectOneMember(m);
		if(member != null && member.getJoinMethod() == 1) { //일반 가입
			return "1";
		} else if(member != null && member.getJoinMethod() == 2) { //소셜 가입
			return "2";
		} else {		
			return "0";
		}
	}
	
	//이름 중복 체크
	@ResponseBody
	@RequestMapping(value="/user/chkName.do")
	public String chkName(Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}
	
	//회원 검색(친구 추가용)
	@ResponseBody
	@RequestMapping(value="/user/findUser.do", produces="application/json;charset=utf-8")
	public String chkName(String user) {
		Member member = service.selectOneMember(user);
		if(member != null) {
			return new Gson().toJson(member);			
		}else {
			return "1";
		}
	}

	//친구 추가
	@ResponseBody
	@RequestMapping(value="/user/addFriend.do")
	public String addFriend(@SessionAttribute(required = false) Member m, Friends f) {
		Friends friend = service.selectFriend(f);
		System.out.println(m.getMemberNick());
		if(friend != null) { //친구 테이블에 존재
			if(friend.getAccept().equals("Y")) { //이미 친구인 경우
				return "0";
			} else if(m.getMemberNick().equals(friend.getSender()) && friend.getAccept().equals("N")) { //요청이 나이고 상대가 아직 수락하지 않았을 때 
				return "1";
			} else if(m.getMemberNick().equals(friend.getReceiver()) && friend.getAccept().equals("N")) { //상대가 요청했고 내가 아직 수락하지 않았을 때
				return "2";
			} else {
				return "10";
			}
		} else { //친구 테이블에 없음
			int result = service.insertFriend(f);
			return "3";
		}
	}

	//친구 요청 수락
	@ResponseBody
	@RequestMapping(value="/user/accFriend.do")
	public String accFriend(Friends f) {
		int result = service.updateFriend(f);		
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	
	//회원가입 insert
	@RequestMapping(value="/joinProcessing.do")
	public String joinProcessing(@RequestParam(value = "hobby") List<String> hobbyArr, MultipartFile propimg[],  HttpServletRequest request, Member m, Model model) {
		//관심 카테고리 분리 처리
		if(hobbyArr.size() == 1) {
			m.setHobby1(hobbyArr.get(0));
		} else if(hobbyArr.size() == 2) {
			m.setHobby1(hobbyArr.get(0));
			m.setHobby2(hobbyArr.get(1));
		} else if(hobbyArr.size() == 3) {
			m.setHobby1(hobbyArr.get(0));
			m.setHobby2(hobbyArr.get(1));
			m.setHobby3(hobbyArr.get(2));
		}
		//파일 처리
		if(propimg[0].isEmpty()) {
			m.setFilename("default.png");
			m.setFilepath("default.png");			
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("resources/image/userPic/");
			for(MultipartFile file : propimg) {
				//파일명 처리
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf(".")); 
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				//폴더 내 같은 파일명이 있는지 확인
				int count = 0;
				while(true) {			
					if(count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				m.setFilename(filename);
				m.setFilepath(filepath);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
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
		//파일처리 종료
		
		int result = service.insertMember(m);
		if(result > 0) {
			model.addAttribute("msg","회원가입 성공");
		} else {
			model.addAttribute("msg","회원가입 실패");
		}
		model.addAttribute("loc","main.jsp");
		return "common/msg";
	}
	
//	@RequestMapping(value="/socialJoin")
//	public String socialJoin(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, InterruptedException, ExecutionException {
//		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
//		OAuth2AccessToken oauthToken = naverLogin.getAccessToken(session, code, state);
//    	return "user/socialJoin";
//	}
	
//	@RequestMapping(value="/callback.do")
//	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session, Model model) throws IOException, InterruptedException, ExecutionException {
//		OAuth2AccessToken oauthToken = naverLogin.getAccessToken(session, code, state);
//		System.out.println(oauthToken);
//		String apiResult = naverLogin.getUserProfile(oauthToken);
//		model.addAttribute("apiResult", apiResult);
//		return "user/callback";
//	}
	
	//소셜로그인 가입페이지
	@RequestMapping(value="/socialJoin.do")
	public String callback(Member m, Model model) {
		model.addAttribute("member", m);
		return "user/socialJoin";
	}
	
	//소셜로그인 시 가입여부 확인
	@ResponseBody
	@RequestMapping(value="/nLogin.do")
	public String nLogin(Member m) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}	

	//임시 비밀번호 메일 보내기
	@ResponseBody
	@RequestMapping(value="/pwMail.do")
	public String pwMail(Member m) {
		try {
			int result = service.pwMail(m);
			if(result > 0) {
				return "1";
			}else {		
				return "0";
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";		
	}	
	
	
	//마이페이지 이동
	@RequestMapping(value="/mypage.do")
	public String myPage(@SessionAttribute(required = false) Member m, Model model) {
		Member member = service.selectOneMember(m);
		FriendsData friendsData = service.selectFriendData(m.getMemberNick());
		DirectMessageData dmData = dmService.selectDmByName(m.getMemberNick());
		ArrayList<Category> category = service.getCategory();
		if(member != null) {
			model.addAttribute("m", member);
			model.addAttribute("category", category);
			model.addAttribute("dmList", dmData.getDmList());
			model.addAttribute("unreadDm", dmData.getUnread());
			model.addAttribute("friends", friendsData.getFList());
			model.addAttribute("pfriends", friendsData.getFpendingList());
			model.addAttribute("rfriends", friendsData.getFReqList());
			model.addAttribute("req", friendsData.getFReq());
			return "user/mypage";
		}else {		
			return "common/noAuth";
		}
	}
	
	//회원정보수정
	@ResponseBody
	@RequestMapping(value="/modInfo.do")
	public String modInfo(@RequestParam(value = "propimg") MultipartFile propimg[], HttpServletRequest request, Member m, Model model) {
		
		System.out.println(m.getEmail());
		System.out.println(m.getFilename());
		System.out.println(m.getMemberPw());
		System.out.println(m.getAddress());
		System.out.println(m.getAge());
		

		System.out.println(m.getHobby1());
		System.out.println(m.getHobby2());
		System.out.println(m.getHobby3());
		
		//파일 처리
		if(propimg[0].isEmpty()) {
			
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("resources/image/userPic/");
			
			//기존 프로필사진 삭제
			if(!m.getFilepath().equals("default.png")) {
				File oldfile = new File(savePath + m.getFilepath());
				if(oldfile.exists()) {
					if(oldfile.delete()) { 
						System.out.println("파일삭제 성공"); 
					} else { 
						System.out.println("파일삭제 실패"); 
					} 
				} else { 
					System.out.println("파일이 존재하지 않습니다.");
				}
			}			
			
			//새 프로필사진 업로드
			for(MultipartFile file : propimg) {
				//파일명 처리
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.indexOf(".")); 
				String extention = filename.substring(filename.indexOf("."));
				String filepath = null;
				//폴더 내 같은 파일명이 있는지 확인
				int count = 0;
				while(true) {			
					if(count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				m.setFilename(filename);
				m.setFilepath(filepath);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
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
		//파일처리 종료
		System.out.println(m.getEmail());
		System.out.println(m.getFilename());
		int result = service.updateMember(m);
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}	
	
	//비밀번호 변경
	@ResponseBody
	@RequestMapping(value="/updatePw.do")
	public String updatePw(Member m, String newPw, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			m.setMemberPw(newPw);
			int result = service.updatePwMember(m);
			if(result > 0) {
				session.invalidate();
				return "1";
			} else {
				return "2";
			}
		} else {
			return "0";
		}		
	}	
	
	//회원 탈퇴
	@RequestMapping(value="/leave.do")
	public String deleteMember(@SessionAttribute(required = false) Member m, Model model) {
		return "user/leavePage";
	}
	
	//전체회원list get
	@RequestMapping(value="/adminMemberList.do")
	public String allMemberList(int page, int sort, String category, String keyword, Model model) {
		System.out.println("page : "+page);
		System.out.println("sort : "+sort);
		System.out.println("category : "+category);
		if(keyword == null) {
			System.out.println("keyword : null");
		}else {
			System.out.println("keyword : "+keyword);			
		}
		model.addAttribute("sort",sort);
		return "admin/adminMemberList";
		/*
		MemberPageData mpd = service.selectAllMember(page, sort);
		model.addAttribute("list",mpd.getList());				//1~50개의 row(db)
		model.addAttribute("cgList",mpd.getCgList());			//catefory list
		model.addAttribute("navigation",mpd.getNavigation());	//페이지 navi
		model.addAttribute("sort",sort);
		return "admin/adminMemberList";
		*/
	}
	//관리자로 등급 업그레이드~
	@RequestMapping(value="/updateGrade.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateGrade(@RequestParam(value="memberNo[]")String[] memberNo ) {
		int result = service.updateGrade(memberNo);
		if(result == memberNo.length) {
//			return "관리자로 등록되었습니다";
			return "1";
		}else {
//			return "적용 실패! 다시 시도해주세요";
			return "0";
		}
	}
	//클릭된 회원 삭제!
	@RequestMapping(value="/deleteMember.do")
	@ResponseBody
	public String deleteMember(String memberNo) {
		int result = service.deleteMember(memberNo);
		if(result >0) {
			return "1";
		}
		return "0";
	}
}
