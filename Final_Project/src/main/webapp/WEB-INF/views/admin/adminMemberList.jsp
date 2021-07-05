<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - UserList</title>
<style>
	.menu>li:nth-child(3)>a{
	    padding-left:25px;
	    border-left:5px solid var(--mainTextColor);
	    border-right:5px solid var(--mainTextColor);
	    background:linear-gradient(to bottom, rgba(1, 225, 255, 0.5),rgba(33, 229, 255, 0.3),rgba(95, 235, 248, 0.1));
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- header-nav -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		<input type="hidden" name="sender" value="${sessionScope.m.memberNick }">
		<!-- content -->
		<section>
			<div class="content-wrap">
                <!-- 목록 div -->
               	<div class="title-wrap box-option">
               		<h2>회원 목록</h2>
               	</div>
                <div class="list-wrap box-option">
               	   <form action="/adminMemberList.do" id="ssForm">
           	           <input type="hidden" name="page" value="1">
	                	<!-- 검색 div -->
		               <div class="searchBar-wrap">
		                   <select class="" name="category" id="keywords">
		                       <option value="default" selected>분류</option>
		                       <option value="email">이메일</option>
		                       <option value="name">닉네임</option>
		                       <option value="hobby">취미</option>
		                   </select>
		                   <input type="search" class="searchBar" name="keyword">
		                   <button class="btns" id="searchBtn"><img src="/resources/image/icons/search_black.png"></button>
		               </div>
	                   	<div class="list-header">
	                        <div class="option-wrap">
	                            <!-- ajax>배열[]사용>controller 에서 String[] 을 매개변수로 받아서 사용 -->
	                            <button class="btns" id="selectMessageBtn">선택 쪽지발송</button>
	                            <button class="btns" id="selectMailBtn">선택 메일발송</button>
	                            <c:if test="${sessionScope.m.grade eq 0 }">
	                            <button class="btns" id="upgradeBtn">관리자 등록</button>
	                            </c:if>
	                            <select name="sort" id="sort">
	                                <c:choose>
	                                	<c:when test="${sort eq 1 }">
	                                		<option value="1" selected>최근 가입순</option>
			                                <option value="2">이전 가입순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4">최종접속일</option>
	                                	</c:when>
	                                	<c:when test="${sort eq 2 }">
	                                		<option value="1">최근 가입순</option>
			                                <option value="2" selected>이전 가입순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4">최종접속일</option>
	                                	</c:when>
	                                	<c:when test="${sort eq 3 }">
	                                		<option value="1">최근 가입순</option>
			                                <option value="2">이전 가입순</option>
			                                <option value="3" selected>경고(제재)</option>
			                                <option value="4">최종접속일</option>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<option value="1">최근 가입순</option>
			                                <option value="2">이전 가입순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4" selected>최종접속일</option>
	                                	</c:otherwise>
	                                </c:choose>
	                            </select>                            
	                        </div>
	                    </div>
                    </form>
                    <div class="list-table">
                        <table class="list memberList">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="allCheck"></th><th>no</th><th>이메일</th><th>닉네임</th><th>취미1</th><th>취미2</th><th>취미3</th><th>등급</th><th>경고/제재</th><th>가입일</th><th>최종 접속일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="m" varStatus="i">
                            	<c:if test="${m.grade eq 2 && m.grade != 3}">
	                                <tr>
	                                    <td><input type="checkbox" class="checks" name="memberNo" value="${m.memberNo }"></td><td>${m.sort }</td><td>${m.email }</td><td>${m.memberNick }</td><td>${m.hobby1 }</td><td>${m.hobby2 }</td><td>${m.hobby3 }</td>
	                                    <td>
                                    	<c:choose>
                                    		<c:when test="${m.grade == 0 }">쵝오 관리자</c:when>
                                    		<c:when test="${m.grade == 1 }">관리자</c:when>
                                    		<c:otherwise>회원</c:otherwise>
                                    	</c:choose>
	                                    </td>
	                                    <td>${m.warningCount }</td><td>${m.enrollDate }</td><td>${m.lastDate }</td>
	                                    <td><button class="btns warningBtn">경고</button><button class="btns restBtn">제재</button>
	                                    	<c:if test="${sessionScope.m.grade eq 0 }">
	                                    		<button class="btns deleteBtn">삭제</button>
	                                    	</c:if>
	                                    </td>
	                                </tr>                            		
                            	</c:if>
                            	</c:forEach>
                                
                            </tbody>
                            <tfoot>
                            	<tr>
                            	<th colspan="12" style="height:30px;">${navigation }</th>
                            	</tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="list-footer">

                    </div>
                </div>
            </div>
            <!-- 모달영역 -->
            <div class="modal">
                <div class="modal-box">
					<form id="modalForm" class="frms" action="">
                    <h2 class="titleHead"></h2>
                    <select name="restCg" id="cgNo">
                    <c:forEach items="${cgList }" var="cg">
                    	<c:if test="${cg.cgKinds eq 110 }">
                    	<option value="${cg.cgNo }">${cg.cgName }</option>
                    	</c:if>
                    </c:forEach>
                    </select>
                    <textarea name="" id="summernote" class="summernote" cols="20" rows="10" style="resize:none;"></textarea>
                    <div class="btn-box">
	                   	<input type="hidden" name="sender" value="${sessionScope.m.memberNick }"><!-- 쪽지 보낸 이 : 로그인 된 관리자 닉네임 -->
	                   	<input type="hidden" name="receiver"><!-- 쪽지 받는이 : 선택된 회원 nick  js로 넣어줄 것 -->    
	                   	<input type="hidden" name="restEmail"><!-- 이용제한 대상자 : 선택된 회원 이메일 js로 넣어준다. -->
	                   	<input type="hidden" name="type"><!-- 전체 쪽지 발송 : 1  /  개인 경고/제재 : 2 -->
	                   	<div class="btns-box">
	                        <button type="button" class="btns enterBtn">확인</button>
	                   	</div>                	
                    </div>
                   	</form>
                    <button id="closeBtn" class="btns cancelBtn">X</button>
                </div>
            </div>
		</section>
	</div>
</body>
</html>