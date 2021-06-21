<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/insertPost.do" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>사진게시판 작성</legend>
				<table class="table" style="width: 100%;">
					<tr class="table-active">
						<th>작성자</th>
						<td><input type="text" name="boardWriter"
							value="${sessionScope.m.memberNick}">${sessionScope.m.memberNick }</td>
						<th>첨부파일</th>
						<td style="text-align: left"><input type="file"
							name="fileName" onchange="loadImg(this);"></td>
					</tr>
					<tr class="table-active">
						<th>이미지</th>
						<td colspan="3">
							<div id="img-viewer">
								<img id="img-view" width="500px">
							</div>
						</td>
					</tr>
					<tr>
						<th>클럽이름</th>
						<td>
							<input name="clubNo" value="6">
						</td>
					</tr>
					<tr>
						<th>클럽종류</th>
						<td>
							<input name="boardCg" value="5">
						</td>
					</tr>
					<tr class="table-active">
						<th>제목</th>
						<td colspan="3"><input type="text" name="boardTitle"
								class="form-control"></td>
					</tr>
					<tr class="table-active">
						<th>내용</th>
						<td colspan="3"><textarea name="boardContent"
								class="form-control"></textarea></td>
					</tr>
					<tr class="table-active">
						<th colspan="4">
							<button type="submit" class="btn btn-danger btn-block">등록하기</button>
						</th>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
	<script>
	//사진클릭시 미리보기
	function loadImg(f){
	    console.log(f.files);   //input file에서 선택한 파일을 배열로가지고옴
	    if(f.files.length !=0){	//첨부파일이 있는경우
	    	var reader = new FileReader();	//첨부파일을 읽어올 객체
	    	reader.readAsDataURL(f.files[0]);	//해당파일의 경로를 읽어옴
	    	//경로를 다 읽어오면 실행할 함수 지정(e는 reader의 자동반환)
	    	reader.onload=function(e){	
	    		$("#img-view").attr("src",e.target.result);
	    	}
	    }else{		//첨부파일이 없는 경우
	    	$("#img-view").attr("src",""); //빼는경우
	    }
	}
	</script>
</body>
</html> 