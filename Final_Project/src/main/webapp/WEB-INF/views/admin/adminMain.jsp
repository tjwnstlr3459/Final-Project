<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NUNADRI - admin</title>
<style>
	.menu>li:first-child>a{
	    padding-left:25px;
	    border-left:5px solid var(--mainTextColor);
	    border-right:5px solid var(--mainTextColor);
	    background:linear-gradient(to bottom, rgba(1, 225, 255, 0.5),rgba(33, 229, 255, 0.3),rgba(95, 235, 248, 0.1));
	}
</style>
</head>
<body>
	<div class="wrap">
		<!-- header-nav -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		<!-- content -->
		<section>
			<div class="counts">
				<div class="box-option count-wrap"><!-- 접속자 -->
					<div class="icon-box visitor-icon"></div>
					<div class="count-box">
						<span class="spans count-name">Visitor</span>
						<span class="spans count-value" id="visitor"></span>
					</div>
				</div>
				<div class="box-option count-wrap"><!-- 투데이 -->
					<div class="icon-box today-icon"></div>
					<div class="count-box">
						<span class="spans count-name">Today</span>
						<span class="spans count-value" id="today"></span>
					</div>
				</div>
				<div class="box-option count-wrap"><!-- 토탈 -->
					<div class="icon-box total-icon"></div>
					<div class="count-box">
						<span class="spans count-name">Total</span>
						<span class="spans count-value" id="total"></span>
					</div>
				</div>
			</div>
			<div class="chart-wrap">
				<div class="memberCount-box box-option">
					<canvas id="memberCountChart"></canvas>
				</div>
				<div class="memberHobby-box box-option">
			        <canvas id="memberHobbyChart"></canvas>
			    </div>	
			</div>
			<div class="chart-wrap">
				<div class="ages-box box-option">
			        <canvas id="memberAgeChart"></canvas>
			    </div>
			    <div class="info-space">
				    <div class="info-wrap box-option">
				    	<table class="table-info">
				    		<thead>
					    		<tr>
					    			<th colspan="2"><h3 class="title-info">title</h3></th>
					    		</tr>
				    		</thead>
				    		<tbody>
				    			<tr>
				    				<td>All Members</td><td id="allMemberCount"></td>
				    			</tr>
				    			<tr>
				    				<td>Destroyed Members</td><td id="destroyedMemberCount"></td>
				    			</tr>
				    			<tr>
				    				<td>Restricted Members</td><td id="restrictedMemberCount"></td>
				    			</tr>
				    		</tbody>
				    	</table>
				    </div>
				    <div class="info-wrap box-option">
				    	<table class="table-info">
				    		<thead>
					    		<tr>
					    			<th colspan="2"><h3 class="title-info">title</h3></th>
					    		</tr>
				    		</thead>
				    		<tbody>
				    			<tr>
				    				<td>Members</td><td id="memberCount">num</td>
				    			</tr>
				    		</tbody>
				    	</table>
				    </div>
			    </div>
			    <div class="info-space">
				    <div class="infoList-wrap box-option">
				    	<table class="table-info">
				    		<thead>
					    		<tr>
					    			<th colspan="3"><h3 class="title-info">title</h3></th>
					    		</tr>
				    		</thead>
				    		<tbody>
				    			<tr>
				    				<td>활동? 순위</td><td class="graphs-wrap"><div class="graphs"></div></td><td id="memberCount">num</td>
				    			</tr>
				    		</tbody>
				    	</table>
				    </div>
			    </div>
			</div>
		</section>
	</div>
</body>
</html>