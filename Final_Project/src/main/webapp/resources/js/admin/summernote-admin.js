$(function(){
//여기 아래 부분
	 $('.summernote').summernote({		//모든 textarea에 클래스로 서머노트 적용
	 	   width: 500,
	 	   minWidth:500,
	 	   maxWidth:500,
	       height: 300,                 // 에디터 높이
	       minHeight: null,             // 최소 높이
	       maxHeight: null,             // 최대 높이
	       focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	       lang: "ko-KR",					// 한글 설정
	       placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
	       toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			//콜백함수
			callbacks: {
			    onImageUpload: function(files, editor, welEditable) {
		            for(var i = files.length - 1; i >= 0; i--) {
		            	sendFile(files[i], this);
		            }
			    }
			}              
	 });
	 $('#cgNo').change(function(){
	 	console.log($(this).val());
	 });
	 //경고 버튼 클릭 시 
	 $('.warningBtn').click(function(){
	 	$('[name=type]').val('one');
	 	$('#modalForm').attr('action','/insertDm.do');		//form의 action 경로 설정
	 	var memberNick = $(this).parent().parent().children().eq(3).html();		//memberNick 가져옴
	 	$('.titleHead').html('경고 사유');							//모달 타이틀 설정
	 	$('#summernote').attr('name','dmContent');			//요소 name을 설정
	 	$('[name=receiver]').val(memberNick);				//받는사람 설정
	 	
	 	$('[name=clubNo]').val($(this).val());
	 	modalOpen();
	 });
	 //제재 버튼 클릭 시
	 $('.restBtn').click(function(){
		$('[name=type]').val('one');
	 	$('#cgNo').css('display','block');						//select 보이기 설정
	 	$('#modalForm').attr('action','/insertRest.do');		//form의 action 경로 설정
	 	$('.titleHead').html('제재 사유');							//모달 타이틀 설정
	 	var restEmail = $(this).parent().parent().children().eq(2).html();		//memberNick 가져옴
	 	$('[name=restEmail]').val(restEmail);					//받는 회원 이메일 설정
	 	$('#summernote').attr('name','restContent');			//요소 name 설정
	 	modalOpen();
	 });
	 //모달 'x'버튼 클릭 시
	 $('.cancelBtn').click(function(){
	 	modalClose();
	 });
	 //전체 선택
	 $('#allCheck').click(function(){
	 	var chk = $(this).is(':checked');
	 	$('[type=checkbox').attr('checked',chk);
	 });
	 //선택 메시지 발송 클릭 시
	 $('#selectMessageBtn').click(function(){
	 	$('.titleHead').html('메시지');
	 });
	 //관리자 등록 클릭 시
	 $('#upgradeBtn').click(function(){
	 	var arr = new Array();
	 	$('.checks:checked').each(function(i){
	 		arr.push($(this).val());
	 	});
	 	var obj = {
	 		memberNo : arr
	 	}
	 	//최소 1명 이상은 체크가 되어야 됨
		if(arr.length > 0 && confirm('관리자로 등록하시겠습니까?')){
		 	$.ajax({
		 		url : "/updateGrade.do",
		 		dataType    :   "json",
	            contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
	            type        :   "post",
		 		data : obj,
		 		success : function(data){
		 			if(data=="1"){
		 				alert('관리자로 등록되었습니다');
		 			}else{
		 				alert('적용 실패! 다시 시도해주세요');
		 			}
		 			window.location.reload();
		 		}
		 	});
		 }
	 	
	 });
	 //선택된 회원 쪽지 발송
	 $('#selectMessageBtn').click(function(){
	 	$('[name=type]').val('multi');
	 	$('#modalForm').attr('action','/insertDm.do');			//form의 action 경로 설정
	 	var memberNick = $(this).parent().parent().children().eq(3).html();		//memberNick 가져옴
	 	console.log(memberNick);
	 	$('.titleHead').html('메시지');							//모달 타이틀 설정
	 	$('#summernote').attr('name','dmContent');				//요소 name을 설정
	 	$('[name=receiver]').val(memberNick);					//받는사람 설정
	 	modalOpen();
	 });
	 //회원 목록에서 확인 버튼 클릭 시 값에 따라 다르게 동작할 이벤트
	 $('.enterBtn').click(function(){
	 	if($('#summernote').summernote('code') == '') return alert('내용을 적어주세요');
	 	
	 	var checkType = $('[name=type]').val();
	 	if(checkType == 'one'){
		 	$('#modalForm').submit();
	 	}else if(checkType == 'multi'){
	 		if($('.checks:checked').length == 0) return alert('선택한 회원이 없습니다. 회원을 선택하고 다시 시도해주세요');
	 		insertMultiDm();
	 	}
	 });
	 //클럽 목록에서 확인 버튼 클릭 시 함수
	 $('.clubEnterBtn').click(function(){
	 	if($('#summernote').summernote('code') == '') return alert('내용을 적어주세요');
	 	document.getElementById('modalForm').submit();
	 	
	 });
	 //삭제 버튼 클릭 이벤트 함수
	 $('.deleteBtn').click(function(){
	 	if(confirm('정말 삭제하시겠습니까?')){
	 		if($('[name=kind]').val() == "member"){
	 			var memberNo = $(this).parent().parent().find('input').val();
		 		deleteMember(memberNo);
	 		}else if($('[name=kind]').val() == "club"){
	 		console.log('club Test');
	 			deleteClub($(this).val());
	 		}
	 	}
	 });
	 //이용제한 해제 버튼 클릭 이벤트 함슈
	 $('.restOffBtn').click(function(){
	 	if(confirm('제한을 해제하시겠습니까?')){
		 	var restMail = $(this).parent().parent().children().eq(1).html();
		 	deleteRestMember(restMail);
	 	}
	 });
	 //답변 확인 버튼 클릭 시
	 $('.answerBtn').click(function(){
	 	console.log($('[name=abNo]').val());
	 	console.log($('[name=anWriter]').val());
	 	if($('#summernote').summernote('code') == '') return alert('내용을 입력해주세요.');
	 	$('#answerForm').submit();
	 });
	 //답변 수정 클릭 시
	 $('.modifyBtn').click(function(){
	 	$('.summernote').summernote('code',$('.answerContent').html());
	 	$('.answer-table>tbody td').css('background-color','transparent');
	 	$('.answerContent').hide();
	 	$('.modifyAnswer-box').show();
	 });
	 //답변 수정 취소 클릭 시
	 $('.canBtn').click(function(){
	 $('.answer-table>tbody td').css('background-color','#2e2d31');
	 	$('.summernote').summernote('code','');
	 	$('.answerContent').show();
	 	$('.modifyAnswer-box').hide();
	 });

});

