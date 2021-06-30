<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - admin</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
<style>
	.menu>li:first-child>a{
	    padding-left:25px;
	    border-left:5px solid var(--mainTextColor);
	    border-right:5px solid var(--mainTextColor);
	    background:linear-gradient(to bottom, rgba(1, 225, 255, 0.5),rgba(33, 229, 255, 0.3),rgba(95, 235, 248, 0.1));
	}
	.hobbys-box{
		width:300px;
		height:300px;
		padding:10px;	
	}
	.ages-box{
		width:300px;
		height:300px;
		padding:10px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- header-nav -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		<!-- content -->
		<section>
			<div class="count-box">
				<ul>
					<li>접속자 
				</ul>
			</div>
			<div class="hobbys-box box-option">
		        <canvas id="chart1"></canvas>
		    </div>	
			<div class="ages-box box-option">
		        <canvas id="memberAge"></canvas>
		    </div>	
		</section>
	</div>
</body>
</html>