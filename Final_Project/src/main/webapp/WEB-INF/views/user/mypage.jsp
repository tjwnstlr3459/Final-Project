<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <style>
        /* div {
            border: 1px solid black;
        } */
        .container {
            margin-top:30px;
            width: 500px;
        }
        a {
            text-decoration: none;
        }
        input, textarea {
			width: 300px;
			height: 35px;
			padding: 5px;
			box-sizing: border-box;
		}
		#mailCfrm, input[type=submit], #closeModal {
			width: 300px;
			height: 35px;
			color: white;
			font-weight: bold;
			background-color: #ec523f;
			border: 0;
		}
		.legend {
			display: inline-block;
			width: 100%;
			text-align: left;
			font-weight: bold;
			padding-left: 5px;
			font-size: 0.8em;
		}
		input[type=radio] {
			display: none;
		}
		
		input[type=radio]+label {
			display: inline-block;
			box-sizing: border-box;
			height: 35px;
			width: 96px;
			border: 1px solid #aaa;
			line-height: 35px;
			text-align: center;
			font-weight: bold;
			font-size: 13px;
		}
		
		input[type=radio]:checked+label {
			background-color: #333;
			color: #fff;
		}
		#postcode {
			float: left;
			width: 61%;
			margin-bottom: 5px;
		}
		
		#findCode {
			float: right;
			width: 38%;
		}
		
		#roadAddress {
			margin-bottom: 5px;
		}
		textarea {
			height: 100px;
			resize: none;
		}
		
		input:focus, textarea:focus {
			outline: none;
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
		
        .mypage {
            display: flex;
            align-items: flex-start;
        }
        .myInfo {
            display: flex;
            align-items: center;
        }
        .myInfoImg {
            width: 70px;
            height: 70px;
            border-radius: 70%;
            overflow: hidden;
        }        
        .profile-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .myInfoMenu {
            height: 70px;
            margin-left: 10px;
        }
        /* .myInfoMenu > div {
            line-height: 35px;
            height: 50%;
        } */
        .myName {
            margin-left: 5px;
            font-size: 1.2em;
            font-weight: bolder;
        }
        .infoMenu {
            font-size: 0.9em;
        }
        .infoMenu > a {
            color: black;
            display: block;
            padding: 6px;
        }
        .infoMenu > a:hover {
            display: block;
            padding: 6px;
            text-decoration: underline;
        }
        .main {
            margin-left: 50px;
        }
        .title {
            height: 35px;
            line-height: 35px;
            font-size: 1.2em;
            font-weight: bolder;
            margin-bottom: 20px;
        }
        .friends {
            display: flex;
            flex-wrap: wrap;
            width: 450px;
            justify-content: space-between;
        }
        .friend {
        	margin-right: 20px;
        	width: 70px;
        }

        .speech-bubble {
            position: relative;
            margin-top: 10px;
            background: #909090;
            border-radius: .6em;
            padding: 15px;
            width: 240px;
            box-sizing: border-box;
        }

        .speech-bubble:after {
            content: '';
            position: absolute;
            top: 0;
            left:9%;
            width: 30;
            height: 30;
            border: 0.6em solid transparent;
            border-bottom-color: #909090;
            border-top: 0;
            margin-left: -0.6m;
            margin-top: -0.6em;
        }
        .modal {
            position: fixed;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
            top: 0;
            left: 0;
            display: none;
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            width: 400px;
            height: auto;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            text-align: center;
        }

        .modal-header {
            width: 100%;
            height: 60px;
            border-bottom: 4px solid #ffcdc7;
            margin-bottom: 20px;
        }

        .modal-body {
            margin-bottom:30px;
        }

        .modal-input {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #findEmail {
            width: 230px;
        }

        #findID {
            background-color: white;
            border: 1px solid #ec523f;
            color: black;
            width: 60px;
            height: 35px;
        }
        .findResult {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 0.9em;
        }
    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
 <%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="container">
        <div class="mypage">
            <div class="my">
                <div class="myInfo">
                    <div class="myInfoImg">
                        <img class="profile-img" src="resources/image/userPic/${m.filepath }"/>
                    </div>
                    <div class="myInfoMenu">
                        <div class="myName">
                      		${m.memberNick }
                        </div>
                        <div>읽지 않은 쪽지 ${unreadDm }건</div>
                        <div>친구 요청 ${req }건</div>
                    </div>
                </div>
                <div class="speech-bubble">
                	${m.intro }
                </div>
                
                <div class="infoMenu">
                    <a href="javascript:void(0)" onclick="myInfoMod()">회원정보수정</a>
                    <a href="javascript:void(0)" onclick="myDm()">쪽지함</a>
                    <a href="javascript:void(0)" onclick="myFriend()">내 친구</a>
                    <a href="javascript:void(0)" onclick="myReport()">문의/신고 내역</a>
                </div>
            </div>
            <div class="main">
            	<!-- 친구 화면 -->
                <div class="friendBox">
                    <div class="title">
                        	새 친구 요청
                    </div>
                    <div class="friends">
                    <c:forEach items="${rfriends }" var="rf">
                    	<div class="friend">
                            <div class="myInfoImg">
                                <img class="profile-img" src="resources/image/userPic/${rf.filepath }"/><br>
                            </div>
                            <div style="text-align: center;">
                            	<a href="javascript:void(0)" onclick="accfMenu('${rf.memberNick }')">${rf.memberNick }</a>
                            </div>
                        </div>  
                    </c:forEach>
                	</div>
                    <div class="title">
                      	  내 친구
                        <a href="javascript:void(0)" id="find"><i class="fas fa-plus"></i></a>
                    </div>
                    <div class="friends">
                    <c:forEach items="${friends }" var="f">
                    	<div class="friend">
                            <div class="myInfoImg">
                                <img class="profile-img" src="resources/image/userPic/${f.filepath }"/><br>
                            </div>
                            <div style="text-align: center;">
                            	<a href="javascript:void(0)" onclick="fMenu('${f.memberNick }')">${f.memberNick }</a>
                            </div>
                        </div>  
                    </c:forEach>
                	</div>
                </div>
                
                <!-- 쪽지 화면 -->
                <div class="dmBox" style="display:none;">
                    <div class="title">
                        	새 쪽지
                        <a href="#">+</a>
                    </div>
                    <div class="dms">
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>이름</th>
                                <th>내용</th>
                                <th>날짜</th>
                                <th>읽음</th>
                            </tr>
                            <c:forEach items="${dmList }" var="dm">
                                    <c:if test="${dm.receiver == m.memberNick and dm.readStatus == 'N'}">
                                    <tr>
		                                <td><i class="fas fa-share"></i></td>
		                                <td>${dm.sender }</td>
		                                <td>${dm.dmContent }</td>
		                                <td>${dm.dmDate }</td>
		                                <td>${dm.readStatus }</td>
		                            </tr>
                                    </c:if>
                            </c:forEach>
                        </table>
                        
                        <table>
                            <tr>
                                <th>구분</th>
                                <th>이름</th>
                                <th>내용</th>
                                <th>날짜</th>
                                <th>읽음</th>
                            </tr>
                            <c:forEach items="${dmList }" var="dm">
                            	<c:if test="${not (dm.receiver == m.memberNick and dm.readStatus == 'N')}">
                                    <tr>
                                    	<c:choose>
                                    		<c:when test="${dm.receiver == m.memberNick}">
                                    			<td><i class="fas fa-reply"></i></td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td><i class="fas fa-share"></i></td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<c:choose>
                                    		<c:when test="${dm.receiver == m.memberNick}">
                                    			<td>${dm.sender }</td>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<td>${dm.receiver }</td>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<td>${dm.dmContent }</td>
		                                <td>${dm.dmDate }</td>
		                                <td>${dm.readStatus }</td>
		                            </tr>
                               </c:if>                                   
                            </c:forEach>
                        </table>
                    </div>
                    
                </div>
                
                <!-- 문의/신고 화면 -->
                <div class="reportBox"  style="display:none;">
                    <div class="title">
                        내 문의/신고
                        <a href="#">+</a>
                    </div>
                    <div class="reports">

                    </div>
                    
                </div>
                
                <!-- 회원정보수정 화면 -->
                <div class="modBox"  style="display:none;">
                    <div class="title">
                        	내 정보 수정
                    </div>
                    <div class="modInfo">
                        <form action="/modInfo.do" method="post" method="post" enctype="multipart/form-data">
			                <div class="element">
			                    <span class="legend">이메일</span>
			                    <input type="email" name="email" value="${m.email }" readonly>
			                    <span class="inputMsg"></span>
			                </div>
			                    <div class="element">
			                        <span class="legend">이름(닉네임)</span>
			                        <input type="text" name="memberNick" value="${m.memberNick }">
			                        <span id="namechk" class="inputMsg"></span>
			                    </div>
			
			                    <div class="element">
			                        <span class="legend">나이--수정하기</span>
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
			                        <c:choose>
			                        	<c:when test="${m.gender == 'M' }">
			                        		<input type="radio" id="M" name="gender" value="M" checked><label for="M">남자</label>
					                        <input type="radio" id="F" name="gender" value="F"><label for="F">여자</label>
					                        <input type="radio" id="N" name="gender" value="N"><label for="N">선택하지 않음</label>
			                        	</c:when>
			                        	<c:when test="${m.gender == 'F' }">
			                        		<input type="radio" id="M" name="gender" value="M"><label for="M">남자</label>
					                        <input type="radio" id="F" name="gender" value="F" checked><label for="F">여자</label>
					                        <input type="radio" id="N" name="gender" value="N"><label for="N">선택하지 않음</label>
			                        	</c:when>
			                        	<c:otherwise>
			                        		<input type="radio" id="M" name="gender" value="M"><label for="M">남자</label>
					                        <input type="radio" id="F" name="gender" value="F"><label for="F">여자</label>
					                        <input type="radio" id="N" name="gender" value="N" checked><label for="N">선택하지 않음</label>
			                        	</c:otherwise>
			                        </c:choose>
			                        
			                        <span class="inputMsg"></span>
			                    </div>
			                    
			                    <div class="element">
			                        <span class="legend">주소--수정하기</span>
			                        <input type="text" id="postcode" placeholder="우편번호" readonly><input type="button" id="findCode" onclick="findPCode()" value="우편번호 찾기"><br>
			                        <input type="text" id="roadAddress" placeholder="도로명주소" readonly>
			                        <span id="guide" style="color:#999;display:none"></span>
			                        <input type="text" id="detailAddress" placeholder="상세주소">
			                        <span class="inputMsg"></span>
			                    </div>
			
			                    <div class="elementChk">
			                        <span class="legend">관심분야(3개 선택)--수정하기</span>
			                        <c:forEach items="${category }" var="c">
						            	<label><input type="checkbox" name="hobby" value="${c.cgNo }">${c.cgName }</label>
						            </c:forEach>
			                        <span class="chkMsg"></span>
			                    </div>
			
			                    <div class="element">
			                        <span class="legend">자기소개(600자 이내)</span>
			                        <textarea name="intro">${m.intro}</textarea>
			                        <span class="inputMsg"></span>
			                    </div>
			
			                    <div class="element">
			                        <span class="legend">프로필 사진</span>
			                        <input type="file" name="propimg">
			                        <span class="inputMsg"></span>
			                    </div>
			                    <input type="submit" value="수정" onclick="return modCheck()">
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>친구 추가</h2>
			</div>
			<div class="modal-body">
				<div class="modal-input">
					<input type="text" id="finduser" name="email" placeholder="이메일 주소 혹은 이름을 입력해주세요">
					<button type="button" onclick="findID('${m.memberNick}')">회원 검색</button>
				</div>
				<div class="findResult"></div>
				
				<button type="button" id="closeModal">닫기</button>
			</div>
		</div>	
	</div>
    
    
    <script>
        function myFriend() {
            $(".friendBox").show();
            $(".dmBox").hide();
            $(".reportBox").hide();
            $(".modBox").hide();
        }
        function myReport() {
            $(".friendBox").hide();
            $(".dmBox").hide();
            $(".reportBox").show();
            $(".modBox").hide();
        }
        function myInfoMod() {
            $(".friendBox").hide();
            $(".dmBox").hide();
            $(".reportBox").hide();
            $(".modBox").show();
        }
        function myDm() {
            $(".friendBox").hide();
            $(".dmBox").show();
            $(".reportBox").hide();
            $(".modBox").hide();
        }
        function fMenu(obj) {
        	console.log(this)
        	console.log(obj)
        	var nick = obj
        	console.log(nick)
        	var menu = "<div style='width:100px;height:100px;position:absolute'>둥둥</div>";
        	$(this).next(menu);
        }
		function addFriend(sender, receiver) {
			var result = $(".findResult");
			$.ajax({
	 			url: "/user/addFriend.do",
                type: "post",
                data: {sender:sender, receiver:receiver},
                success: function(data) {
                	console.log(data)
                	if(data == 0) {
                		result.append("<span>이미 친구입니다.</span>");
                	} else if(data == 1) {
                		result.append("<span>친구 요청 수락을 기다리는 중입니다.</span>");
                	} else if(data == 2) {
                		result.append("<span>친구 요청이 들어와 있습니다. 수락하시겠습니까?</span>");
                		result.append("<button type='button' onclick='accFriend(\"" + receiver + "\", \"" + sender + "\")'>요청 수락</button>")
                	} else if(data == 3) {
                		result.append("<span>요청 성공!</span>");
                	} else {
                		result.append("에러가 발생했습니다. 다시 시도해주세요.");
                	}
                },
                error: function() {
                    console.log("error")
                }
        	})
		}
		function accFriend(sender, receiver) {
			var result = $(".findResult");
			$.ajax({
	 			url: "/user/accFriend.do",
                type: "post",
                data: {sender:sender, receiver:receiver},
                success: function(data) {
                	console.log(data)
                	if(data == 1) {
                		result.append("<span>친구 요청을 수락했습니다.</span>");
                	} else {
                		result.append("<span>에러가 발생했습니다. 다시 시도해주세요.</span>");
                	}
                },
                error: function() {
                    console.log("error")
                }
        	})
		}
		$("#find").click(function() {
			$(".modal").fadeIn();
			$(".modal").css("display", "flex");
			
		})
		$("#findEmail").keypress(function(event){
	    	if ( event.which == 13 ) {
	        	$('#findID').click();
	         	return false;
	     	}
		})
		$("#closeModal").click(function() {
			$(".modal").fadeOut();
		})
	 	function findID(currUser) {
			console.log(currUser)
	 		var user = $("#finduser").val();
			var result = $(".findResult");
	 		$.ajax({
	 			url: "/user/findUser.do",
                type: "post",
                data: {user:user},
                success: function(data) {
       				result.html("");
                	if(typeof(data) == "object"){
                		console.log("2" + data.memberNick);
                		result.append("<img src='resources/image/userPic/" + data.filepath + "'>");
                		result.append("<span>" + data.memberNick + " " + data.intro + "</span>");
                		result.append("<button type='button' onclick='addFriend(\"" + currUser + "\", \"" + data.memberNick + "\")'>친구추가</button>");
                		
                	} else{
                		result.html("찾는 회원이 없습니다.");
                	}
                },
                error: function() {
                    console.log("error")
                }

	 		})
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
	</script>
    
</body>
</html>