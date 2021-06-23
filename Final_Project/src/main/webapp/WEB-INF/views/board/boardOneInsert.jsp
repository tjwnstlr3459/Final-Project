<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>

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
            <!--공지 상세보기-->
            <div class="boardInfo">
              <div class="infoLine">
                <div>제목</div>
                <div style="width: 65%">
                  <input class="summerTitle" type="text" placeholder="제목입력">  
                </div>
                <div>날짜</div>
                <div style="width: 15%; border: 0">날짜정보</div>
              </div>
              
            </div>

            <div class="content"><!--서머노트-->
              <form method="post">
                <textarea id="summernote" name="editordata"></textarea>
              </form>
              
            </div><!--게시물 컨텐츠-->

            

            <div>
              <input class="boardListBtn" type="button" value="등록하기" />
            </div>
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
    <link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
    <link rel="stylesheet" href="/resources/css/board/boardOneInsert.css">
  <script>
  
  
    $(document).ready(function() {
	//여기 아래 부분
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
});

// 서머노트에 text 쓰기
$('#summernote').summernote('insertText', "써머노트에 쓸 텍스트");


// 서머노트 쓰기 비활성화
$('#summernote').summernote('disable');

// 서머노트 쓰기 활성화
$('#summernote').summernote('enable');


// 서머노트 리셋
$('#summernote').summernote('reset');


// 마지막으로 한 행동 취소 ( 뒤로가기 )
$('#summernote').summernote('undo');
// 앞으로가기
$('#summernote').summernote('redo');
  </script>
</html>
