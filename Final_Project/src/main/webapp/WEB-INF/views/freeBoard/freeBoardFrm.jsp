<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css">  -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>프리보드생성페이지</title>
<style>
* {
	color: black;
}

.making_feed_wrap {
	margin: 50px 600px 0px 600px;
	width: 900px;
}

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 30%;
	background-color: orange;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: OrangeRed;
}
input[type=reset] {
	width: 30%;
	background-color: orange;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=reset]:hover {
	background-color: OrangeRed;
}

input[type=text]:focus {
	background-color: transparent;
	border: 3px solid #555;
}

div.formTag {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 40px;
}

* {
	text-align: center;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="making_feed_wrap">
	<h1>MAKING FEED</h1>
		<div class="formTag">
			<form action="/insertFreeBoard.do" method="post" enctype="multipart/form-data">
				<i class="fas fa-camera"
					style="font-size: 50px; margin-top: 20px; margin-bottom: 50px;"></i>
				<div id="img-viewer">
					<img id="img-view" width="600px;" height="300px;"
						margin-top="50px;">
				</div>
				<label for="formFile" class="form-label mt-4"></label> <input
					class="form-control" type="file" id="formFile" name="files"
					onchange="loadImg(this)"><br>
				<br>
				<label for="fbWriter">WRITER</label><br>
				<input type="text" id="fbWriter" name="fbWriter"
					value="${sessionScope.m.memberNick }" readonly style='width:100px;'><br> 
					<label for="fbContent">CONTENT</label>
				<br><textarea id="fbContent" name="fbContent" cols='85' rows='10' style="text-align:left; resize:none; outline:none; border:none;"></textarea><br>
				<label for="type">CATEGORY</label><br> <select id="type" name="type" style='width:150px;'>
					<option value="4">스포츠</option>
					<option value="5">음악</option>
					<option value="6">여행</option>
					<option value="7">자연</option>
					<option value="8">게임</option>
					<option value="9">영화</option>
					<option value="10">술</option>
					<option value="11">음식</option>
				</select> <br>
				<input type="submit" value="MAKE FEED">
				<input type="reset" value="RESET">
			</form>
		</div>
	</div>

	<script>
		function loadImg(f) {
			if (f.files.length != 0) {
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);

				reader.onload = function(e) {
					$("#img-view").attr("src", e.target.result);
				}
			} else {
				$("#img-view").attr("src", "");
			}
		}
	</script>
</body>
</html>