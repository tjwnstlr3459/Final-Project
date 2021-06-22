<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<title>Make your Feed</title>
</head>
<body>
	<div class="making_feed_wrap">
		<h3 class="card-header">MAKING FEED!</h3>
		<fieldset>
			<i class="fas fa-camera"
				style="font-size: 50px; margin-top: 20px; margin-bottom: 50px;"></i>
			<div id="img-viewer">
				<img id="img-view" width="600px;" height="400px;" margin-top="50px;"
					alt="">
			</div>
		</fieldset>
	</div>
	<form action="/insertFreeBoard.do" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="formFile" class="form-label mt-4"></label> <input
				class="form-control" type="file" id="formFile" name="files"
				onchange="loadImg(this)">
		</div>
		<div class="form-group">
			<label for="typeSelect" class="form-label mt-4">CLUB CATEGORY</label> <select class="form-select" name="type" id="typeSelect" style="color:white;">
				<option value="4">스포츠</option>
				<option value="5">음악</option>
				<option value="6">여행</option>
				<option value="7">자연</option>
				<option value="8">게임</option>
				<option value="9">영화</option>
				<option value="10">술</option>
				<option value="11">음식</option>
			</select>
		</div>
		<div class="card-footer text-muted">
			<input type="text" name="fbWriter" value="${sessionScope.m.memberNick }" hidden>
		</div>
		<div class="form-group">
			<label for="exampleTextarea" class="form-label mt-4">CONTENT</label>
			<textarea class="form-control" id="exampleTextarea" rows="3" name="fbContent"></textarea>
		</div>
		<p style="margin-top: -12px"></p>
		<div class="making_feed_wrap">
			<button type="submit" class="btn btn-outline-light"
				style="margin-top: 30px;">MAKE</button>
		</div>
	</form>
	<!--    <script type="text/javascript" src="dapi.kakao.com/v2/maps/sdk.js?appkey=29f578c657765b5ccc3a6c44ab486de0&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script> -->
	<script>
    function loadImg(f){	
			if(f.files.length != 0){		
				var reader = new FileReader();
				reader.readAsDataURL(f.files[0]);	
	
				reader.onload=function(e){
					$("#img-view").attr("src",e.target.result);		
				}
			}else{			
				$("#img-view").attr("src","");
			}
		}
</script>
</body>
</html>