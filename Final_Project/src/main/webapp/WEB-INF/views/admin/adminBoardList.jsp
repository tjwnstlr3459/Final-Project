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
	#summernote{
		width:100%;
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
                                    <th>카테고리</th><th>문의자</th><th>제목</th><th>작성일</th><th>답변</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="bl">
                            	<tr>
                            		<td>${bl.cgName }</td><td>${bl.abWriter }</td><td><a class='btns selectOneBtn' onclick="selectOneBoard(${bl.abNo},'${bl.cgName }');" href="javascript:void(0)">${bl.abTitle }</a></td><td>${bl.enrollDate }</td>
                            		<c:choose>
                            			<c:when test="${bl.status.equals('N') }">
		                            		<td>접수 중</td>
                            			</c:when>
                            			<c:otherwise>
		                            		<td>답변 완료</td>
                            			</c:otherwise>
                            		</c:choose>
                            	</tr>
                            	</c:forEach>
                            </tbody>
                            <tfoot>
                            	<tr>
                            		<th colspan="6">${navigation }</th>
                            	</tr>
                            </tfoot>
						</table>
					</div>
				</div>
			</div>
			<!-- 모달 -->
			<div class="modal">
				<div class="modal-box">
					<h2 class="titleHead">테스트</h2>
					<table class="modal-table">
						<thead>
							<tr>
								<th>제 목</th><td colspan="3" class="abTitle"></td>
							</tr>
							<tr>
								<th>작성자</th><td class="abWriter"></td><th>작성일</th><td class="enrollDate"></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>내 용</th><td colspan="3"><span class="abContent"></span></td>
							</tr>
						</tbody>
					</table>
					<button id="closeBtn" class="btns cancelBtn">X</button>
					<div class="btn-box"><button class="btns slideAnswerBtn">답변하기</button></div>
					<div class="answer-box">
						<form action="/insertAnswer.do" id="answerForm">
							<input type="hidden" name="abNo"><!-- 문의/답변 게시물 번호 -->
							<input type="hidden" name="anWriter" value="${sessionScope.m.memberNick }"><!-- 작성자(관리자) -->
							<textarea class="summernote" id="summernote" name="anContent"></textarea>
							<button type="button" class="btns answerBtn">확인</button>
						</form>
					</div>
				</div>
			</div>
			<script>
				$('#summernote').summernote({
				 	   width: 911,
				 	   minWidth:911,
				 	   maxWidth:911,
				 	   height:600
				})
			</script>
		</section>
	</div>
</body>
</html>