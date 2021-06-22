<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <!-- 테이블css -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  </head>
  <style>
    div {
      border: 0px solid black;
    }
    body{
        margin: 0px;
        padding: 0px;
    }
    .wrap {
      width: 1000px;
      height: 1000px;
      margin: 0 auto;
      /* background-color: #f5f5f5; */
    }
    .topContent {
      width: 90%;
    height: 300px;
    margin: 0 auto;
    }
    .topContent > div {
      float: left;
      width: 50%;
      height: 100%;
      box-sizing: border-box;
      overflow: hidden;
    }
    .topConImg img {
      width: 100%;
      padding: 10px;
    }
    .topConMent {
      height: 80%;
      font-weight: bold;
      text-align: center;
      font-size: 13px;
    }
    .nunaMent{
        line-height: 25px;
        border: 0px;
       
    }
    .checkBtn {
      width: 100px;
      height: 30px;
      background-color: rgba(82, 193, 252, 0.844);
      border: 0px;
      border-radius: 5px;
      font-weight: bold;
      color: white;
      font-size: 13px;
    }
    .checkBtn:hover {
      background-color: rgba(89, 195, 252, 0.741);
      cursor: pointer;
    }

    .bottomContent {
      height: 600px;
      overflow: hidden;
    }
    .bottomMent {
      height: 50px;
	padding-left:50px;
    }
    .bottomList{
      width: 900px; 
      margin: 0 auto;
    }
    .listBar{
        background-color: rgba(0, 0, 0, 0.85);
        color: white;
    }
  </style>
  <body>
  <%@include file="/WEB-INF/views/common/header.jsp"%>
    <!-- 헤더 -->
    <div>
      <div class="wrap">
        <div class="topContent">
          <div class="topConImg"><img src="/resources/image/icons/happy.jpg" /></div>
          <div>
            <div><h1 style="text-align: center">저희 Nunadri는</h1></div>
            <div class="topConMent">
              <pre class="nunaMent" style=" background-color: transparent;">
보다 좋은 활동을 추구하기에,
회원님들과의 만남에 좋은영향을 줄수있도록
매번 노력에 임하겠습니다.
저희 Nunadri를 아껴주시는 회원님들의
의견을 적극적으로 수용하겠습니다.
                </pre>
                <input class="checkBtn" type="button" value="문의 / 신고" />
            </div>
          </div>
        </div>
        <!--topContent-->
        <div class="bottomContent">
          <div class="bottomMent">
            <h2>공지사항</h2>
          </div>

          <div class="bottomList">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr class="listBar">
                    <th>No.</th>
                    <th>공지제목</th>
                    <th>작성자</th>
                    <th>날짜</th>
                    <th>조회수</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${boardList }" var="l" varStatus="i">
                  <tr>
                    <td>${i.count }</td>
                    <td>${l.abTitle }</td>
                    <td>${l.abWriter }</td>
                    <td>${l.enrollDate }</td>
                    <td>${i.count }</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div><!--bottomList end-->

          </div>
        </div><!--bottomContent-->

      </div><!--wrap-->

    <!-- 푸터 -->
    <%@include file="/WEB-INF/views/common/footer.jsp"%>
  </body>
</html>
