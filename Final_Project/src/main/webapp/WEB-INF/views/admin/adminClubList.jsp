<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NINADRI - ClubList</title>
<style>
	.menu>li:nth-child(4)>a{
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
		<!-- content -->
		<section>
			<div class="content-wrap">
				<div class="title-wrap box-option">
					<h2>클럽 목록</h2>
				</div>
                <!-- 목록 div -->
                <div class="list-wrap box-option">
                	<form action="/adminClubList.do" id="ssForm">
	                	<input type="hidden" name="page" value="1">
		                <!-- 검색 div -->
		                <div class="searchBar-wrap">
		                    <select class="" name="category" id="keyword">
		                        <option value="default" selected>분류</option>
		                        <option value="name">클럽명</option>
		                        <option value="hobby">개설 취미</option>
		                    </select>
		                    <input type="search" class="searchBar" name="keyword">
		                    <button class="btns" id="searchBtn"><img src="/resources/image/icons/search_black.png"></button>
		                </div>
	                    <div class="list-header">
	                        <div class="option-wrap">
	                            <!-- ajax>배열[]사용>controller 에서 String[] 을 매개변수로 받아서 사용 -->
	                            <!--  
	                            <button class="btns" id="selectMessageBtn">선택 쪽지발송</button>
	                            <button class="btns" id="selectMailBtn">선택 메일발송</button>
	                            -->
	                            <select name="sort" id="sort">
	                                <c:choose>
	                                	<c:when test="${sort eq 1 }">
	                                		<option value="1" selected>최근 개설순</option>
			                                <option value="2">이전 개설순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4">최종활동일</option>
	                                	</c:when>
	                                	<c:when test="${sort eq 2 }">
	                                		<option value="1">최근 개설순</option>
			                                <option value="2" selected>이전 개설순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4">최종활동일</option>
	                                	</c:when>
	                                	<c:when test="${sort eq 3 }">
	                                		<option value="1">최근 개설순</option>
			                                <option value="2">이전 개설순</option>
			                                <option value="3" selected>경고(제재)</option>
			                                <option value="4">최종활동일</option>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<option value="1">최근 개설순</option>
			                                <option value="2">이전 개설순</option>
			                                <option value="3">경고(제재)</option>
			                                <option value="4" selected>최종활동일</option>
	                                	</c:otherwise>
	                                </c:choose>
	                            </select> 
	                        </div>
	                    </div>
                    </form>
                    <div class="list-table">
                        <table class="list userList">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="allCheck"></th><th>번호</th><th>카테고리</th><th>클럽명</th><th>개설자</th><th>제재</th><th>개설일</th><th>최종활동일</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="c">
	                                <tr>
	                                    <td><input type="checkbox" class="checkClub"></td><td>${c.sort }</td><td>${c.cgName }</td><td>${c.clubName }</td><td>${c.clubOpener }</td><td>${c.warningCount }</td><td>${c.enrollDate }</td><td>${c.lastDate }</td>
	                                    <td>
	                                    	<button>경고</button>
	                                    	<c:if test="${sessionScope.m.grade eq 0 }">
	                                    	<button>삭제</button>
	                                    	</c:if>
	                                    </td>
	                                </tr>                            		
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
		</section>
	</div>
</body>
</html>