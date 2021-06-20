$(document).ready(function() {
    //여기 아래 부분
	 $('#summernote').summernote({		//모든 textarea에 클래스로 서머노트 적용
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
	 $('.warningBtn').click(function(){
	 	modalOpen();
	 });
});
//==========================================================================================
function sendFile(file, el) {			//해당 편집기에 이미지를 드래그해서 추가했을때 sendFile()이 동작하고 매개변수로 this를 받아왔기 때문에 class로 여러개의 편집기를 사용해도 연동은 없다.
	var formData = new FormData();		//form에서의 이미지(data)를 보내기 위한 객체
  	formData.append('file', file);
  	$.ajax({
    	data: formData,
    	type: "POST",
    	url: '/imageUpload.do',
    	cache: false,
    	contentType: false,
    	enctype: 'multipart/formaDta',
    	processData: false,
    	success: function(data) {
      		$(el).summernote('editor.insertImage', data.url);
    	}
  	});
}
//모달 오픈 함수
function modalOpen(){
	$(".modal").css('display','flex');
}

