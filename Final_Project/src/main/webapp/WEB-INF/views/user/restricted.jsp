<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/member/rest.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h2>사이트 이용 제한</h2> 
		<div class="message">
			<p><span class="name">${name }</span><span class="email">(${email })</span>님은 운영정책 위반으로 너나들이 서비스 이용이 제한되었습니다.</p>
			<p>자세한 내용은 관리자 이메일(admin@nunadri.com)로 문의바랍니다.</p>
		</div>
		<div class="rest-table">
			<div class="">
				<div class="title">제재 종류</div>
				<div class="content">${rest.cgName }</div>
			</div>
			<div class="">
				<div class="title">제재 사유</div>
				<div class="content">${rest.restContent }</div>
			</div>
			<div class="">
				<div class="title">제재 기간</div>
				<div class="content">${rest.startDate } ~ ${rest.endDate }</div>
			</div>
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>