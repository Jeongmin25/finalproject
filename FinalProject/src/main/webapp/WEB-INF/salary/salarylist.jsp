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
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
	<!-- chart -->
	<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
	
	<!-- select -->
	<div class="cate_job">
		<form action="searchjob" method="post">
		<select name="job" id="job" class="form-inline" style="width: 200px; height: 30px;"
			onchange="selectjob(this)">
			<option selected="selected">직군</option>
			<option value="IT/인터넷">IT/인터넷</option>
			<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
			<option value="디자인">디자인</option>
			<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
			<option value="생산/제조">생산/제조</option>
			<option value="유통/무역">유통/무역</option>
			<option value="서비스/고객지원">서비스/고객지원</option>
		</select>
		&nbsp;
		<select name="jobgroup" id="jobgroup" class="form-inline" style="width: 200px; height: 30px;">
			<option>직무</option>
		</select>
		&nbsp;
		<select name="career" id="career" class="form-inline" style="width: 200px; height: 30px;">
			<option value="0">신입</option>
			<option value="1">1년</option>
			<option value="2">2년</option>
			<option value="3">3년</option>
			<option value="4">4년</option>
			<option value="5">5년</option>
			<option value="6">6년</option>
			<option value="7">7년</option>
			<option value="8">8년</option>
			<option value="9">9년</option>
			<option value="10">10년</option>
		</select>
		&nbsp;
		<button type="submit" class="btn btn-default">검색</button>		
		</form>
	</div>
	
	<c:forEach items="${list} " var="list">
	<h5>${list} </h5>
	</c:forEach>
</body>
<script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Salary'],
          ['신입', 2900],
          ['1년', 1000],
          ['2년', 1000],
          ['3년', 1000],
          ['4년', 1000],
          ['5년', 1000],
          ['6년', 1170],
          ['7년', 660],
          ['8년', 1030],
          ['9년', 660],
          ['10년', 660]
        ]);

        var options = {
          chart: {
            
          },
          vAxis: {format: 'decimal'}
        
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    
//직군 onchange 이벤트
function selectjob(e) {
    var it = ["웹개발자", "프론트엔드개발자", "Node.js개발자", "빅데이터엔지니어"];
    var business = ["사업개발기획자", "컨설턴트", "경영지원"];
    var design = ["그래픽디자이너", "웹디자이너", "일러스트레이터", "UI 디자이너"];
    var marketing = ["광고기획자", "마케팅전략기획자", "키워드광고", "소셜마케터"];
    var production = ["생산직종사자", "제조엔지니어", "품질관리자", "반도체/디스플레이"];
    var trade  = ["수출입사무", "유통관리자", "배송담당", "항공운송"];
    var service  = ["MD", "CS어드바이저", "CS매니저", "텔레마케터"];
    var target = document.getElementById("jobgroup");

    if(e.value == "IT/인터넷") var d = it;
    else if(e.value == "경영/기획/컨설팅") var d = business;
    else if(e.value == "디자인") var d = design;
    else if(e.value == "미디어/홍보/마케팅") var d = marketing;
    else if(e.value == "생산/제조") var d = production;
    else if(e.value == "유통/무역") var d = trade;
    else if(e.value == "서비스/고객지원") var d = service;


    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = d[x];
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }   
}

</script>
    
</html>