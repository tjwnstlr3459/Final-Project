<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>포토게시판 작성</h1>
	<hr>
	<form action="/photoWrite.do" method="post" enctype="multipart/form-data">
		<fieldset>
            <legend>파일 업로드</legend>
            <table class="table" style="width:100%;">
               
               <tr class="table-active">
                  <th>첨부파일</th>
                  <td style="text-aligh:left">
                     <input type="file" name="filename" onchange="loadImg(this);">
                  </td>
               </tr>
               <tr class="table-active">
                  <th>작성자</th>
                  <td colspan="3">
                     <input type="text" name="boardWriter" value="${sessionScope.m.email }" readonly>
                  </td>
               </tr>
               <tr class="table-active">
                  <th>내용</th>
                  <td colspan="3">
                     <input type="text" name="boardContent" id="boardContent">
                  </td>
               </tr>

               <tr class="table-active">
                  <th colspan="4">
                     <button type="submit" value="등록"></button>
                  </th>
               </tr>
            </table>
         </fieldset>
	</form>
</body>
</html>