<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="list-wrap box-wrap">
					<div class="list-table">
						<table class="list restrictionList">
							<thead>
								<tr>
									<th><input type="checkbox" class="allCheck"><th>번호</th><th>이메일</th><th>분류</th><th>사유</th><th>시작일</th><th>종료일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" class="checkRest"></td><td>no</td><td>user1@gmail.com</td><td>욕설/폭언</td><td><span id="ofHidden">ㅏㅁㄴ;ㅐㅇ라ㅓㅁㄴ;ㅣㅏㅇ럼니아럼니아럼ㄴ;ㅇ라ㅓㅁㄴㅇ;ㅣ라ㅓㅁ니;아럼;ㅣ낭러ㅣㅁ나어리ㅏㅁㄴ어리</span></td><td>2021-06-01</td><td>2021-07-01</td><td><button>해제</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>