<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>클럽생성페이지</title>
<style>
body{
	background-color: #f5f5f5;
}
.clubForm {
	text-align: center;
	font-family: "Source Sans Pro", sans-serif;
	margin: 0 auto;
	width: 700px;
	
}
li{
	color: #fff;
}
.sub > li > a{
	color: #fff;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<!-- <hr style="color: #fff; border: 2px solid #fff;"> -->
	<div class="clubForm">
		<fieldset>
			<h1>CREATE CLUB FORM</h1>
			<br>
			<form action="/createClub.do" method="POST"
				enctype="multipart/form-data">
				CLUB MASTER<br>
				<div class="input-group mb-3">
					<span class="input-group-text" id="inputGroup-sizing-default">CLUB
						OPENER</span> <input type="text" class="form-control"
						aria-label="Sizing example input"
						aria-describedby="inputGroup-sizing-default" name="clubOpener"
						value="${sessionScope.m.memberNick }" readonly>
				</div>
				<br> CLUB NAME<br>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">CLUB NAME</span> <input
						type="text" class="form-control" aria-label="Username"
						aria-describedby="basic-addon1" name="clubName">
				</div>
				<br> CATEGORY<br> <select name="clubCg"
					class="form-select">
					<option disabled>Category</option>
					<option value="4">스포츠</option>
					<option value="5">음악</option>
					<option value="6">여행</option>
					<option value="7">자연</option>
					<option value="8">게임</option>
					<option value="9">영화</option>
					<option value="10">술</option>
					<option value="11">음식</option>
				</select><br> <br>INTRO
				<div class="input-group">
					<span class="input-group-text">CLUB INTRO</span>
					<textarea class="form-control" aria-label="With textarea"
						name="clubIntro"></textarea>
				</div>
				<br> CLUB IMG
				<div class="mb-3">
					<input type="file" class="form-control" aria-label="file example"
						onchange="loadImg(this)" required name="file">
					<div id="img-viewer" >
				<img id="img-view" border="none;" width="100%;" height="100%;" margin-top="50px;"
					alt="" style='display:none; margin:0 auto;'>
			</div>
				</div>
				<script>
					function loadImg(f) {
						if (f.files.length != 0) {
							var reader = new FileReader();
							reader.readAsDataURL(f.files[0]);
							reader.onload = function(e) {
							$("#img-view").css("display","block");
							$("#img-view").attr("src", e.target.result);
							}
						} else {
							$("#img-view").css("display","none");
							$("#img-view").attr("src", "");
						}
					}
				</script>
				<br>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="ispublic"
						id="flexRadioDefault1" value="Y" checked> <label
						class="form-check-label" for="flexRadioDefault1"
						style="float: left;"> PUBLIC </label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="radio" name="ispublic"
						id="flexRadioDefault2" value="N"> <label
						class="form-check-label" for="flexRadioDefault2"
						style="float: left;"> PRIVATE </label>
				</div>
<strong style="color:black; font-size:20px;">Check all items are filled!!!</strong>				
				<br><br>
				<button type="submit" class="btn btn-outline-dark">MAKE!</button>
			</form>
		</fieldset>
	</div>
</body>
</html>