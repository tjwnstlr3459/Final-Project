<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/join.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- 우편번호 찾기 -->
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 구글 로그인 -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="965050692705-1e3ko23t1g8v9ota8ugu8eigm3c0f076.apps.googleusercontent.com">
    <!-- 암호화 스크립트 -->
    <script type="text/javascript" src="/resources/js/core.min.js"></script>
	<script type="text/javascript" src="/resources/js/sha256.min.js"></script>
    <!-- 
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>    
     -->
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <div class="container">
        <h2>회원가입</h2>          	
        <div class="join">
            <form id="joinForm" action="/joinProcessing.do" method="post" enctype="multipart/form-data">
                <div class="element">
                    <span class="legend">이메일</span>
                    <input type="email" name="email" placeholder="이메일">
                    <span class="inputMsg"></span>
                </div>
                <formgroup id="restForm">
                    <div class="element">
                        <span class="legend">비밀번호</span>
                        <input type="password" name="memberPw" placeholder="영문, 숫자 포함 8자 이상 30자 이내">
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
                        <span id="namechk" class="inputMsg"></span>
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
                        <input type="text" id="postcode" placeholder="우편번호" readonly><input type="button" id="findCode" onclick="findPCode()" value="우편번호 찾기"><br>
                        <input type="text" id="roadAddress" placeholder="도로명주소" readonly>
                        <span id="guide" style="color:#999;display:none"></span>
                        <input type="text" id="detailAddress" placeholder="상세주소">
                        <span class="inputMsg"></span>
                    </div>

                    <div class="elementChk">
                        <span class="legend">관심분야(3개 선택)</span>
                        <c:forEach items="${category }" var="c">
			            	<label><input type="checkbox" name="hobby" value="${c.cgNo }">${c.cgName }</label>
			            </c:forEach>
                        <span class="chkMsg"></span>
                    </div>

                    <div class="element">
                        <span class="legend">자기소개(600자 이내)</span>
                        <textarea name="intro">자기소개</textarea>
                        <span class="inputMsg"></span>
                    </div>

                    <div class="element">
                        <span class="legend">프로필 사진</span>
                        <input type="file" name="propimg">
                        <span class="inputMsg"></span>
                    </div>
					<input type="hidden" name="joinMethod" value="1">
                    <input type="submit" value="회원 가입" onclick="return joinCheck()">
                </formgroup>
                
                <button type="button" id="mailCfrm">이메일 체크</button>

            </form>
            <form id="gLogin" method="post">
            
            </form> 
            
            <div class="social">
                <span>소셜 서비스로 가입</span>
                <a href="#">구글 로그인</a>
                <a href="#">카카오 로그인</a>
                <a href="${nUrl}">네이버 로그인</a>
                <div id="naver_id_login"></div>
                <a id="kakao-login-btn"></a>
                <div class="g-signin2" data-onsuccess="onSignIn"></div>
            </div>           
        </div>
    </div> 
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>  
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("QqHxZVXS15sYfRiy7g5M", "http://127.0.0.1/view/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 3,65);
	  	naver_id_login.setDomain("http://127.0.0.1");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	 </script>
	 <script>
	 	Kakao.init('b0e4792bb9bc14ffbeebc4cac841f141'); //발급받은 키 중 javascript키를 사용해준다.
	 	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	 	Kakao.Auth.createLoginButton({
	 	    container: '#kakao-login-btn',
	 	    success: kakaoLogin()
	 	  })
	 	  function kakaoLogin() {
		    Kakao.Auth.login({
		      success: function (response) {
		        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function (response) {
		        	  console.log(response)
		          },
		          fail: function (error) {
		            console.log(error)
		          },
		        })
		      },
		      fail: function (error) {
		        console.log(error)
		      },
		    })
		  }
	 </script>
	 <script>
		function onSignIn(googleUser) {
			  var profile = googleUser.getBasicProfile();
			  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
			  console.log('Name: ' + profile.getName());
			  console.log('Image URL: ' + profile.getImageUrl());
			  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
			  var email = profile.getEmail();
			  var form = $("#gLogin");
			  var shaPw = CryptoJS.SHA256(profile.getId()).toString(); 
			  $.ajax({
		  			url: "/nLogin.do",
		  			data: {email:email},
		  			type: "post",
		  			success: function(data) {
		  				if(data == "1" || data == "2") {
		  					alert("이미 가입된 아이디입니다. 로그인 화면으로 이동합니다.")
		  					form.attr("action", "/login.do");
		  					form.submit();
		  				} else {
		  					form.attr("action", "/socialJoin.do");
		  					var inputmail = "<input type='hidden' name='email' value='" + email + "'>";
		  					var inputpw = "<input type='hidden' name='memberPw' value='" + shaPw + "'>";
		  					form.append(inputmail);
		  					form.append(inputpw);
		  					form.submit();
		  				}
		  			},
		  			error: function() {
		  				console.log("에러")
		  			}
		  		})
		}
	 </script>
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
                $("[name=email]").next().html("<img src='resources/image/ajax-loader.gif'>");
            	$.ajax({
                    url: "/user/chkEmail.do",
                    type: "post",
                    data: {email:email},
                    success: function(data) {
    					if(data == "1" || data == "2") {
    						$("[name=email]").next().html("");
    						$("[name=email]").next().html("이미 가입된 이메일입니다");
    					}
    					else {
    						$("[name=email]").next().html("");
                            $("#restForm").slideDown(800);
                            $("#mailCfrm").hide();

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
            var pwReg = /(?=.*\d)(?=.*[a-zA-Z]).{8,30}/
            if(pwReg.test(pw)) {
                $(this).next().html("");
            } else {
                $(this).next().html("영문과 숫자 조합으로 8자 이상");
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
						$("[name=memberNick]").next().html("중복된 이름은 사용할 수 없습니다.");
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
            var pwReg = /(?=.*\d)(?=.*[a-zA-Z]).{8,30}/
            var pw2 = $("[name=memberPw2]").val();
            var name = $("[name=memberNick]").val();
            var nameByteLength = name.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            var namechk = $("#namechk");
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
                $("[name=memberPw]").next().html("영문과 숫자 조합으로 8자 이상 입력해주세요.");
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
            if(namechk.html() == "중복된 이름은 사용할 수 없습니다.") {
            	$("[name=memberNick]").css("border", "1px solid red");
            	return false;
            } else {
            	$("[name=memberNick]").css("border", "1px solid #999");
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
            if(address == "  ") {
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
            $("#joinForm").prepend("<input type='hidden' name='address' value='" + address + "'>'");
            
        }

    </script>
</body>
</html>