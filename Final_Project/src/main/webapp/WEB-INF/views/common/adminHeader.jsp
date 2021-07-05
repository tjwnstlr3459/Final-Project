<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 라이브러리/스크립트/css 링크 영역 -->
	<!-- 관리자-헤더 css -->
	<link rel="stylesheet" href="/resources/css/admin/adminHeader.css" type="text/css">
	<!-- BILBO-font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bilbo&display=swap" rel="stylesheet">
	<!-- Cantarell-font -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bilbo&family=Cantarell:ital@1&display=swap" rel="stylesheet">
	<!-- jquery 라이브러리 -->
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.js"></script>
	<!-- summernote 라이브러리 -->
	<script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
	<link rel="stylesheet" href="/resources/css/admin/adminChart.css">
	
	<!-- 관리자 js -->
	<script src="/resources/js/admin/summernote-admin.js"></script>
	<!-- 관리자 관련 js -->
	<script src="/resources/js/admin/adminDefault.js"></script>	
	<!-- 현재 접속자 파싱 웹소켓 -->
	<script src="/resources/js/admin/adminWebSocket.js"></script>
<!-- header 영역 -->
    <!-- 왼쪽 관리자,메뉴 영역 -->
    <nav>
        <header>
            <span class="logo"></span>
        </header>
        <div class="divLine"></div>
        <div class="adminInfoWrap">
            <div class="adminImg"><img src="/resources/image/userPic/${sessionScope.m.filepath }" alt=""></div><!--관리자 프로필 이미지-->
            <div class="adminInfo">
                <span>${sessionScope.m.memberNick }</span><br><!--관리자 닉네임-->
                <span>${sessionScope.m.email }</span><!--관리자 이메일-->
            </div>
        </div>
        <div class="divLine"></div>
        <div class="menuWrap">
            <ul class="menu">
                <li><a href="/adminMain.do"><img src="/resources/image/icons/analytics_white.png" alt=""><span>차트 / 통계</span></a></li>
                <li><a href="/adminBoardList.do?reqPage=1&type=2"><img src="/resources/image/icons/supportAgent_white.png" alt=""><span>문의 / 신고</span></a></li>
                <li><a href="/adminMemberList.do?page=1&sort=1&category=default&keyword=" id="mlClick"><img src="/resources/image/icons/person_white.png" alt=""><span>회원 목록</span></a></li>
                <li><a href="/adminClubList.do?page=1"><img src="/resources/image/icons/groups_white.png" alt=""><span>클럽 목록</span></a></li>
                <li><a href="/adminRestrictionList.do?page=1"><img src="/resources/image/icons/gavel_white.png" alt=""><span>제재 목록</span></a></li>
                <div class="divLine"></div>
                <!--  
                <li><a href="javascript:void(0)" class="btns" id="adminJoinBtn"><img src="/resources/image/icons/note_white.png" alt=""><span>관리자 등록</span></a></li>
                -->
            </ul>
        </div>
    </nav>
    
    