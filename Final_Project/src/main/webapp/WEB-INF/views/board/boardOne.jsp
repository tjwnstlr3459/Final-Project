<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- 헤더 -->
    <%@include file="/WEB-INF/views/common/header.jsp"%>
    <div>
      <div class="wrap">
        <div class="topContent">
          <div class="topConImg">
            <img
              src="/resources/image/icons/happy3.jpg"
            />
          </div>
          <div>
            <div><h1 style="text-align: center">저희 Nunadri는</h1></div>
            <div class="topConMent">
              <pre class="nunaMent" style="background-color: transparent">
보다 좋은 활동을 추구하기에,
회원님들과의 만남에 좋은영향을 줄수있도록
매번 노력에 임하겠습니다.
저희 Nunadri를 아껴주시는 회원님들의
의견을 적극적으로 수용하겠습니다.
                </pre
              >
              <input class="checkBtn" type="button" value="문의 / 신고" />
            </div>
          </div>
        </div>
        <!--topContent-->
        <div class="bottomContent">
          <div class="bottomMent">
            <h2>공지사항</h2>
          </div>

          <div class="bottomContentFont">
            <!--공지 상세보기-->
            <div class="boardInfo">
              <div class="infoLine">
                <div>제목</div>
                <div style="width: 65%">제목정보</div>
                <div>날짜</div>
                <div style="width: 15%; border: 0">날짜정보</div>
              </div>
              <div class="infoLine">
                <div>작성자</div>
                <div style="width: 27%">작성자</div>
                <div>이메일</div>
                <div style="width: 27.7%">이메일</div>
                <div>조회수</div>
                <div>조회수</div>
              </div>
              <div class="infoLine">
                <div>첨부파일</div>
                <div style="border: 0px">첨부파일</div>
              </div>
            </div>

            <div class="content"></div><!--게시물 컨텐츠-->

            <div class="coment">
              <!--댓글-->
              <div class="comentLine" style="width: 10%;">
                <img
                  class="userImg"
                  src="/resources/image/icons/happy2.jpg"
                />
              </div>

              <div class="nameTime" style="width: 10%;">
                <div>바람돌이</div>
                <div>2002-04-25</div>
              </div>

              <div class="mentWriteBox" style="width: 70%;">
                <input class="mentWrite" type="text" value="댓글내용" />
              </div>

              <div style="width: 10%;background-color: #edeef4;"><input class="momentBtn" type="button" value="확인"></div>
            </div>

            <div>
              <input class="boardListBtn" type="button" value="목록으로" />
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
</html>