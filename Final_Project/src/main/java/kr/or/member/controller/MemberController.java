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
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.category.model.vo.Category;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.member.model.vo.NaverLogin;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	private NaverLogin naverLogin;
	@Autowired
	private void setNaverLoginBO(NaverLogin naverLogin){
		this.naverLogin = naverLogin;
	}
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="/login.do")
		public String login(Member m, HttpSession session, Model model) {		
			Member member = service.selectOneMember(m);
			if(member != null) {
				session.setAttribute("m", member);
				System.out.println(member.getMemberNick()+"환영한다능");
				model.addAttribute("msg","로그인성공!");		
			}else {
				model.addAttribute("msg","아이디/비밀번호를 확인하세요");		
			}
			model.addAttribute("loc","main.jsp");
			return "common/msg";			
		}
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/join.do")
	public String join(HttpSession session, Model model) {		
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
        String naverAuthUrl = naverLogin.getAuthorizationUrl(session);
        
        /* 생성한 인증 URL을 View로 전달 */
        model.addAttribute("nUrl",naverAuthUrl);
		return "user/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/user/chkEmail.do")
	public String chkEmail(Member m, Model model) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/user/chkName.do")
	public String chkName(Member m, Model model) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}
	
	@RequestMapping(value="/joinProcessing.do")
	public String joinProcessing(@RequestParam(value = "hobby") List<String> hobbyArr, @RequestParam(value = "propimg") MultipartFile propimg,  HttpServletRequest request, Member m, Model model) {
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
		
		if(m.getFilename() != null) {
			//파일 처리 시작
			String savePath = request.getSession().getServletContext().getRealPath("resources/image/userPic/");
			//파일명 처리
			String filename = propimg.getOriginalFilename();
			String onlyFilename = filename.substring(0, filename.indexOf("."));
			String extention = filename.substring(filename.indexOf("."));
			String filepath = null;
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
			//파일 저장
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = propimg.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//파일 처리 종료
			
			m.setFilename(filename);
			m.setFilepath(filepath);
		} else {
			m.setFilename("default.png");
			m.setFilepath("default.png");
		}

		
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
	
	@RequestMapping(value="/socialJoin.do")
	public String callback(Member m, Model model) {
		model.addAttribute("member", m);
		return "user/socialJoin";
	}
	
	@ResponseBody
	@RequestMapping(value="/nLogin.do")
	public String nLogin(Member m, Model model) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			return "1";
		}else {		
			return "0";
		}
	}	
	
	//전체회원list get
	@RequestMapping(value="/adminMemberList.do")
	public String allMemberList(int page, Model model) {
		MemberPageData mpd = service.selectAllMember(page);
		for(Category cg : mpd.getCgList()) {
			System.out.println(cg.getCgName());
		}
		model.addAttribute("list",mpd.getList());
		model.addAttribute("cgList",mpd.getCgList());
		model.addAttribute("navigation",mpd.getNavigation());
		return "admin/adminMemberList";
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
}
