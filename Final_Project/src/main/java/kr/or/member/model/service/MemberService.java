package kr.or.member.model.service;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.category.model.dao.CategoryDao;
import kr.or.category.model.vo.Category;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Friends;
import kr.or.member.model.vo.FriendsData;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.restriction.model.vo.Restriction;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member m) {
		Member member = dao.selectOneMember(m);
		return member;
	}

	public Member selectOneMember(String user) {
		Member member = dao.selectOneMember(user);
		return member;
	}

	@Transactional
	public int insertMember(Member m) {
		int result = dao.insertMember(m);
		return result;
	}

	public MemberPageData selectAllMember(int page) {
		int listLength = 50; // 목록(화면)에 보여줄 게시글 갯 수
		int naviPages = 5;
		int end = listLength * page; // list 끝 값
		int start = end - listLength + 1; // list 시작 값

		HashMap<String, Integer> se = new HashMap<String, Integer>();
		se.put("start", start);
		se.put("end", end);

		List list = dao.selectAllMember(se); // 전체 회원을 가지고온다.
		int memberCount = dao.memberCount(); // 전체 게시글 갯 수
		// 페이지 네비게이션 만들기 전 페이지 설정
		int totalNaviPage = memberCount % listLength == 0 ? memberCount / listLength : memberCount / listLength + 1; // %
																														// ==
																														// 0인경우
																														// 다음페이지
																														// 네비게이션을
																														// 만들지
																														// 않기
																														// 위함
		int navi = ((page - 1) / naviPages) * naviPages + 1; // 페이지 네비게이션의 시작 값 > 1~5 : 1 / 6 ~ 10 : 6
		String navigation = "<div class='naviPage-wrap'>";
		// 이전버튼 생성 여부
		if (navi != 1) {
			navigation += "<a href='/adminMemberList.do?page=" + (navi - 1) + "'>이전</a>";
		}
		// 1~5단위 페이지 생성
		for (int i = 0; i < naviPages; i++) {
			// 사용자가 클릭해서 보고있는 페이지인 경우 효과
			if (navi == page) {
				navigation += "<a href='/adminMemberList.do?page=" + navi + "' class='naviFocus' id='naviFocus'>" + navi + "</a>";
			} else {
				navigation += "<a href='/adminMemberList.do?page=" + navi + "'>" + navi + "</a>";
			}
			// 시작된 페이지 네비게이션 navi 증가 > 1,2,3,4,5 / 6,7,8,9,10 / .....
			navi++;
			if (navi > totalNaviPage) {
				break;
			}
		}
		// 다음버튼 생성 여부
		if (navi <= totalNaviPage) {
			navigation += "<a href='/adminMemberList.do?page=" + navi + "'>다음</a>";
		}
		navigation += "</div>";

		List cgList = dao.selectAllCategory();
		MemberPageData mpd = new MemberPageData();
		mpd.setNavigation(navigation);
		mpd.setList((ArrayList<Member>) list);
		mpd.setCgList((ArrayList<Category>) cgList);
		return mpd;
	}

	// 회원 관리자로 등록 update
	@Transactional
	public int updateGrade(String[] memberNo) {
		return dao.updateGrade(memberNo);
	}

	// 카테고리 가져오기(회원가입용)
	public ArrayList<Category> getCategory() {
		List cgList = dao.selectCategory();
		return (ArrayList<Category>) cgList;
	}

	//최종접속일시 업데이트
	@Transactional
	public int changeLastDate(Member m) {
		return dao.updateLastDate(m);
	}
	
	//회원 탈퇴
	@Transactional
	public int deleteMember(String memberNo) {
		return dao.deleteMemer(memberNo);
	}

	// 친구 조회
	public Friends selectFriend(Friends f) {
		return dao.selectFriend(f);
	}

	// 친구 추가
	@Transactional
	public int insertFriend(Friends f) {
		return dao.insertFriend(f);
	}

	// 친구요청 수락
	@Transactional
	public int updateFriend(Friends f) {
		return dao.updateFriend(f);
	}

	// 친구 리스트
	public FriendsData selectFriendData(String memberNick) {
		FriendsData fData = new FriendsData();
		List fList = dao.selectFriend(memberNick);
		fData.setFList((ArrayList<Member>) fList);
		List fPendingList = dao.selectFriendPending(memberNick);
		fData.setFpendingList((ArrayList<Member>) fPendingList);
		List fReqList = dao.selectFriendRequest(memberNick);
		fData.setFReqList((ArrayList<Member>) fReqList);
		fData.setFReq(dao.friendRequestCount(memberNick));
		System.out.println(fData.getFReq());
		return fData;
	}

	// 이메일발송 메소드
	public void sendEmail(Member m, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "palcimer@gmail.com";
		String hostSMTPpwd = "akqlshrl";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "admin@nunadri.com";
		String fromName = "너나들이";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "너나들이 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += m.getMemberNick() + "님의 임시 비밀번호 입니다.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += m.getMemberPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = m.getEmail();
		try {
			System.setProperty("https.protocols", "TLSv1.2");
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(false);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			// email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 이메일
	public String mailTest(String mail, String pw) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "palcimer@gmail.com"; // 본인의 아이디 입력
		String hostSMTPpwd = "akqlshrl"; // 비밀번호 입력

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "admin@nunadri.com"; // 보내는 사람 eamil
		String fromName = "너나들이"; // 보내는 사람 이름
		String subject = "너나들이 임시 비밀번호입니다"; // 제목
		String content = "<div align='center' style='border:1px solid black; font-family:verdana'>";
		content += "<h3 style='color: blue;'>";
		content += mail + "님의 임시 비밀번호 입니다.</h3>";
		content += "<p>임시 비밀번호 : ";
		content += pw + "</p></div>";
		
		// 받는 사람 E-Mail 주소

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // SMTP 포트 번호 입력

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(content); // 본문 내용
			email.send();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/";
	}

	// 비밀번호찾기
	@Transactional
	public int pwMail(Member m) throws Exception {
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		System.out.println(pw);
		m.setMemberPw(pw); // 랜덤 문자를 멤버 객체의 비밀번호로 설정
		int result = dao.updatePw(m); // 비밀번호 변경
		if (result > 0) {
			//sendEmail(m, "findpw"); //메일 발송
			mailTest(m.getEmail(), pw);
		} else {
			System.out.println("에러");
		}
		return result;
	}
	
	//회원정보 수정
	@Transactional
	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	//로그인 시 제재내역 조회
	public Restriction selectOneRestriction(String email) {
		return dao.selectOneRestriction(email);
	}

	//비밀번호 변경
	@Transactional
	public int updatePwMember(Member m) {
		return dao.updatePw(m);
	}
	
	//회원 탈퇴
	@Transactional
	public int deleteMember(Member m) {
		int deleteResult = dao.deleteMemer(m);
		int insertResult = dao.insertDestroy();
		if(deleteResult > 0 && insertResult > 0) {
			return 1;
		} else {
			return 0;
		}
	}

}
