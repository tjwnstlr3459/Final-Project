<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/resources/css/board/boardOne.css">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<body>
	<div class="modalback">
		<!-- 헤더 -->
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div>
			<div class="wrap">
				<div class="topContent" style="margin-left: 70px;">
					<div>
						<div>
							<h1 style="text-align: center">함께이기에</h1>
						</div>
						<div class="topConMent">
							<pre class="nunaMent"
								style="background-color: transparent; padding: 0px">
보다 좋은 활동을 추구하기에,
회원님들과의 만남에 좋은영향을 줄수있도록
매번 노력에 임하겠습니다.
저희 Nunadri를 아껴주시는 회원님들의
의견을 적극적으로 수용하겠습니다.
저희 Nunadri를 아껴주시는 회원님들의
의견을 적극적으로 수용하겠습니다.
                			</pre>
							<!-- <input class="checkBtn" type="button" value="문의 / 신고" /> -->
						</div>
					</div>				
					<div class="topConImg">
						<img src="/resources/image/icons/happy3.jpg" />
					</div>

				</div>
				<!--topContent-->
				<div class="bottomContent">
					<div class="bottomMent">
						<h2 style="font-size: 30px; font-weight: 500;">공지사항</h2>
					</div>
					<div class="sendFile">
						<div class="sendFile" ><a href="/modify.do?abNo=${board.abNo }">수정</a></div>
						<div class="sendFile"><a href="/delete.do?abNo=${board.abNo}">삭제</a></div>
					</div>
					<div class="bottomContentFont">
						<!--공지 상세보기-->
						<div class="boardInfo">
							<div class="infoLine">
								<div>제목</div>
								<div style="width: 65%">${board.abTitle }</div>
								<div>날짜</div>
								<div style="width: 14%; border: 0">${board.enrollDate }</div>
							</div>
							<div class="infoLine">
								<div>작성자</div>
								<div class="writer" style="width: 27%">${board.abWriter }</div>
								<div>이메일</div>
								<div class="email" style="width: 27.7%">${board.abWriter }</div>
								<div>조회수</div>
								<div>${board.abWriter }</div>
							</div>
							<div class="infoLine">
								<div>첨부파일</div>
								<div style="border: 0px">
									<a class="btn"
										href="/resources/fileupload/board/${board.fileName }"
										download>${board.fileName }</a>
								</div>
							</div>
						</div>

						<div class="content">
							<h3 style="text-align: center">${board.abContent }</h3>
							<c:if test="${board.filePath != null }">
								<div style="display: flex; justify-content: center;">
									<img src="/resources/fileupload/board/${board.filePath }"
										style="width: 50%; height: 50%;">
								</div>
							</c:if>
						</div>
						<!--게시물 컨텐츠-->

						<!-- 댓글출력 -->
						<c:forEach items="${answer}" var="c">
							<div class="coment"
								style="border-bottom: 1px solid #cac8c8; height: 50px">
								<!--댓글-->
								<div class="comentLine" style="width: 10%;">
									<img class="userImg" src="/resources/image/userPic/${c.pic}"
										style="width: 40px; height: 40px;" />
								</div>

								<div class="nameTime" style="width: 10%;">
									<div>${c.anWriter }</div>
									<div>${c.enrollDate }</div>
								</div>

								<div class="mentWriteBox" style="width: 80%;">
									<div class="mentWrite" style="">${c.anContent }</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- 댓글작성창 -->
					<c:if test="${not empty sessionScope.m }">
						<form action="/insertComent.do" method="post">
							<div class="coment">
								<!--댓글-->
								<input type="text" name="abNo" value="${abNo}"
									style="display: none">
								<div class="comentLine" style="width: 10%;">
									<img class="userImg"
										src="/resources/image/userPic/${m.filepath }"
										style="margin-top: 13px" />
								</div>
								<div class="nameTime" style="width: 10%;">
									<div style="line-height: 50px">
										${m.memberNick} <input type="text" name="anWriter"
											value="${m.memberNick}" style="display: none">
									</div>
									<div>
										${m.lastDate } <input type="text" name="enrrolDate"
											value="${m.lastDate }" style="display: none">
									</div>
								</div>

								<div class="mentWriteBox" style="width: 70%;">
									<input name="anContent" class="mentWrite" type="text" value="" />
								</div>

								<div style="width: 10%; background-color: #edeef4;">
									<input class="momentBtn" type="submit" value="확인">
								</div>
							</div>
						</form>
					</c:if>

					<div>
						<input class="boardListBtn" type="button"
							onclick="window.history.back();" value="목록으로" />
					</div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
		<!--bottomContent-->
		<!--wrap-->
		<!-- 푸터 -->


		<!-- 모달 -->
		<div class="boardModalPan" style="display: none;">
			<div class="boardModal">
				<div class="closeModal"><img src="/resources/image/icons/x.png" style="width: 40px;padding-left: 10px;"></div>
				<div class="modalLogo" style="margin-top: 10px;">
					<img src="/resources/image/icons/man3.png">
				</div>

				<div class="adminMent">
						저희 Nunadri는 회원님들의 의견에<br>귀를 기울이겠습니다.
				</div>
				<hr style="border: 1px solid gray; width: 90%; margin-bottom: 5px; margin-top: 5px;">
				<form action="/boardInsert.do" method="post" enctype="multipart/form-data">
				<div class="selectMun">
					<select class="selectDiv" name="abCg">
						<option value="2">문의</option>
						<option value="3">신고</option>
					</select>
				</div>
				<div class="fileDay" style="margin-bottom:10px;padding-left: 10px;"><input type="text" name="abTitle" placeholder="제목"></div>
				
				<div class="fileDay">
					<div>
						<input type="file" name="files1" value="파일첨부">
					</div>
					<div>작성일 : ${sessionScope.m.lastDate }</div>
				</div>
				<input type="text" name="abWriter" value="${sessionScope.m.memberNick }" style="display: none">
				<textarea class="textA" name="abContent" placeholder="회원님의 소중한 의견을 적어주세요"></textarea>
				<div style="text-align: center">
				<input class="checkBtn"
					style="margin-top: 15px; margin-left: 0px; text-align: center;"
					type="submit" value="Submit"></div>
				</form>
			</div>
		</div>
	</div>
</body>
<script>
	$(".checkBtn").click(function() {
		$(".boardModalPan").css("display", "block");

		$(".boardModalPan").css("display", "flex");
	});

	$(".closeModal").click(function() {
		$(".boardModalPan").css("display", "none");
	});
</script>
<style>
.sendFile>div{
	background-color: rgb(53 176 241 / 84%);
    border-radius: 5px;
    width: 80px;
    color: white;
    height: 35px;
    border: 0px;
}
.sendFile:hover{
cursor: pointer;
}
.sencFile a{
color : white;
text-decoration: none;
}
</style>
</html>











