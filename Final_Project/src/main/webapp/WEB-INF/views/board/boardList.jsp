<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<!-- 테이블css -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 페이지네비css -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="/resources/css/board/boardList.css">
</head>

<body>
	<div class="modalback">
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<!-- 헤더 -->
		<div>
			<div class="wrap">
				<div class="topContent">
					<div class="topConImg">
						<img src="/resources/image/icons/happy.jpg" />
					</div>
					<div>
						<div>
							<h1 style="text-align: center">저희 Nunadri는</h1>
						</div>
						<div class="topConMent">
							<pre class="nunaMent"
								style="background-color: transparent; padding: 0px">
보다 좋은 활동을 추구하기에,
회원님들과의 만남에 좋은영향을 줄수있도록
매번 노력에 임하겠습니다.
저희 Nunadri를 아껴주시는 회원님들의
의견을 적극적으로 수용하겠습니다.
                </pre>
							<input class="checkBtn" type="button" value="문의 / 신고" />
						</div>
					</div>
				</div>
				<!--topContent-->
				<div class="bottomContent">
					<div class="bottomMent">
						<h2 style="width: 200px; margin-left: 50px;">공지사항</h2>
					</div>

					<div class="bottomList">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr class="listBar">
										<th>No.</th>
										<th>공지제목</th>
										<th>작성자</th>
										<th style="text-align: center">날짜</th>
										<th style="text-align: center">조회수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${boardList }" var="l" varStatus="i">
										<tr>
											<td>${l.abNo }</td>
											<td><a href="/boardOne.do?abNo=${l.abNo}">${l.abTitle }</a></td>
											<td>${l.abWriter }</td>
											<td style="text-align: center">${l.enrollDate }</td>
											<td style="text-align: center">${i.count }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div id="pagination" style="margin-left: 350px; float: left;">${pageNavi }</div>
						<c:if test="${sessionScope.m.grade lt 2 }">
							<div class="adminWriteBtn" style="float: right">
								<a href="/boardOneInsert.do">글쓰기</a>
							</div>
						</c:if>
						<!-- <ul class="pagination">
		    <li><a href="#">«</a></li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li class="disabled"><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li class="active"><a href="#">6</a></li>
		    <li><a href="#">»</a></li>
		  </ul> -->
					</div>
					<!--bottomList end-->
				</div>
			</div>
			<!--bottomContent-->




		</div>
		<!--wrap-->
		<!-- 푸터 -->
		<%@include file="/WEB-INF/views/common/footer.jsp"%>
		<!-- 모달 -->
		<div class="boardModalPan" style="display: none;">
			<div class="boardModal">
				<div class="closeModal">X</div>
				<div class="modalLogo">
					<img src="/resources/image/icons/man3.png">
				</div>

				<div class="adminMent">
					저희 Nunadri는 회원님들의 의견에<br>귀를 기울이겠습니다.
				</div>
				<hr
					style="border: 1px solid gray; width: 90%; margin-bottom: 5px; margin-top: 5px;">
				<div class="selectMun">
					<select>
						<option>문의</option>
						<option>신고</option>
					</select>
				</div>

				<div class="fileDay">
					<div>
						<input type="file" name="files" value="파일첨부">
					</div>
					<div>작성일 : 2020-05-22</div>
				</div>
				<input type="text" name="anWriter">
				<textarea class="textA" name="anContent"></textarea>
				<input class="checkBtn"
					style="margin-top: 15px; margin-left: 200px; text-align: center;"
					stype="submit" value="Submit">
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
</html>













