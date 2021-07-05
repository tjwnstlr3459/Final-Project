$(function(){
	$('#sort').change(function(){
		console.log('test!!!');
		$('#ssForm').submit();
	});
	$('#searchBtn').click(function(event){
		if($('#keyword').val() == "default"){
			alert('검색 키워드를 선택해주세요');
			event.preventDefault();
		}
	});
});