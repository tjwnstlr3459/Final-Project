<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - RestrictionList</title>
<style>
	.menu>li:nth-child(5)>a{
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
					<h2>이용제한 목록</h2>
				</div>
				<div class="list-wrap box-option">
					<div class="list-table">
						<table class="list restrictionList">
							<thead>
								<tr>
									<th>번호</th><th>이메일</th><th>분류</th><th>사유</th><th>시작일</th><th>종료일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var="rest">
								<tr>
									<td>${rest.restNo }</td><td>${rest.restEmail }</td><td>${rest.cgName }</td><td><span id="ofHidden">${rest.restContent }</span></td><td>${rest.startDate }</td><td>${rest.endDate }</td><td><button>해제</button></td>
								</tr>
								</c:forEach>
							</tbody>
							<tfoot>
							<tr>
								<th colspan="7">${navigation }</th>
							</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>