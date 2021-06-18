<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .join {
            text-align: center;
        }
        .join > a {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
        }
    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="join">
            <h2>회원가입</h2>
            <form action="/join.do" method="post">
                <input type="email" name="email"><br>
                <span class="mailMsg">span 테스트</span><br>
                <button type="button" id="mailCfrm">확인</button>

            </form>
            <a href="#">구글 로그인</a>
            <a href="#">카카오 로그인</a>
            <a href="#">네이버 로그인</a>
        </div>
    </div>    
    <script>
        $("#mailCfrm").click(function() {
            var email = $("[name=email").val();
            console.log(email);
            $.ajax({
                url: "user/selectOneMember",
                type: "post",
                data: {email:email},
                success: function(data) {

                },
                error: function() {
                    console.log("error")
                }

            })
            $(".mailMsg").html("캬오");
        })
    </script>
    
</body>
</html>