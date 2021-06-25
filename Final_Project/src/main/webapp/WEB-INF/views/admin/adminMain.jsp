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
</style>
</head>
<body>
	<div class="wrap">
		<!-- header-nav -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		<!-- content -->
		<div class="chart1-box">
	        <canvas id="chart1" width="400" height="400"></canvas>
	    </div>	
		
		
		
		<!--
		<section>
		<table class="list">
			<thead>
				<tr>
					<th>번호</th><th>보낸이</th><th>받는이</th><th>내용</th><th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="dm">
					<tr>
						<td>${dm.dmNo }</td>
						<td>${dm.sender }</td>
						<td>${dm.receiver }</td>
						<td>${dm.dmContent }</td>
						<td>${dm.dmDate }</td>
					</tr>
				</c:forEach>				
			</tbody>
		</table>
		</section>
		-->
	</div>
	<script>
            var myChart = new Chart(document.getElementById('chart1'), {
                type: "bar",
                data: {
                    labels: ['Sports', 'Music', 'Travel', 'Movie', 'Game'],
                    datasets: [{
                        label: '2021-06',
                        data: [65, 56, 23, 44, 98],
                        backgroundColor:
                            'rgba(76, 216, 153, 0.5)'

                        ,
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
    </script>
]
</body>
</html>