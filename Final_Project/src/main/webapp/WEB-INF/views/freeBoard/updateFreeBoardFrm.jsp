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
<!-- <link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css"> -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
	* {
	color: black;
}

.making_feed_wrap {
	margin: 50px 600px 0px 600px;
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

input[type=reset]:hover {
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

input[type=submit]:hover {
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
<title>프리보드 수정페이지</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="making_feed_wrap">
		<h3 class="card-header">UPDATE FEED!</h3>
		
		<div class="formTag">
		
			<i class="fas fa-camera" style="font-size: 50px; margin-top: 20px; margin-bottom: 50px;"></i>
			<div id="img-viewer">
				<img id="img-view" width="600px;" height="300px;" margin-top="50px;" src="/resources/freeBoardUpload/${fb.filepath }">
			</div>
			
			<form action="/updateFreeBoard.do" method="post" enctype="multipart/form-data">
					<input type="text" name="fbNo" value="${fb.fbNo }" style="display:none;">
					<input type="hidden" name="status" value="stay">
					 
					<img src="/resources/image/file.png" width="16px" class="delFile">
					<span class="delFile">${fb.filepath }</span>
					
					<button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">삭제</button>
					<input type="file" name="files" id="file" style="display: none;" onchange="loadImg(this);"> 
					
					<input type="hidden" name="oldFilename" value="${fb.filename }"> 
					
					<input type="hidden" name="oldFilepath" value="${fb.filepath }">
									<br><br><br>
					<label for="type">CATEGORY</label> 
					<select id="type" name="type">
					<option value="${fb.type }" fixed>현재 카테고리 : ${fb.typeString }</option>
					<option value="4">스포츠</option>
					<option value="5">음악</option>
					<option value="6">여행</option>
					<option value="7">자연</option>
					<option value="8">게임</option>
					<option value="9">영화</option>
					<option value="10">술</option>
					<option value="11">음식</option>
				</select>
				<label for="fbWriter">WRITER</label>
					<input type="text" name="fbWriter" id="fbWriter" value="${sessionScope.m.memberNick }" readonly>

				<label for="fbContent">CONTENT</label>
					<textarea id="fbContent" name="fbContent" cols='85' rows='10' style="text-align:left; resize:none; outline:none; border:none;">${fb.fbContent }</textarea>
				<p style="margin-top: -12px"></p>
					<input type="submit" value="UPDATE"></input>
					<input type="reset" value="RESET" onclick="window.location.reload();"></input>
		</form>
		</div>
		</div>
</body>
<script>
	$("#delBtn").click(function() {
		if (confirm("원래 이미지를 삭제하시겠습니까?")) {
			$(".delFile").hide();
			$("#file").show();
			$("[name=status]").val("delete");
			$("#img-view").attr("src", "");
		}
	});
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
</html>