<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .container {
            text-align: center;
        }
        .join {
            position: relative;
            width:300px;
            margin: 0 auto;
        }
        .social > a {
            display: block;
            margin-top: 5px;
            margin-bottom: 5px;
        }
        #mailCfrm, input[type=submit] {
            width: 300px;
            height: 35px;
            color: white;
            font-weight: bold;
            background-color: #ec523f;
            border: 0;
        }
        input, textarea {
            width: 300px;
            height: 35px;
            padding: 5px;
            box-sizing: border-box;
        }
        textarea { 
            height:100px; 
            resize:none;
        }
        input:focus, textarea:focus {
            outline:none;
        }
        input[type=checkbox] {
            width: 15px;
            height: 15px;
        }
        select {
            width: 300px;
            height: 35px;
            padding: 5px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }
        .inputMsg, .chkMsg {
            display: inline-block;
            width: 100%;
            height: 20px;
            text-align: left;
            padding-left: 5px;
            font-size: 0.9em;
            color: cornflowerblue;
        }
        .legend {
            display: inline-block;
            width: 100%;
            text-align: left;
            font-weight: bold;
            padding-left: 5px;
            font-size: 0.8em;
        }
        formgroup {
            display:none;
        }
        input[type=radio]{
            display: none;
        }
        input[type=radio]+label{
            display: inline-block;
            box-sizing: border-box;
            height: 35px;
            width: 96px;
            border: 1px solid #aaa;
            line-height: 35px;
            text-align: center;
            font-weight:bold;
            font-size:13px;
        }
        input[type=radio]:checked+label{
            background-color: #333;
            color: #fff;
        }
        #postcode {
            float: left;
            width:61%;
            margin-bottom: 5px;
        }
        #findCode {
            float: right;
            width: 38%;
        }
        #roadAddress {
            margin-bottom: 5px;
        }
        .elementChk {
            text-align: left;
        }
        .elementChk > label {
            display:inline-block; 
            width:70px;
            font-size: 0.9em;
        }
        
    </style>
