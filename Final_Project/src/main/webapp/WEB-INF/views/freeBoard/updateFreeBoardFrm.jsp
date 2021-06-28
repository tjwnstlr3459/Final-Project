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
<link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>프리보드 수정페이지</title>
</head>
<body>
	<div class="making_feed_wrap">
		<h3 class="card-header">UPDATE FEED!</h3>
		<fieldset>
			<i class="fas fa-camera"
				style="font-size: 50px; margin-top: 20px; margin-bottom: 50px;"></i>
			<div id="img-viewer">
				<img id="img-view" width="600px;" height="400px;" margin-top="50px;" src="/resources/freeBoardUpload/${fb.filepath }">
			</div>
		</fieldset>
	</div>
	<form action="/updateFreeBoard.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<input type="text" name = "fbNo" value="${fb.fbNo }" hidden>
								<input type="hidden" name="status" value="stay">
                                <img src="/resources/image/file.png" width="16px" class="delFile">
                                <span class="delFile">${fb.filepath }</span>
                                <button type="button" id="delBtn" class="btn btn-primary btn-sm delFile">삭제</button>
                                
                                <input type="file" name="files" id="file" style="display:none;" onchange="loadImg(this);">
                                <input type="hidden" name="oldFilename" value="${fb.filename }">
                                <input type="hidden" name="oldFilepath" value="${fb.filepath }">
                                
			<!--  <label for="formFile" class="form-label mt-4"></label> <input
				class="form-control" type="file" id="formFile" name="files"
				onchange="loadImg(this)" style="display:none;">  -->
		</div>
		<div class="form-group">
			<label for="typeSelect" class="form-label mt-4">CLUB CATEGORY</label> <select class="form-select" name="type" id="typeSelect" style="color:white;">
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
		</div>
		<div class="card-footer text-muted">
			<input type="text" name="fbWriter" value="${sessionScope.m.memberNick }" hidden>
		</div>
		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
			<textarea class="form-control" id="exampleTextarea" rows="3" name="fbContent">${fb.fbContent }</textarea>
		</div>
		<p style="margin-top: -12px"></p>
		<div class="making_feed_wrap">
			<button type="submit" class="btn btn-outline-light"
				style="margin-top: 30px;">UPDATE</button>
				<button type="reset" class="btn btn-outline-light"
				style="margin-top: 30px;" onclick="window.location.reload();">RESET</button>
		</div>
	</form>
</body>
<script>
$("#delBtn").click(function(){
	if(confirm("원래 이미지를 삭제하시겠습니까?")){
		$(".delFile").hide();
		$("#file").show();
		$("[name=status]").val("delete");
		$("#img-view").attr("src","");
	}
});
    function loadImg(f){	
			if(f.files.length != 0){		
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);	
	
				reader.onload=function(e){
					$("#img-view").attr("src",e.target.result);		
				}
			}else{
				$("#img-view").attr("src","");
			}
		}
</script>
</html>