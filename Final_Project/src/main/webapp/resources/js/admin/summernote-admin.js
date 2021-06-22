$(document).ready(function() {
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
	 $('.enterBtn').click(function(){
	 	if($('#summernote').summernote('code') == ''){
	 		return alert('내용을 적어주세요');
	 	}
	 	$('#modalForm').submit();
	 });
	 $('#cgNo').change(function(){
	 	console.log($(this).val());
	 });
	 //경고 버튼 클릭 시 
	 $('.warningBtn').click(function(){
	 	$('#modalForm').attr('action','/insertDm.do');		//form의 action 경로 설정
	 	var memberNick = $(this).parent().parent().children().eq(3).html();		//memberNick 가져옴
	 	$('.titleHead').html('경고 사유');							//모달 타이틀 설정
	 	$('#summernote').attr('name','dmContent');			//요소 name을 설정
	 	$('[name=receiver]').val(memberNick);				//받는사람 설정
	 	modalOpen();
	 });
	 //제재 버튼 클릭 시
	 $('.restBtn').click(function(){
	 	$('#modalForm').attr('action','/insertRest.do');		//form의 action 경로 설정
	 	$('.titleHead').html('제재 사유');							//모달 타이틀 설정
	 	var restEmail = $(this).parent().parent().children().eq(2).html();		//memberNick 가져옴
	 	$('[name=restEmail]').val(restEmail);
	 	$('#summernote').attr('name','restContent');
	 	modalOpen();
	 	
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
	 	$('.checkMember:checked').each(function(i){
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
	 //선택된 회원 checkbox
	 $('#selectMessageBtn').click(function(){
	 	var chkValue = $('.checkMember:checked');
	 	for(var i=0;i<chkValue.length;i++){
	 		console.log(chkValue.eq(i).val());	 	
	 	}
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
	$('.summernote').summernote('code','');
}