</head>
<body>
    <div class="container">
        <h2>회원가입</h2>          	
        <div class="join">
            <form id="joinForm" action="/joinProcessing.do" method="post">
                <div class="element">
                    <span class="legend">이메일</span>
                    <input type="email" name="email" placeholder="이메일">
                    <span class="inputMsg"></span>
                </div>
                <formgroup id="restForm">
                    <div class="element">
                        <span class="legend">비밀번호</span>
                        <input type="password" name="memberPw" placeholder="소문자, 대문자, 숫자 포함 8자 이상 30자 이내">
                        <span class="inputMsg"></span>
                    </div>
                    <div class="element">
                        <span class="legend">비밀번호 확인</span>
                        <input type="password" name="memberPw2" placeholder="비밀번호 확인">
                        <span class="inputMsg"></span>
                    </div>
                    <div class="element">
                        <span class="legend">이름(닉네임)</span>
                        <input type="text" name="memberNick" placeholder="영문 40자, 한글 13자 이내">
                        <span class="inputMsg"></span>
                    </div>

                    <div class="element">
                        <span class="legend">나이</span>
                        <select name="age">
                            <option value="10">10대 이하</option>
                            <option value="20">20대</option>
                            <option value="30">30대</option>
                            <option value="40">40대</option>
                            <option value="50">50대</option>
                            <option value="60">60대 이상</option>
                            <option value="0">선택하지 않음</option>
                        </select> 
                    </div>         
                    
                    <div class="element">
                        <span class="legend">성별</span>
                        <input type="radio" id="M" name="gender" value="M"><label for="M">남자</label>
                        <input type="radio" id="F" name="gender" value="F"><label for="F">여자</label>
                        <input type="radio" id="N" name="gender" value="N" checked><label for="N">선택하지 않음</label>
                        <span class="inputMsg"></span>
                    </div>
                    
                    <div class="element">
                        <span class="legend">주소</span>
                        <input type="text" id="postcode" placeholder="우편번호"><input type="button" id="findCode" onclick="findPCode()" value="우편번호 찾기"><br>
                        <input type="text" id="roadAddress" placeholder="도로명주소">
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="detailAddress" placeholder="상세주소">
                        <span class="inputMsg"></span>
                    </div>

                    <div class="elementChk">
                        <span class="legend">관심분야(3개 선택)</span>
                        <label><input type="checkbox" name="hobby" value="1">여행</label>
                        <label><input type="checkbox" name="hobby" value="2">운동</label>
                        <label><input type="checkbox" name="hobby" value="3">게임</label>
                        <label><input type="checkbox" name="hobby" value="4">예술</label>
                        <br>
                        <label><input type="checkbox" name="hobby" value="5">맛집</label>
                        <label><input type="checkbox" name="hobby" value="6">영화</label>
                        <label><input type="checkbox" name="hobby" value="7">술</label>
                        <label><input type="checkbox" name="hobby" value="8">여행</label>
                        <span class="chkMsg"></span>
                    </div>

                    <div class="element">
                        <span class="legend">자기소개(600자 이내)</span>
                        <textarea name="intro">자기소개</textarea>
                        <span class="inputMsg"></span>
                    </div>

                    <div class="element">
                        <span class="legend">프로필 사진</span>
                        <input type="file" name="filename">
                        <span class="inputMsg"></span>
                    </div>

                    <input type="submit" value="회원 가입" onclick="return joinCheck()">
                </formgroup>
                
                <button type="button" id="mailCfrm">확인</button>

            </form>
            <div class="social">
                <span>소셜 서비스로 가입</span>
                <a href="#">구글 로그인</a>
                <a href="#">카카오 로그인</a>
                <a href="#">네이버 로그인</a>
            </div>           
        </div>
    </div>   

    <script>
	    function findPCode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("postcode").value = data.zonecode;
	                document.getElementById("roadAddress").value = roadAddr;
	                
	               
	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';
	
	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }

        function regchk(regexp, val) {
            if(regexp.test(val)) {
                return true;
            } else {
                return false;
            }
        }

        $("#mailCfrm").click(function() {
            var email = $("[name=email]").val();
            var emailReg = /^([\w\d_\.-]+)@([\w\d_-]+)(\.[\w\d_-]+){1,2}$/;
            if(email == "") {
            	$("[name=email]").next().html("이메일 주소를 입력해주세요.");
            } else if(!emailReg.test(email)) {
                $("[name=email]").next().html("이메일 주소를 확인해주세요.");
            }
            else {         
                $("[name=email]").next().html("");       
                //jsp로 옮길 때 삭제
                $("#restForm").slideDown(800);
                //삭제 끝
            	$.ajax({
                    url: "/user/chkEmail.do",
                    type: "post",
                    data: {email:email},
                    success: function(data) {
    					if(data == "1") {
    						$("[name=email]").next().html("이미 가입된 이메일입니다");
    					}
    					else {
    						$("[name=email]").next().html("");
                            $("#restForm").slideDown(800);
                            $(this).hide();

    					}
                    },
                    error: function() {
                        console.log("error")
                    }

                })
            }            
        })
        $("[name=memberPw]").keyup(function() {
            var pw = $(this).val();
            var pwReg = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}/
            if(pwReg.test(pw)) {
                $(this).next().html("");
            } else {
                $(this).next().html("대문자, 소문자, 숫자 조합으로 8자 이상 입력해주세요.");
            }
        })
        $("[name=memberPw2]").change(function() {
            var pw = $("[name=memberPw]").val();
            var pw2 = $(this).val();
            if(pw == pw2) {
                $(this).next().html("");
            } else {
                $(this).next().html("비밀번호가 일치하지 않습니다.");
            }
        })
        $("[name=memberNick]").change(function() {
            var name = $(this).val();
            var nameByteLength = name.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            if(name == "") {
                $(this).next().html("이름은 비워둘 수 없습니다");
            } else if(nameByteLength > 40) {
                $(this).next().html("이름 길이 제한을 초과했습니다");
            } else {               
                $(this).next().html("");
                $.ajax({
                url: "/user/chkName.do",
                type: "post",
                data: {memberNick:name},
                success: function(data) {
					if(data == "1") {
						$(this).next().html("중복된 닉네임은 사용할 수 없습니다");
					}
					else {
					}
                },
                error: function() {
                    console.log("error")
                }

                })   
            }
        })
        $("input[type=checkbox]").change(function() {
            var checked = $("input[type=checkbox]:checked").length;
            if(checked >= 3) {
                $("input[type=checkbox]:not(:checked)").attr("disabled", "disabled");
            } else {
                $("input[type=checkbox]").removeAttr("disabled");
            }
        })

        $("[name=intro]").change(function() {
            var intro = $(this).val();
            var introByteLength = intro.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            if(introByteLength > 2000) {
                $(this).next().html("길이 제한을 초과했습니다");
            } else {
                $(this).next().html("");
            }
        })
        
        function joinCheck() {
            var email = $("[name=email]").val();
            var emailReg = /^([\w\d_\.-]+)@([\w\d_-]+)(\.[\w\d_-]+){1,2}$/;
            var pw = $("[name=memberPw]").val();
            var pwReg = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}/
            var pw2 = $("[name=memberPw2]").val();
            var name = $("[name=memberNick]").val();
            var nameByteLength = name.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            var age = $("[name=age]").val();
            var gender = $("[name=gender]:checked").val();
            var address = $("#postcode").val() + " " + $("#roadAddress").val() + " " + $("#detailAddress").val();
            var hobby = [];
            $("[name=hobby]:checked").each(function() { 
                hobby.push($(this).val());
            });
            var hobby1 = hobby[0];
            var hobby2 = hobby[1];
            var hobby3 = hobby[2];
            var intro = $("[name=intro]").val();
            var introByteLength = intro.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            var checked = $("input[type=checkbox]:checked").length;
            
            console.log(email);
            console.log(pw);
            console.log(pw2);
            console.log(name);
            console.log(nameByteLength);
            console.log(age);
            console.log(gender);
            console.log(address);   
            console.log(hobby);
            console.log(hobby1);
            console.log(hobby2);
            console.log(hobby3);
            console.log(intro);
            console.log(introByteLength);

            if(!regchk(emailReg, email)) {
                $("[name=email]").css("border", "1px solid red");
                $("[name=email]").next().html("이메일 주소를 확인해주세요.");
                return false;
            } else {
                $("[name=email]").css("border", "1px solid #999");
                $("[name=email]").next().html("");
            }
            if(!regchk(pwReg, pw)) {
                $("[name=memberPw]").css("border", "1px solid red");
                $("[name=memberPw]").next().html("대문자, 소문자, 숫자 조합으로 8자 이상 입력해주세요.");
                return false;
            } else {
                $("[name=memberPw]").css("border", "1px solid #999");
                $("[name=memberPw]").next().html("");
            }
            if(!(pw == pw2)) {
                $("[name=memberPw2]").css("border", "1px solid red");
                $("[name=memberPw2]").next().html("비밀번호가 일치하지 않습니다.");
                return false;
            } else {
                $("[name=memberPw2]").css("border", "1px solid #999");
                $("[name=memberPw2]").next().html("");
            }
            if(nameByteLength == 0) {
                $("[name=memberNick]").css("border", "1px solid red");
                $("[name=memberNick]").next().html("이름은 비워둘 수 없습니다");
                return false;
            } else {
                $("[name=memberNick]").css("border", "1px solid #999");
                $("[name=memberNick]").next().html("");
            }
            if(nameByteLength > 40) {
                $("[name=memberNick]").css("border", "1px solid red");
                $("[name=memberNick]").next().html("이름 길이 제한을 초과했습니다");
                return false;
            } else {
                $("[name=memberNick]").css("border", "1px solid #999");
                $("[name=memberNick]").next().html("");
            }
            if(address.length == 0) {
                $("#postcode").css("border", "1px solid red");
                $("#roadAddress").css("border", "1px solid red");
                $("#detailAddress").css("border", "1px solid red");
                $("#detailAddress").next().html("주소를 입력해주세요");
                return false;
            }
            if(introByteLength > 2000) {
                $("[name=intro]").css("border", "1px solid red");
                $("[name=intro]").next().html("길이 제한을 초과했습니다");
                return false;
            } else {
                $("[name=intro]").css("border", "1px solid #999");
                $("[name=intro]").next().html("");
            }
            if(checked < 3) {
            	$(".chkMsg").html("관심분야를 3개 선택해주세요");
            	return false;
            } else {
            	$(".chkMsg").html("");
            }
        }

    </script>
</body>
</html>