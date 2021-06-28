<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<body>
	<!-- 헤더 -->
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div>
		<div class="wrap">

			<!--topContent-->
			<div class="bottomContent">
				<div class="bottomMent">
					<h2>공지사항 등록</h2>
				</div>

				<div>
					<!--공지 등록하기-->
					<c:choose>
					<c:when test="${board == null }">
					<form action="/boardInsert.do" method="post" enctype="multipart/form-data">
						<div class="boardInfo">
							<div class="infoLine">
								<div>제목</div>
								<div>
									<input name="abTitle" type="text" placeholder="제목입력" style="width: 100%;height:100%;border:0px; outline: none">
								</div>
							</div>
							<input type="text" name="abCg" value="14" style="display: none">
							<input type="text" name="abWriter" value="${sessionScope.m.memberNick }" style="display: none;">
							<div class="infoLine">
							<div>첨부파일</div>
								<div style="width: 15%; border: 0">
									<input type="file" name="files1" style="margin-top: 3px; color: gray;" multiple="multiple">
									<input class="sendFile" onclick="window.history.back();" style="background-color: #ec523f" type="button" value="취소" />
								</div>
							</div>
						</div>
						
						
						<div class="content"><!--서머노트-->
							<textarea id="summernote" name="abContent"></textarea>
						</div>
						
						<div style="text-align: center; border: 0px; margin-top: 10px"><!--게시물 컨텐츠-->
							<input class="sendFile" type="submit" value="등록하기" />
						</div>
					</form>
					</c:when>
					
					
					<c:otherwise><!-- board값이 들어있다면 수정모드로 -->
					<form action="/boardUpdate.do" method="post" enctype="multipart/form-data">
						<div class="boardInfo">
							<div class="infoLine">
								<div>제목</div>
								<div>
									<input name="abTitle" type="text" value="${boardOne.abTitle}" style="width: 100%;height:100%;border:0px; outline: none">
								</div>
							</div>
							<input type="text" name="abCg" value="14" style="display: none">
							<input type="text" name="abWriter" value="${sessionScope.m.memberNick }" style="display: none;">
							<div class="infoLine">
							<div>첨부파일</div>
								<div style="width: 15%; border: 0">
									<input type="file" name="files2" style="margin-top: 3px; color: gray;" multiple="multiple">
								</div>
							</div>
						</div>						
						<div class="content"><textarea id="summernote" name="abContent">${boardOne.abContent}</textarea></div>
						
						<div style="text-align: center;border: 0px; margin-top: 10px"><!--게시물 컨텐츠-->
							<input class="sendFile" type="submit" value="등록하기" />
							<input class="sendFile" onclick="window.history.back();" style="background-color: #ec523f" type="button" value="취소" />
						</div>
					</form>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!--bottomContent-->
	</div>
	<!--wrap-->

	<!-- 푸터 -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
<!-- 서머노트 -->
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="/resources/css/summernote/summernote-lite.css">
<link rel="stylesheet" href="/resources/css/board/boardOneInsert.css">
<script>

	$('#summernote').summernote(
			{
				height : 500, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정
				placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
				callbacks : { //여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0], this);
					},
					onPaste : function(e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items
								&& clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file'
									&& item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					},
					onload:function(){
						alert("!");
					}
				},
				
			
			});
	
	
	//이미지 파일 업로드
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/adminImageUpload.do",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
	// 서머노트에 text 쓰기
/* 	$('#summernote').summernote('insertText', "써머노트에 쓸 텍스트");

	// 서머노트 쓰기 비활성화
	$('#summernote').summernote('disable');

	// 서머노트 쓰기 활성화
	$('#summernote').summernote('enable');

	// 서머노트 리셋
	$('#summernote').summernote('reset');

	// 마지막으로 한 행동 취소 ( 뒤로가기 )
	$('#summernote').summernote('undo');
	// 앞으로가기
	$('#summernote').summernote('redo'); */
</script>
<style>
.sendFile{
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
</style>
</html>
