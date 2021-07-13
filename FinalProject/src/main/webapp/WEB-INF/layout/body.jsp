<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<style type="text/css">
div#myCarousel img {
	height: 300px;
	width: 1150px;
	height: 460px;
}

.item img {
	margin-left: auto;
	margin-right: auto;
}

div.loginnull {
	margin-top: 80px;
	width: 980px;
	height: 70px;
	background-color: #021B80;
}

div.loginnull a {
	color: white;
	font-size: 1.5em;
	line-height: 70px;
	margin-left: 30px;
}

div.loginnull button {
	right: 30px;
	color: #021B80;
	font-size: 15px;
	font-weight: 600;
	padding: 10px 40px;
	border: none;
	border-radius: 3px;
	background-color: #fff;
	margin-right: 30px;
	margin-top: 15px;
	float: right;
}
 div.gonggo-box{
 	max-width: 200px;
 	min-width: 200px;
	height: 200px;
	cursor: pointer;
	margin-left:30px;
	margin-bottom: 100px;
	padding-top: 10px;
	float: left;
	border: none;
 }
 
div.newgonggo{
	margin-top: 80px;
	margin-bottom: 40px;
	height: 600px;
}

div.news-box {
float: left;
max-width: 540px; 
height: 300px;
border: none;
margin-right: 20px;
}

div.news:hover{
	cursor: pointer;
}

div.image{
	width: 200px;
	height: 150px;
	background-size: 200px 150px;
	border-radius: 10px;
	margin-right: 20px;
}

div.gonggo{
	margin-left: 10px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<%-- <p>principal : <sec:authentication property="principal.user.id"/></p> --%>
<form class="main form-inline">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="image/123.png" alt="">
			</div>

			<div class="item">
				<img src="image/456.png" alt="">
			</div>

			<div class="item">
				<img src="image/789.png" alt="">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<c:if test="${auth==null and sessionScope.loginok==null}">
		<div class="loginnull">
			<a href="joinForm">일하는 우리 모두의 커리어 성장과 행복을 위해</a>
			<button type="button" OnClick="location.href='joinForm'">회원 가입하기</button>
		</div>
	</c:if>
	<div class="newgonggo">
		<h2>신규 채용공고</h2>
		<c:set var="strPlanDate" value="${date}" />
		<c:forEach var="dto" items="${gonggolist}" end="8">
		<c:set var="end_plan_date" value="${dto.deadline}" />
		<fmt:parseNumber value="${strPlanDate.time/ (1000*60*60*24)}" integerOnly="true" var="strDate" />
		<fmt:parseDate value="${end_plan_date}" var="endPlanDate"
					pattern="yyyy-MM-dd" />
		<fmt:parseNumber value="${endPlanDate.time/ (1000*60*60*24)+1}" integerOnly="true" var="endDate" />		
		<c:if test="${(endDate - strDate)>=0}"> 
		<div class="gonggo-box">
		<div class="image" style="background-image: url('../gonggophoto/${dto.empimg }');"></div>
			<div class="gonggo" OnClick="location.href='gonggodetail?num=${dto.num}'">
				<input type="hidden" name="num" value="${dto.num}">
				<h4 class="subject">${dto.jobgroup}</h4>
				<h6 class="empname" style="color: #021B80">${dto.empname }</h6>
				<h5 class="job">${dto.job }</h5>
				
				<c:set var="endday1" value="${dto.deadline.substring(0,4)}" />
				<c:set var="endday2" value="${dto.deadline.substring(5,7)}" />
				<c:set var="endday3" value="${dto.deadline.substring(8,10)}" />
				<h5 style="color: gray">마감일 : ${endday1}년 ${endday2}월
							${endday3}일</h5>
			</div>
	  </div>
		 </c:if>
		</c:forEach>
</div><br>
	<div class="news"><br>
		<h2>기업 최신뉴스</h2><br>
		<c:forEach var="nto" items="${newslist}" end="1">
		<div class="news-box" OnClick="location.href='newsdetail?num=${nto.num}'">
		<input type="hidden" name="num" value="${nto.num}">
		<img src="../newsImage/${nto.image}" style="width: 450px; max-height: 270px;">
		<h4 >${nto.title}</h4>
		</div>
		
		</c:forEach>
	</div>

</form>
</body>
</html>