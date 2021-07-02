<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="resources/css/join.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <style>

    </style>
</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
    <div class="container">
        <h2>회원가입</h2>          	
        <div class="join">
            <form id="joinForm" action="/joinProcessing.do" method="post" enctype="multipart/form-data">
                <div class="element">
                    <span class="legend">이메일</span>
                    <input type="email" name="email" value="${member.email }" readonly>
                    <span class="inputMsg"></span>
                </div>
                <input type="hidden" name="memberPw" value="${member.memberPw }">
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
                        <div class="upload">
                        	<input class="upload-name" value="파일선택" disabled>
	                        <label class="imgLabel" for="propimg">업로드</label>	                        
	                        <input type="file" id="propimg" name="propimg" onchange="prevImg(this)">
                        </div>
                        <span class="legend">미리보기</span>
                        <span class="inputMsg"><img id="imgPreview" width="290px"></span>
                    </div>
                    
					<input type="hidden" name="joinMethod" value="2">
					
                    <input type="submit" value="회원 가입" onclick="return joinCheck()">

            </form>     
        </div>
    </div> 
    <%@ include file = "/WEB-INF/views/common/footer.jsp" %>  
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
	    
	  	//이미지 미리보기
    	function prevImg(f) {
			if(f.files.length != 0) { 
				var reader = new FileReader(); 
				reader.readAsDataURL(f.files[0]);
				reader.onload = function(e) {
					$("#imgPreview").attr("src", e.target.result);					
				}
			} else {
				$("#imgPreview").attr("src", "");
			}
		}
    	
    	//파일명 표시
    	$("#propimg").change(function() {
    		var filename = $("#propimg").val().split('/').pop().split('\\').pop();
    		$(".upload-name").val(filename);
    	})

    	
    	//유효성 체크
        function regchk(regexp, val) {
            if(regexp.test(val)) {
                return true;
            } else {
                return false;
            }
        }
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
            var pwReg = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,30}/
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