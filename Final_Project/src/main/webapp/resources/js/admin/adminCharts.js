$(function(){
	selectAdminCount(); 
	selectVisitToday();			//오늘 방문자 수 get
	selectVisitTotal();			//총 방문자 수 get
	memberCountMonth();			//한 달 기준 회원 count get
	selectAllAdmin();			//관리자 등급의 계정만 get
	
});
//페이지 로드 시 ADminCount(서비스 시작 후 현재까지 기록 data) 가져오기
function selectAdminCount(){
	$.ajax({
		url : "/selectAdminCount.do",
		type : "post",
		success : function(data){
			console.log(data);
			memberHobbys(data);				//회원들이 선택한 취미 차트
			memberAges(data);				//회원들이 연령대별 취미 차트 
			defaultCount(data);				//페이지 로드 되면서 값을 넣어주는 함수
			categoryRank(data);				//카테고리 랭크
			//notAnswerAlarm(data.notAnswer);	//접수 중인 문의/신고 갯수
		}
	});
}
//페이지 로드 시 한달 기준으로 회원 count 가져오기
function memberCountMonth(){
	$.ajax({
		url : "/memberCountMonth.do",
		type : "post",
		success : function(data){
			destroyMemberCountMonth(data);	//회원 count해오고 탈퇴 회원 count 함수 호출
		}
	});
}
//페이지 로드 시 한 달 기준 탈퇴 회원 count 가져오기
function destroyMemberCountMonth(param){
	$.ajax({
		url:"/destroyMemberCountMonth.do",
		type:"post",
		success : function(data){
			memberCountChart(param,data);	//회원count>param, 탈퇴회원count>data를 같이 넘겨줌
		}
	});
}
//회원 취미 선택 통계
function memberHobbys(data){
	var myChart = new Chart(document.getElementById('memberHobbyChart'), {
        type: "bar",
        data: {
            labels: ['Sports', 'Music', 'Travel', 'Movie', 'Game','Nature','Bear','Food'],
            datasets: [{
                label: 'All Count',
                data: [data.memberSports, data.memberMusic, data.memberTravel, data.memberMovie, data.memberGame, data.memberNature, data.memberBear, data.memberEat],
                backgroundColor:[
                	'rgba(0, 0, 255, 0.3)',
                	'rgba(255, 0, 255, 0.3)',
                    'rgba(76, 216, 153, 0.5)',
                    'rgba(0, 255, 255, 0.3)',
                    'rgba(255, 0, 0, 0.3)',
                    'rgba(255,102,204,0.3)',
                    'rgba(204,255,51,0.3)',
                    'rgba(204,255,255,0.3)'
				],
                borderColor:'rgba(255,255,255,0.1)',
                borderWidth: 1
                
            }]
        },
        options: {
            maintainAspectRatio: false,
              responsive: true,
			    plugins: {
			      legend: {
			        position: 'top',
			      },
			      title: {
			        display: true,
			        text: 'Member Choice Hobby',
			        color:'#67dfdf'
			      }
			    }
        }
    });
}
//회원 연령대 별 가입자 수
function memberAges(data){
	var memberAgeChart = new Chart(document.getElementById('memberAgeChart'),{
		type:"doughnut",
		data:{
			labels:['teenagers','twenties','thirties','forties'],
			datasets:[{
				label:'age',
				data:[data.teenagers,data.twenties,data.thirties,data.forties],
				backgroundColor:[
					'rgba(255,255,0,0.4)',
					'rgba(51,51,255,0.4)',
					'rgba(51,255,255,0.4)',
					'rgba(153,102,51,0.4)'
				],
				borderColor:'rgba(255,255,255,0.1)'
				
				
			}]
		},
		options:{
			maintainAspectRatio: false,
			reponsive:true,
			plugins:{
				legend:{
					position:'left'
				},
				title:{
					display:true,
					text:'Member Ages',
					color:'#67dfdf'
				}
			}
		}
	});
}
//멤버 카운트 차트
function memberCountChart(param,data){
	console.log(param);
	console.log(data);
	//매개변수(list)를 차트에 넣어 줄 배열 선언
	var memberCount = new Array();
	var destroyCount = new Array();
	var yearMonth = new Array();
	//list길이만큼 배열 안에 list의 value값 넣어주기
	for(var i=0;i<data.length;i++){
		memberCount.push(param[i].memberCount);
		yearMonth.push(param[i].enrollMonth);
		destroyCount.push(data[i].destroyCount);
	}
	//차트 구현
	var memberAgeChart = new Chart(document.getElementById('memberCountChart'),{
		type:"line",
		data:{
			labels:yearMonth,
			datasets:[
				{
					label:'Member Sign',
					data:memberCount,
					pointBackgroundColor:'#ffffff',
					borderColor:'#ffffff',
					borderWidth:2,
					pointBorderWidth:3,
					hoverBorderWidth:10,
					color:'#333333'
				},
				{
					label:'Member Destroy',
					data:destroyCount,
					pointBackgroundColor:'red',
					borderColor:'red',
					borderWidth:2,
					pointBorderWidth:3,
					hoverBorderWidth:10
				}
			
			]
		},
		options:{
			maintainAspectRatio: false,
			reponsive:true,
			plugins:{
				legend:{
					position:'top'
				},
				title:{
					display:true,
					text:'Member Sign / Destroy',
					color:'#67dfdf'
				}
			}
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
//페이지 로드 되면서 adminCount 를 가져와 기본 데이터 넣어주기
function defaultCount(data){
	document.getElementById('allMemberCount').innerHTML = data.allMemberCount;
	document.getElementById('destroyedMemberCount').innerHTML = data.destroyedMemberCount;
	document.getElementById('restrictedMemberCount').innerHTML = data.restrictedMemberCount;
	document.getElementById('allClubCount').innerHTML = data.allClubCount;
	document.getElementById('destroyedClubCount').innerHTML = data.destroyedClubCount;
}
//카테고리 순위 html태그 만들면서 넣어주기
function categoryRank(data){
	var row;
	for(val  of data.bcList){
		row += `<tr><td>${val.cgName}</td><td class="graphs-wrap"><div class="graphs" style="width:${val.percent}%;"></div></td><td>${val.percent}%</td></tr>`;
	}
	$('.cgLank>tbody').html(row);
}
//관리자들 가져오기
function selectAllAdmin(){
	$.ajax({
		url:"/selectAllAdmin.do",
		success:function(data){
			console.log(data);
			adminList(data);
		}
	});
}
//관리자 list에 data 넣어주기
function adminList(data){
	var row;
	for(val of data){
		var grade = val.grade==0?"MainAdmin":"SubAdmin";
		row += `<tr><td><div class="adminPic"><img src="/resources/image/userPic/${val.filepath}"></div></td><td>${val.memberNick}</td><td>${grade}</td></tr>`;
	}
	$('.adminList>tbody').html(row);
}