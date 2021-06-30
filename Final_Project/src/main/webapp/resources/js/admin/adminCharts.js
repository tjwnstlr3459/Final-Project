$(function(){
	selectAdminCount();
	selectVisitToday();
	selectVisitTotal();
});
//페이지 로드 시 ADminCount(서비스 시작 후 현재까지 기록 data) 가져오기
function selectAdminCount(){
	$.ajax({
		url : "/selectAdminCount.do",
		type : "post",
		success : function(data){
			console.log(data);
			memberHobbys(data);
			memberAges(data);
		}
	});
}
//회원 취미 선택 통계
function memberHobbys(data){
	var myChart = new Chart(document.getElementById('chart1'), {
        type: "bar",
        data: {
            labels: ['Sports', 'Music', 'Travel', 'Movie', 'Game'],
            datasets: [{
                label: 'All',
                data: [data.memberSports, data.memberMusic, data.memberTravel, data.memberMovie, data.memberGame],
                backgroundColor:[
                	'rgba(0, 0, 255, 0.3)',
                	'rgba(255, 0, 255, 0.3)',
                    'rgba(76, 216, 153, 0.5)',
                    'rgba(0, 255, 255, 0.3)',
                    'rgba(255, 0, 0, 0.3)'
				],
                borderColor: [
                    '#eeeeee'
                ],
                borderWidth: 1
            }]
        },
        options: {
            maintainAspectRatio: false
        }
    });
}
//회원 연령대 별 가입자 수
function memberAges(data){
	var memberAgeChart = new Chart(document.getElementById('memberAge'),{
		type:"doughnut",
		data:{
			labels:['teenagers','twenties','thirties','forties'],
			datasets:[{
				label:'All',
				data:[data.teenagers,data.twenties,data.thirties,data.forties],
				backgroundColor:[
					'rgba(255,255,0,0.4)',
					'rgba(51,51,255,0.4)',
					'rgba(51,255,255,0.4)',
					'rgba(153,102,51,0.4)'
				]
			}]
		}
	});
}
//오늘 방문자 수 select 함수
function selectVisitToday(){
	$.ajax({
		url : "/selectVisit.do",
		data : {selectType : "today"},
		success : function(data){
			if(window.location.pathname == "/adminMain.do") document.getElementById('today').innerHTML = data;
		}
	});
}
//사이트 총 방문자 수 select 함수
function selectVisitTotal(){
	$.ajax({
		url : "/selectVisit.do",
		success : function(data){
			if(window.location.pathname == "/adminMain.do") document.getElementById('total').innerHTML = data;
		}
	});
}