//==========================================================================================
function sendFile(file, el) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/imageUpload.do",
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		success : function(data) {
			$(el).summernote('editor.insertImage', data.url);
		}
	});
}
//모달 오픈 함수
function modalOpen(){
	$(".modal").css('display','flex');
	$('.summernote').summernote('code','');
}
//모달 클로즈 함수
function modalClose(){
	$('.modal').css('display','none');
	$('#cgNo').css('display','none');
	$('.summernote').summernote('code','');
	$('.answer-box').hide();
	$('.slideAnswerBtn').attr('disabled',false);
	$('.answer-wrap').hide();
}
//다중 선택된 회원 쪽지 보내기
function insertMultiDm(){
	var checkMemberNo = $('.checks:checked');
	var arr = new Array();										//선택된 회원 번호 : 받는이
 	$('.checks:checked').each(function(i){
 		arr.push($(this).val());
 	});
 	var sender = $('[name=sender]').val();						//보낸이
 	var dmContent = $('#summernote').summernote('code');		//내용
	
	$.ajax({
		url : "/insertMultiDm.do",
		dataType    :   "json",
        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
        type        :   "post",
 		data : {sender : sender, dmContent : dmContent, memberNo : arr},
 		success : function(data){
 			if(data == 1){
 				alert('메시지 전송이 완료되었습니다');
 			}else{
 				alert('메시지 전송 오류! 다시 시도해주세요');
 			}
 			window.location.reload();
 		}
	});
}
function deleteMember(memberNo){
	$.ajax({
		url : "/deleteMember.do",
		data : {memberNo : memberNo},
		type : "post",
		success : function(data){
			if(data == 1){
				alert('처리되었습니다');
			}else{
				alert('삭제 오류! 다시 시도해주세요');
			}
			window.location.reload();
		}
	});
}
function deleteRestMember(restEmail){
	$.ajax({
		url : "/deleteRestMember.do",
		data : {restEmail : restEmail},
		type : "post",
		success : function(data){
			if(data == 1){
				alert('처리되었습니다.');
			}else{
				alert('처리 오류! 다시 시도해주세요');
			}
			window.location.reload();
		}
	});
}
//클럽 삭제
function deleteClub(clubNo){
console.log('test...');
	$.ajax({
		url : "/deleteClub.do",
		data : {clubNo : clubNo},
		type : "post",
		success : function(data){
			if(data == 1){
				alert('폐지되었습니다.');
			}else{
				alert('삭제 오류! 다시 시도해주세요');
			}
			window.location.reload();
		}
	});
}
//문의/신고 제목 클릭 시 abNo를 ajax로 요청해 selectOne 해오기...
function selectOneBoard(abNo,cgName){
	$.ajax({
		url : "/selectOneBoard.do",
		type : "post",
		data : {abNo : abNo},
		success : function(data){
			selectAnswer(data.abNo);
			console.log(data);
			$('[name=abNo]').val(data.abNo);
			$('.titleHead').html(cgName);
			$('.abTitle').html(data.abTitle);
			$('.abWriter').html(data.abWriter);
			$('.enrollDate').html(data.enrollDate);
			$('.abContent').html(data.abContent);
			$('.modal').css('display','flex');
		}
	});
}
//답변 슬라이드토글
function answerToggle(){
	$('.answer-box').slideToggle();
	$(this).attr('disabled',true);
}
//abNo 로 게시물의 답변 가져오기
function selectAnswer(abNo){
	$.ajax({
		url:"/selectAnswer.do",
		data:{abNo:abNo},
		success:function(data){
			console.log(data);
			if(data == null){
				$('.btn-box').html(`<button class="btns slideAnswerBtn" onclick="answerToggle();">답변하기</button>`);
			}else{
				$('.btn-box').html('');
				$('.answerContent').html(data.anContent);
				$('.answer-wrap').show();
			}
		}
	});
}
