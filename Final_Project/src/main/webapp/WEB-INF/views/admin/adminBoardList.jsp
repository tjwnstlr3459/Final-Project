<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - InquiryList</title>
<style>
	.menu>li:nth-child(2)>a{
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
					<h2>문의/신고</h2>
				</div>
				<div class="list-wrap box-option">
					<div class="list-header">
						<div class="option-wrap">
							<button class="btns" id="deleteInquiryBtn">선택 삭제</button>
							<select name="sort" id="sort">
								<option value="date" selected>최신순</option>
								<option value="answer" >답변 미완료</option>
								<option value="inquiry" >문의</option>
								<option value="report" >신고</option>							
							</select>
						</div>
					</div>
					<div class="list-table">
						<table class="list inquiryList">
							<thead>
                                <tr>
                                    <th><input type="checkbox" id="allCheck"></th><th>카테고리</th><th>문의자</th><th>제목</th><th>작성일</th><th>답변</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="bl">
                            	<tr>
                            		<td><input type="checkbox" class="checkInquiry"></td><td>${bl.abCg }</td><td>${bl.abWriter }</td><td><a href="javascript:void(0)">${bl.abTitle }</a></td><td>${bl.enrollDate }</td><td>답변 완료</td>
                            	</tr>
                            	</c:forEach>
                            </tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>