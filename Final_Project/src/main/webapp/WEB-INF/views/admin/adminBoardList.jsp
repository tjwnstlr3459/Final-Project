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
							<form action="/adminBoardList.do" id="ssForm">
								<input type="hidden" name="reqPage" value="1">
								<input type="hidden" name="type" value="2">
								<select name="sort" id="sort">
								<c:choose>
									<c:when test="${sort eq 1 }">
										<option value="1" selected>최신순</option>
										<option value="2">답변 미완료</option>
										<option value="3">문의</option>
										<option value="4">신고</option>
									</c:when>
									<c:when test="${sort eq 2 }">
										<option value="1">최신순</option>
										<option value="2" selected>답변 미완료</option>
										<option value="3">문의</option>
										<option value="4">신고</option>									
									</c:when>
									<c:when test="${sort eq 3 }">
										<option value="1">최신순</option>
										<option value="2">답변 미완료</option>
										<option value="3" selected>문의</option>
										<option value="4">신고</option>									
									</c:when>
									<c:otherwise>
										<option value="1">최신순</option>
										<option value="2">답변 미완료</option>
										<option value="3">문의</option>
										<option value="4" selected>신고</option>									
									</c:otherwise>
								</c:choose>		
								</select>
							</form>
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
					<div class="btn-box"></div>
					<div class="answer-box">
						<form action="/insertAnswer.do" id="answerForm">
							<input type="hidden" name="abNo"><!-- 문의/답변 게시물 번호 -->
							<input type="hidden" name="anWriter" value="${sessionScope.m.memberNick }"><!-- 작성자(관리자) -->
							<textarea class="summernote" id="summernote" name="anContent"></textarea>
							<button type="button" class="btns answerBtn">확인</button>
						</form>
					</div>
					<div class="answer-wrap">
						<h2 class="title-head">답변</h2>
						<table class="modal-table answer-table">
						<tbody>
							<tr>
								<th>답변 내용</th>
								<td colspan="3">
									<span class="answerContent"></span>
									<div class="modifyAnswer-box">
										<textarea class="summernote" id="anSummernote" name="anContent"></textarea>
									</div>
								</td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="2">
									<button class="btns modifyBtn">수정하기</button>
									<button class="btns comBtn">수정완료</button>
									<button class="btns canBtn">수정취소</button>
								</th>
							</tr>
						</tfoot>
						</table>
					</div>
				</div>
			</div>
			<script>
				$('.summernote').summernote({
				 	   width: 800,
				 	   minWidth:800,
				 	   maxWidth:800,
				 	   height:400
				});
			</script>
		</section>
	</div>
</body>
</html>