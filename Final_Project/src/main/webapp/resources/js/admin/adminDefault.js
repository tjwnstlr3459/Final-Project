$(function(){
	//목록에서 정렬 select 선택 시
	$('#sort').change(function(){
		console.log('test!!!');
		$('#ssForm').submit();
	});
	//목록에서 검색어를 이용 시
	$('#searchBtn').click(function(event){
		if($('#keyword').val() == "default"){
			alert('검색 키워드를 선택해주세요');
			event.preventDefault();
		}
	});
	//문의 / 신고 에서 수정완료 클릭 시 ajax로 수행
	$('.comBtn').click(function(){
		console.log($('#anNo').val());
		var anNo = $('#anNo').val();
		var anWriter = $('input[name=anWriter]').val();
		$.ajax({
			url:"/updateAnswer.do",
			type:"post",
			data:{
				anNo : anNo,
				anWriter : anWriter,
				anContent : $('#anSummernote').summernote('code')
			},
			success:function(data){
				if(data == "1"){
					alert('답변 수정이 정상적으로 처리되었습니다.');
				}else if( data == "0"){
					alert('처리 도중 에러가 발생했습니다. 다시 시도해주세요(그래도 안되면 개발자 호출)');
				}
				window.location.href = window.location.href;
			}
		});
	});

});
//문의 / 신고 갯수
function notAnswerAlarm(count){
	if(count>0){
		$('.alarm-box').show();
	}else{
		$('.alarm-box').hide();	
	}
}