<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - UserList</title>
<style>
	.menu>li:nth-child(3)>a{
	    padding-left:25px;
	    border-left:5px solid var(--mainTextColor);
	    border-right:5px solid var(--mainTextColor);
	    background:linear-gradient(to bottom, rgba(1, 225, 255, 0.5),rgba(33, 229, 255, 0.3),rgba(95, 235, 248, 0.1));
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- header-nav -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		<!-- content -->
		<section>
			<div class="content-wrap">
                <!-- 목록 div -->
               	<div class="title-wrap box-option">
               		<h2>회원 목록</h2>
               	</div>
                <div class="list-wrap box-option">
                	<!-- 검색 div -->
	               <div class="searchBar-wrap">
	                   <select class="" name="category" id="keywords">
	                       <option value="email" selected>이메일</option>
	                       <option value="name">닉네임</option>
	                       <option value="hobby">취미</option>
	                   </select>
	                   <input type="search" class="searchBar" name="user">
	                   <button class="btns" id="searchBtn"><img src="/resources/image/icons/search_black.png"></button>
	               </div>
                   	<div class="list-header">
                        <div class="option-wrap">
                            <!-- ajax>배열[]사용>controller 에서 String[] 을 매개변수로 받아서 사용 -->
                            <button class="btns" id="selectMessageBtn">선택 쪽지발송</button>
                            <button class="btns" id="selectMailBtn">선택 메일발송</button>
                            <button class="btns" id="insertAdminBtn">관리자 등록</button>
                            <select name="sort" id="sort">
                                <option value="date" selected>최근 가입순</option>
                                <option value="dateDesc">이전 가입순</option>
                                <option value="restriction">경고(제재)</option>
                                <option value="dateLast">최종접속일</option>
                            </select>
                        </div>
                    </div>
                    <div class="list-table">
                        <table class="list memberList">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="allCheck"></th><th>번호</th><th>이메일</th><th>닉네임</th><th>취미1</th><th>취미2</th><th>취미3</th><th>등급</th><th>제재</th><th>최종접속일</th><th>가입일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button class="btns warningBtn">경고</button><button class="btns restBtn">제재</button><button class="btns deleteBtn">삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>회원</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkMember"></td><td>123</td><td>test@email.com</td><td>user1</td><td>#스포츠</td><td>#음악</td><td>#영화</td><td>관리자</td><td>0</td><td>2021-06-17</td><td>2021-06-15</td><td><button>경고</button><button>제재</button><button>삭제</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="list-footer">

                    </div>
                </div>
            </div>
            <!-- 모달영역 -->
            <div class="modal">
                <div class="modal-box">
                    <h2 class="titleHead">사유</h2>
                    <textarea name="dmComment" id="summernote" class="textarea" cols="30" rows="10" style="resize:none;"></textarea>
                    <div class="btn-box">
                        <button class="btns">확인</button>
                        <button class="btns">취소</button>
                    </div>
                    <button class="btns" id="closeBtn">X</button>
                </div>
            </div>
		</section>
	</div>
</body>
</html>