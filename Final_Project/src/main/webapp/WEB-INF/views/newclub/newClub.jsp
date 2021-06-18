<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/newClub.css" />
</head>
<%@include file="/WEB-INF/views/common/adminHeader.jsp" %>
<body>
    <div class="wrapper">
        <div class="container">
            <div class="wrap">
                <div class="navi">
                    <ul class="menu">
                        <li class="active"><a href="#">게시글</a></li>
                        <li><a href="#">사진첩</a></li>
                        <li><a href="#">일정</a></li>
                        <li><a href="#">멤버</a></li>
                    </ul>
                </div>
                <div class=contain>
                    <div class="left">
                        <div class="profile">

                        </div>
                    </div>
                    <div class="middle">
                        <div class="tab-cont">
                            <div class="board">
                                게시글 올리기
                            </div>
                            <div>2.내용입니다</div>
                            <div>3.내용입니다</div>
                            <div>4.내용입니다</div>
                        </div>
                    </div>
                    <div class="right">
                        <div class="chatlist">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        var tabBtn = $(".navi > .menu > li");     //각각의 버튼을 변수에 저장
        var tabCont = $(".tab-cont > div");       //각각의 콘텐츠를 변수에 저장


        tabCont.hide().eq(0).show();

        tabBtn.click(function () {
            var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
            var index = target.index();   //버튼의 순서를 변수에 저장
            tabBtn.removeClass("active");    //버튼의 클래스를 삭제
            target.addClass("active");       //타겟의 클래스를 추가
            tabCont.css("display", "none");
            tabCont.eq(index).css("display", "block");
        });
    </script>
</body>

</html>
