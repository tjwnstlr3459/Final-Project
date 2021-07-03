<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>너나들이</title>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/member/mypage.css">
    <!-- JS -->
    <script src="resources/js/member/mypage.js"></script>
    <!-- 우편번호 찾기 -->
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <style>
        
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
                        <div class="alarm">읽지 않은 쪽지 ${unreadDm }건</div>
                        <div class="alarm">친구 요청 ${req }건</div>
                    </div>
                </div>
                <div class="speech-bubble">
                	${m.intro }
                </div>
                
                <div class="infoMenu">
                	<a href="javascript:void(0)" onclick="myFriend()">내 친구</a>
                	<a href="javascript:void(0)" onclick="myDm()">쪽지함</a>
                	<a href="javascript:void(0)" onclick="myReport()">내 문의·신고</a>
                    <a href="javascript:void(0)" onclick="myInfoMod()">회원정보수정</a>
                    <a href="javascript:void(0)" onclick="leaveN()">회원탈퇴</a>  
                </div>
            </div>
            <div class="main">
            	<!-- 친구 화면 -->
                <div class="friendBox">
         			<c:if test="${not empty rfriends }">
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
                	</c:if>
                    <div class="title">
                      	  내 친구
                        <a href="javascript:void(0)" id="findfriend"><i class="fas fa-plus"></i></a>
                    </div>
                    <div class="friends">
                    <c:forEach items="${friends }" var="f">
                    	<div class="friend">
                            <div class="myInfoImg">
                                <img class="profile-img" src="resources/image/userPic/${f.filepath }"/><br>
                            </div>
                            <div style="text-align: center;">
                            	<a href="javascript:void(0)" class="friendName">${f.memberNick }</a>
                            </div>
                        </div>  
                    </c:forEach>
                	</div>
                </div>
                
                <!-- 쪽지 화면 -->
                <div class="dmBox" style="display:none;">
                    <div class="title">
                        	새로 받은 쪽지
                        <a href="javascript:void(0)" id="newDm"><i class="fas fa-plus"></i></a>
                    </div>
                    <div class="dmsList">
                    
                    	<div class="rcvDmsList">
                    		<div class="row column-name">
                    			<div class="dm-sender">유저명</div>
                                <div class="dm-content">내용</div>
                                <div class="dm-date">날짜</div>
                                <div class="dm-reply">답장</div>
                    		</div> 
                    		<c:forEach items="${dmList }" var="dm">
                                <c:if test="${dm.receiver == m.memberNick and dm.readStatus == 'N'}">
	                                <div class="row listRow">
		                    			<div class="dm-sender">${dm.sender }</div>
		                                <div class="dm-content"><span onclick="dmShow(1, ${dm.dmNo}, '${dm.sender}', '${dm.dmContent }')">${dm.dmContent }</span></div>
		                                <div class="dm-date">${dm.dmDate }</div>
		                                <div class="dm-reply"><i class="fas fa-share" style="cursor: pointer;" onclick="sendDm('${dm.sender}', '${m.memberNick }')"></i></div>
	                    			</div>
                                </c:if>
                            </c:forEach>
                    	</div>
                    </div>
                    
                    <div class="title">
                        	내 쪽지
                        <a href="javascript:void(0)" id="newDm"><i class="fas fa-plus"></i></a>
                    </div>
                    <div class="dmsList">
                        
                        <div class="inoutDmsList">
                    		<div class="row column-name">
                    			<div class="dm-sr">구분</div>
                    			<div class="dm-sender">유저명</div>
                                <div class="dm-content-inout">내용</div>
                                <div class="dm-date">날짜</div>
                                <div class="dm-read">읽음</div>
                                <div class="dm-reply">답장</div>
                    		</div> 
                    		<c:forEach items="${dmList }" var="dm">
                            	<c:if test="${not (dm.receiver == m.memberNick and dm.readStatus == 'N')}">
                            		<div class="row listRow">
                            			<c:choose>
                                    		<c:when test="${dm.receiver == m.memberNick}">
                                    			<div class="dm-sr" style="color:red"><i class="fas fa-reply"></i></div>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<div class="dm-sr" style="color:blue"><i class="fas fa-share"></i></div>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<c:choose>
                                    		<c:when test="${dm.receiver == m.memberNick}">
                                    			<div class="dm-sender">${dm.sender }</div>
                                    			<div class="dm-content-inout"><span onclick="dmShow(2, ${dm.dmNo}, '${dm.sender}', '${dm.dmContent }')">${dm.dmContent }</span></div>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<div class="dm-sender">${dm.receiver }</div>
                                    			<div class="dm-content-inout"><span onclick="dmShow(3, ${dm.dmNo}, '${dm.receiver}', '${dm.dmContent }')">${dm.dmContent }</span></div>
                                    		</c:otherwise>
                                    	</c:choose>		                                
		                                <div class="dm-date">${dm.dmDate }</div>
		                                <div class="dm-read">${dm.readStatus }</div>
		                                <c:choose>
                                    		<c:when test="${dm.receiver == m.memberNick}">
                                    			<div class="dm-reply"><i class="fas fa-share" style="cursor: pointer;" onclick="sendDm('${dm.sender}', '${m.memberNick }')"></i></div>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<div class="dm-reply"></div>
                                    		</c:otherwise>
                                    	</c:choose>
	                    			</div>
                               </c:if>                                   
                            </c:forEach>
                    	</div>
                        
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
                <div class="modBox" style="display:none;">
                    <div class="title">
                        	내 정보 수정
                    </div>
                    <span>>>비밀번호 변경 / 회원 탈퇴 시 회원 정보는 모두 삭제되며, 이후 복구가 불가능합니다</span>
                    <div class="pwChange">
                    	<form id="pwChangeFrm" method="post">
                    		<div class="element">
                    			<input type="hidden" name="email" value="${m.email }">
			                    <span class="legend">현재 비밀번호</span>
			                    <input type="password" name="pw">
			                    <span class="inputMsg"></span>
			            	</div>
			            	<div class="element">
			                    <span class="legend">새 비밀번호</span>
			                    <input type="password" name="newPw">
			                    <span class="inputMsg"></span>
			            	</div>
			            	<div class="element">
			                    <span class="legend">새 비밀번호 확인</span>
			                    <input type="password" name="newPw2">
			                    <span class="inputMsg"></span>
			            	</div>
			            	<input type="submit" value="수정" onclick="return pwChangeChk()">
                    	</form>                    	
                    </div>
                    
                    <div class="modInfo">
                        <form action="/modInfo.do" id="joinForm" method="post" enctype="multipart/form-data">
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
			                        <span class="legend">나이</span>
			                        <select name="age">
			                        	<c:choose>
			                        		<c:when test="${m.age == 10}">
			                        			<option value="10" selected>10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30">30대</option>
					                            <option value="40">40대</option>
					                            <option value="50">50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 20}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20" selected>20대</option>
					                            <option value="30">30대</option>
					                            <option value="40">40대</option>
					                            <option value="50">50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 30}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30" selected>30대</option>
					                            <option value="40">40대</option>
					                            <option value="50">50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 40}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30">30대</option>
					                            <option value="40" selected>40대</option>
					                            <option value="50">50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 50}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30">30대</option>
					                            <option value="40">40대</option>
					                            <option value="50" selected>50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 60}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30">30대</option>
					                            <option value="40">40대</option>
					                            <option value="50">50대</option>
					                            <option value="60" selected>60대 이상</option>
					                            <option value="0">선택하지 않음</option>
			                        		</c:when>
			                        		<c:when test="${m.age == 0}">
			                        			<option value="10">10대 이하</option>
					                            <option value="20">20대</option>
					                            <option value="30">30대</option>
					                            <option value="40">40대</option>
					                            <option value="50">50대</option>
					                            <option value="60">60대 이상</option>
					                            <option value="0" selected>선택하지 않음</option>
			                        		</c:when>
			                        	</c:choose>			                            
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
				                        <c:choose>
				                        	<c:when test="${c.cgNo == m.hobby1 or c.cgNo == m.hobby2 or c.cgNo == m.hobby3 }">
				                        		<label><input type="checkbox" name="hobby" value="${c.cgNo }" checked>${c.cgName }</label>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<label><input type="checkbox" name="hobby" value="${c.cgNo }" disabled>${c.cgName }</label>
				                        	</c:otherwise>
				                        </c:choose>						            	
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
			                        <div class="upload">
			                        	<input class="upload-name" value="${m.filename }" disabled>
				                        <label class="imgLabel" for="propimg">업로드</label>	                        
				                        <input type="file" id="propimg" name="propimg" onchange="prevImg(this)">
			                        </div>
			                        <span class="legend">미리보기</span>
			                        <span class="inputMsg"><img id="imgPreview" src="resources/image/userPic/${m.filepath }" width="290px" width="290px"></span>
			                    </div>
			                    <input type="submit" value="수정" onclick="return modCheck()">
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- 친구추가용 모달 -->
    <div class="modalFr">
		<div class="modal-content">
			<div class="modal-header">
				<h2>친구 추가</h2>
			</div>
			<div class="modal-body">
				<div class="modal-input">
					<input type="text" id="findEmail" name="email" placeholder="이메일 주소 혹은 이름을 입력해주세요">
					<button type="button" id="findID" onclick="findID('${m.memberNick}')">회원 검색</button>
				</div>
				<div class="findResult frAdd"></div>
				
				<button type="button" class="modalButton" id="closeModalFr">닫기</button>
			</div>
		</div>	
	</div>
	<!-- 친구요청 수락 모달 -->
	<div class="modalFrReq">
		<div class="modal-content">
			<div class="modal-header">
				<h2>친구 요청</h2>
			</div>
			<div class="modal-body">
				<div class="findResult frReq"></div>
				
				<button type="button" class="modalButton" id="closeModalFrReq">닫기</button>
			</div>
		</div>	
	</div>
	<!-- 쪽지 보내기 모달 -->
	<div class="modalDm">
		<div class="modal-content">
			<div class="modal-header dms">
			</div>
			<div class="modal-body">
				<div>
                	<textarea name="dmContent"></textarea>
				</div>
				<div class="findResult"></div>   
				
				<button type="button" class="modalButton" id="sendDmTo">쪽지 전송</button>
				<button type="button" class="modalButton" id="closeModalDm">닫기</button>
			</div>
		</div>	
	</div>
	<!-- 쪽지 읽기 모달 -->
	<div class="modalDmCont">
		<div class="modal-content">
			<div class="modal-header dmCont">
			</div>
			<div class="modal-body">
				<div class="findResult showDmCont"></div>
				
				<button type="button" class="modalButton" id="closeModalDmCont">닫기</button>
			</div>
		</div>	
	</div>
	<!-- 팝업 레이어  -->
	<div class="popupLayer"></div>
    
    
    <script>
    	var dmSender;
    	var dmReceiver;
    	
    	function reloadP() {
    	    sessionStorage.setItem("reloading", "true");
    	    document.location.reload();
    	}
    	
    	//페이지 로딩시 처리
    	$(function() {
    		var address = "<c:out value='${m.address}'/>";
    		var addressDetail = address.split("/");
    		$("#postcode").val(addressDetail[0]);
    		$("#roadAddress").val(addressDetail[1]);
    		$("#detailAddress").val(addressDetail[2]);
    		
    		var reloading = sessionStorage.getItem("dm");
    		console.log(reloading)
    	    if (sessionStorage.getItem("dm")) {
    	        sessionStorage.removeItem("dm");
    	        myDm();
    	    } else if (sessionStorage.getItem("info")) {
    	    	sessionStorage.removeItem("info");
    	        myInfoMod();
    	    }
    	})
    	
    	//페이지 내 메뉴 이동
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
        function leaveN() {
        	location.href="leave.do";
        }
        
        //?
        function fMenu(obj) {
        	console.log(this)
        	console.log(obj)
        	var nick = obj
        	console.log(nick)
        	var menu = "<div style='width:100px;height:100px;position:absolute'>둥둥</div>";
        	$(this).next(menu);
        }
        
        //친구 추가        
		$("#findfriend").click(function() {
			$(".findResult").html("");
			$(".modalFr").fadeIn();
			$(".modalFr").css("display", "flex");
			
		})
		$("#findEmail").keypress(function(event){
	    	if ( event.which == 13 ) {
	        	$('#findID').click();
	         	return false;
	     	}
		})
		function findID(currUser) {
			var result = $(".findResult");
			var user = $("#findEmail").val();			
			result.html("");	 		
			result.append("<img src='resources/image/ajax-loader.gif'>");
	 		$.ajax({
	 			url: "/user/findUser.do",
                type: "post",
                data: {user:user},
                success: function(data) {
       				result.html("");
                	if(typeof(data) == "object"){
                		result.html('<div class="addUser"><div class="myInfo"><div class="myInfoImg">'
                				+ '<img class="profile-img" src="resources/image/userPic/' + data.filepath + '"/></div>'
                				+ '<div class="myInfoMenu"><div class="myName">' + data.memberNick + '</div></div></div>'
                				+ '<div class="speech-bubble">' + data.intro + '</div></div>');
                		result.append("<button type='button' onclick='addFriend(\"" + currUser + "\", \"" + data.memberNick + "\")'>친구추가</button>");
                		//result.append("<img src='resources/image/userPic/" + data.filepath + "'>");
                		//result.append("<span>" + data.memberNick + " " + data.intro + "</span>");
                		//result.append("<button type='button' onclick='addFriend(\"" + currUser + "\", \"" + data.memberNick + "\")'>친구추가</button>");
	
                	} else{
                		result.html("찾는 회원이 없습니다.");
                	}
                },
                error: function() {
                    console.log("error")
                }

	 		})
	 	}
		function addFriend(sender, receiver) {
			var result = $(".findResult");
			result.html("");
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
                		result.children().last().remove();
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
		$("#closeModalFr").click(function() {
			$(".modalFr").fadeOut();
		})
		
		//새 친구 요청 수락
		function accfMenu(inviter) {
			$(".findResult").html("");
			$(".modalFrReq").fadeIn();
			$(".modalFrReq").css("display", "flex");
			var result = $(".frReq");
			var targetUser = "<c:out value='${m.memberNick}'/>";
			console.log(targetUser);
			$.ajax({
	 			url: "/user/findUser.do",
                type: "post",
                data: {user:inviter},
                success: function(data) {
       				result.html("");
                	if(typeof(data) == "object"){
                		result.html('<div class="addUser"><div class="myInfo"><div class="myInfoImg">'
                				+ '<img class="profile-img" src="resources/image/userPic/' + data.filepath + '"/></div>'
                				+ '<div class="myInfoMenu"><div class="myName">' + data.memberNick + '</div></div></div>'
                				+ '<div class="speech-bubble">' + data.intro + '</div></div>');
                		result.append("<button type='button' onclick='accFriend(\"" + inviter + "\", \"" + targetUser + "\")'>요청 수락</button>");	
                	} else{
                		result.html("<span>에러가 발생했습니다. 다시 시도해주세요.</span>");
                	}
                },
                error: function() {
                    console.log("error")
                }

	 		})
		}
		$("#closeModalFrReq").click(function() {
			$(".modalFrReq").fadeOut();
			location.reload();
		})
		
		//DM
		function sendDm(receiver, sender) {
			$(".popupLayer").hide();
			$(".modalDm").fadeIn();
			$(".modalDm").css("display", "flex");
			$(".dms").html("<h2>" + receiver + "에게 쪽지 보내기</h2>");
			dmReceiver = receiver;
			dmSender = sender;
		}
		$("#sendDmTo").click(function() {
			var dmContent = $("[name=dmContent]").val();
			var result = $(".findResult");
			$.ajax({
	 			url: "/user/sendDm.do",
                type: "post",
                data: {sender:dmSender, receiver:dmReceiver, dmContent:dmContent},
                success: function(data) {
                	console.log(data)
                	if(data == 1) {
                		result.append("<span>쪽지를 보냈습니다.</span>");
            			sessionStorage.setItem("dm", "true");
            			location.reload();
                	} else {
                		result.append("<span>에러가 발생했습니다. 다시 시도해주세요.</span>");
                	}
                },
                error: function() {
                    console.log("error")
                }
        	})			
		})
		$("#closeModalDm").click(function() {
			$(".modalDm").fadeOut();
		})
		function dmShow(flag, dmNo, user) {
			$(".modalDmCont").fadeIn();
			$(".modalDmCont").css("display", "flex");
			$(".showDmCont").css("margin-bottom", "30px")
			$.ajax({
				url: "/user/selectDm.do",
				type: "post",
				data: {dmNo:dmNo},
				success: function(data) {
					$(".showDmCont").html(data.dmContent);				
				},
				error: function() {
					console.log("first ajax: error");
				}
			})
			if(flag == 1 || flag == 2) {
				$(".dmCont").html("<h2>" + user + "의 쪽지</h2>");
				if(flag == 1) {
					$.ajax({
						url: "/user/updateDm.do",
						type: "post",
						data: {dmNo:dmNo},
						success: function(data) {
							$("#closeModalDmCont").attr("onclick", "reloadDm()");
						},
						error: function() {
							console.log("error");
						}
					})
				}				
			} else { 
				$(".dmCont").html("<h2>" + user + "에게 보낸 쪽지</h2>");
			}
			
		}
		$("#closeModalDmCont").click(function() {
			$(".modalDmCont").fadeOut();
		})
		function reloadDm() {
			sessionStorage.setItem("dm", "true");
			location.reload();
		}	

		
		
		//친구 메뉴
		$(".friendName").click(function(e) {
			var targetUser = $(this).text();
			//
			dmReceiver = $(this).text();
			
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;

			var oWidth = $('.popupLayer').width();
			var oHeight = $('.popupLayer').height();

			// 레이어가 나타날 위치를 셋팅한다.
			var divLeft = e.clientX + 10;
			var divTop = e.clientY + 5;

			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치.
			if( divLeft < 0 ) divLeft = 0;
			if( divTop < 0 ) divTop = 0;
			
			var popup = $(".popupLayer");
			popup.empty();
			var sendUser = "<c:out value='${m.memberNick}'/>";
			//
			dmSender = "<c:out value='${m.memberNick}'/>";
			
			var dm = "<span class='fMenu' onclick='sendDm(\"" + dmReceiver + "\", \"" + dmSender + "\")'>쪽지 보내기</span>";
			var chat = "<span class='fMenu'>채팅 요청하기</span>";
			var close = "<span class='fMenu' onclick='closeLayer(this)'>닫기</span>";
			popup.append(dm);
			popup.append(chat);
			popup.append(close);
			
			$(".popupLayer").css({
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();
		})
		
		function closeLayer(obj) {
			$(obj).parent().hide();
		}
		
		
		//주소 찾기
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
    	
		//회원정보 수정용 유효성 체크		
		$("[name=memberNick]").change(function() {
			var userName = "<c:out value='${m.memberNick}'/>";
			console.log(userName);
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
					if(data == "1" && name != userName) {
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
        
        function modCheck() {
            var name = $("[name=memberNick]").val();
            var nameByteLength = name.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
            var namechk = $("#namechk");
            var age = $("[name=age]").val();
            var gender = $("[name=gender]:checked").val();
            var address = $("#postcode").val() + "/" + $("#roadAddress").val() + "/" + $("#detailAddress").val();
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
            var filename = "<c:out value='${m.filename}'/>";
            var filepath = "<c:out value='${m.filepath}'/>";

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
            
            event.preventDefault();
            var form = $('#joinForm');
            console.log(form)
            form.prepend("<input type='hidden' name='address' value='" + address + "'>");
            form.prepend("<input type='hidden' name='filename' value='" + filename + "'>");
            form.prepend("<input type='hidden' name='filepath' value='" + filepath + "'>");
            form.prepend("<input type='hidden' name='hobby1' value='" + hobby1 + "'>");
            form.prepend("<input type='hidden' name='hobby2' value='" + hobby2 + "'>");
            form.prepend("<input type='hidden' name='hobby3' value='" + hobby3 + "'>");
            var data = new FormData(form[0]);
            
            $.ajax({
            	url: "/modInfo.do",
            	enctype: "multipart/form-data",
            	type: "post",
            	data: data,
            	contentType: false,
            	processData: false,
            	success: function(data) {
            		if(data == 1) {
            			sessionStorage.setItem("info", "true");
            			location.reload();
            		}
            	}           
            })       
            
            
        }
	</script>
    
</body>
</html>