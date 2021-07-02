<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
	div.total{
		width: 700px;
		height: 400px;
		border: 1px solid gray;
		border-radius: 10px;
		margin: 50px 50px 100px 100px;
		padding: 20px 20px 20px 20px;
	}
	
.star-rating { width:304px; }
.star-rating,.star-rating span { display:inline-block; height:55px; overflow:hidden; background:url(../image/star.png)no-repeat; }
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }

.pinkstar-rating { width:205px; }
.pinkstar-rating,.pinkstar-rating span { display:inline-block; height:37px; overflow:hidden; background:url(../image/pinkstar.png)no-repeat; }
.pinkstar-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="list">
		<c:set value="${empname }" var="empname" />
		<h1>${empname }기업리뷰</h1>
		<h5 style="color: gray;">전/현직자들이 ${review0fEmp}개의 리뷰를 작성했습니다.</h5>

		<!-- 평균 값 저장 -->
		<c:set value="${avgRating }" var="avgRating" />
		<c:set value="${avgCul }" var="avgCul" />
		<c:set value="${avgImp }" var="avgImp" />
		<c:set value="${avgEnv }" var="avgEnv" />
		<c:set value="${avgSal }" var="avgSal" />
		<c:set value="${avgCeo }" var="avgCeo" />

		<div class="total">
			<!-- 기업 총 평가 평균 -->
			<b style="font-size: 5em;">${avgRating }</b>&nbsp;&nbsp;&nbsp; <span
				class="star-rating"> <!-- 너비 100%에 맞추려면 (rating*10)*2 --> <span
				style="width:${(avgRating*10)*2}%"></span>
			</span>
			<!-- 기업 세부 평가점수 차트 -->
			<div id="chart_div"></div>
		</div>

		<!-- empname에 해당하는 데이터 반복출력 -->
		<c:forEach items="${empdata }" var="data">
			<table class="table table-bordered"
				style="width: 700px; margin-left: 100px;">
				<tr>
					<td colspan="2">
						<h4 style="color: gray;">${data.job_group}
							| ${data.prenow} |
							<fmt:formatDate value="${data.writeday }" pattern="MM-dd"
								var="date" />${date}
						</h4>
					</td>
				</tr>
				<tr>
					<td width="100px;">
						<!-- 총 평가 --> <span class="pinkstar-rating"> <span
							style="width:${(data.rating*10)*2}%"></span>
					</span> 사내문화
						<div class="progress">
							<div class="progress-bar progress-bar" role="progressbar"
								style="width: ${(data.cul*10)*2}%; background-color:#0064CD;"
								aria-valuenow="${(data.cul*10)*2}" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div> 자기개발
						<div class="progress">
							<div class="progress-bar progress-bar" role="progressbar"
								style="width: ${(data.imp*10)*2}%; background-color:#0064CD;"
								aria-valuenow="${(data.imp*10)*2}" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div> 근무환경
						<div class="progress">
							<div class="progress-bar progress-bar" role="progressbar"
								style="width: ${(data.env*10)*2}%; background-color:#0064CD;"
								aria-valuenow="${(data.env*10)*2}" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div> 급여 및 복지
						<div class="progress">
							<div class="progress-bar progress-bar" role="progressbar"
								style="width: ${(data.sal*10)*2}%; background-color:#0064CD;"
								aria-valuenow="${(data.sal*10)*2}" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div> 경영진
						<div class="progress">
							<div class="progress-bar progress-bar" role="progressbar"
								style="width: ${(data.ceo*10)*2}%; background-color:#0064CD;"
								aria-valuenow="${(data.ceo*10)*2}" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>

					</td>
					<td>
						<h4 style="color: #28AEFF;">장점</h4>
						<br>
						<p>${data.good}</p>
						<br>
						<h4 style="color: #FF3232;">단점</h4>
						<br>
						<p>${data.bad}</p>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><label class="inline">

							<button type="button" class="btn btn-default btnlikes"
								num="${data.num}" email="${data.email}">
								<span class="glyphicon glyphicon-thumbs-up" style="color: blue;"></span>
								도움이 돼요 ${data.likes }
							</button>

					</label></td>
				</tr>
			</table>
		</c:forEach>

		<!-- 페이지 번호 -->
		<div style="width: 800px; text-align: center;">
			<ul class="pagination">
				<!-- 이전페이지 -->
				<c:if test="${startPage>1 }">
					<li><a
						href="reviewdetail?empname=${empname }&pageNum=${startPage-1}">◁이전</a></li>
				</c:if>

				<!-- 페이지번호 -->
				<c:forEach var="pp" begin="${startPage }" end="${endPage }">
					<!-- currentPage==pp -->
					<c:if test="${currentPage==pp }">
						<li class="active"><a
							href="reviewdetail?empname=${empname }&pageNum=${pp }">${pp }</a></li>
					</c:if>
					<!-- currentPage!=pp -->
					<c:if test="${currentPage!=pp }">
						<li><a href="reviewdetail?empname=${empname }&pageNum=${pp }">${pp }</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음페이지 -->
				<c:if test="${endPage<totalPage }">
					<li><a
						href="reviewdetail?empname=${empname }&pageNum=${endPage+1}">다음▷</a></li>
				</c:if>
			</ul>
		</div>
	</div>
	
	<br>
	<button type="button" class="btn btn-default btn" onclick="location.href='review'"
		style="margin-left: 380px;">목록</button>	
</body>
<script type="text/javascript">
google.charts.load('current', {packages: ['corechart', 'bar']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = google.visualization.arrayToDataTable([
        ['기업평가', '',],
        ['사내문화 ${avgCul }', ${avgCul }],
        ['자기개발 ${avgImp }', ${avgImp }],
        ['근무환경 ${avgEnv }', ${avgEnv }],
        ['급여 및 복지 ${avgSal }', ${avgSal }],
        ['경영진 ${avgCeo }', ${avgCeo }]
      ]);

      var options = {
        
        chartArea: {width: '50%'},
        hAxis: {
            minValue: 1
          },
        
      };

      var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
    
//도움이돼요 버튼 클릭 이벤트
$(".btnlikes").click(function(){
	var num=$(this).attr("num");
	var email=$(this).attr("email");
	
    $.ajax({
        type : "post",  
        url : "/insertlikes",        
        data : "num="+num+"&email="+email,
        dataType: 'json',
        
        error : function(){
            alert("통신 에러","error","확인",function(){});
        },

        success : function(data) {
        		location.reload();
        
                if(data == 1){
                    alert("이미 추천되었습니다.");
                }
                else if (data == 0){
                	 alert("감사합니다. 추천되었습니다.");
                	
                }
        }
    });
});
</script>
</html>