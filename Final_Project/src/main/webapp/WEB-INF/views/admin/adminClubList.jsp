<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NINADRI - ClubList</title>
<style>
	.menu>li:nth-child(4)>a{
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
                <!-- 검색 div -->
                <div class="searchBar-wrap box-option">
                    <select class="" name="category" id="keywords">
                        <option value="name" selected>클럽명</option>
                        <option value="category">카테고리</option>
                    </select>
                    <input type="search" class="searchBar" name="user">
                    <button class="btns" id="searchBtn">검색</button>
                </div>
                <!-- 목록 div -->
                <div class="list-wrap box-option">
                    <div class="list-header">
                        <div class="option-wrap">
                            <!-- ajax>배열[]사용>controller 에서 String[] 을 매개변수로 받아서 사용 -->
                            <button class="btns" id="selectMessageBtn">선택 쪽지발송</button>
                            <button class="btns" id="allMessageBtn">전체 쪽지발송</button>
                            <button class="btns" id="selectMailBtn">선택 메일발송</button>
                            <button class="btns" id="allMailBtn">전체 메일발송</button>
                            <select name="sort" id="sort">
                                <option value="date" selected>최근 개설순</option>
                                <option value="dateDesc">이전 개설순</option>
                                <option value="restriction">경고(제재)</option>
                                <option value="dateLast">최종활동일</option>
                            </select>
                        </div>
                    </div>
                    <div class="list-table">
                        <table class="list userList">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" id="allCheck"></th><th>번호</th><th>카테고리</th><th>클럽명</th><th>개설자</th><th>제재</th><th>최종활동일</th><th>개설일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="checkbox" class="checkClub"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="checkUser"></td><td>123</td><td>스포츠</td><td>FC발냄새</td><td>유저1</td><td>0</td><td>2021-06-17</td><td>2021-06-18</td><td><button>경고</button><button>삭제</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="list-footer">

                    </div>
                </div>
            </div>
		</section>
	</div>
</body>
</html>