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
 <link rel="stylesheet" href="/resources/css/board/boardList.css">
  <body>
  <div class="modalback">
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
                <div style="width: 65%">${board.abTitle }</div>
                <div>날짜</div>
                <div style="width: 14%; border: 0">${board.enrollDate }</div>
              </div>
              <div class="infoLine">
                <div>작성자</div>
                <div style="width: 27%">${board.abWriter }</div>
                <div>이메일</div>
                <div style="width: 27.7%">${board.abWriter }</div>
                <div>조회수</div>
                <div>${board.abWriter }</div>
              </div>
              <div class="infoLine">
                <div>첨부파일</div>
                <div style="border: 0px"><input type="file" value="파일첨부"></div>
              </div>
            </div>

            <div class="content"><h3 style="text-align: center">${board.abContent }</h3>${board.filePath }</div><!--게시물 컨텐츠-->


			<c:if test="${not empty sessionScope.m }">
	           <div class="coment">
	             <!--댓글-->
	             	<form action="/insertComent.do" method="post">
	              <div class="comentLine" style="width: 10%;">
	                <img
	                  class="userImg"
	                  src="/resources/image/icons/happy2.jpg"
	                />
	              </div>
	              
	              <div class="nameTime" style="width: 10%;">
	                <div>바람돌이</div>
	                <div>${board.abWriter }</div>
	              </div>
	
	              <div class="mentWriteBox" style="width: 70%;">
	                <input class="mentWrite" type="text" value="댓글내용" />
	              </div>
		      	</form>
	             <div style="width: 10%;background-color: #edeef4;"><input class="momentBtn" type="submit" value="확인"></div>
	           </div>
			</c:if>




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
    
         <!-- 모달 -->
    <div class="boardModalPan" style="display: none;">
      <div class="boardModal">
        <div class="closeModal">X</div>
        <div class="modalLogo"><img src="/resources/image/icons/man3.png"></div>
        
        <div class="adminMent">저희 Nunadri는 회원님들의 의견에<br>귀를 기울이겠습니다.</div>
        <hr style="border: 1px solid gray; width: 90%;margin-bottom: 5px; margin-top: 5px;">
        <div class="selectMun">
          <select>
            <option>문의</option>
            <option>신고</option>
          </select>
        </div>
        
        <div class="fileDay">
          <div><input type="file" value="파일첨부"></div>
          <div>작성일 : 2020-05-22</div>
        </div>
        <textarea class="textA"></textarea>
        <input class="checkBtn" style="margin-top:15px; margin-left: 200px; text-align: center;" stype="submit" value="Submit">
      </div>
    </div>
   </div> 
  </body>
<script>
    $(".checkBtn").click(function(){
      $(".boardModalPan").css("display","block");
      
      $(".boardModalPan").css("display","flex");
    });

    $(".closeModal").click(function(){
      $(".boardModalPan").css("display","none");
    });
  </script>
</html>











