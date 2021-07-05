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
<style type="text/css">
	
	div.menu{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}
	
	button.menu:hover{
		background-color: #021B80;
		color: white;
	}

	div.empreview{
		width: 400px;
		height: 200px;
		margin-left: 10px;
	}
	div.runsearch{
		cursor: pointer;
		color: gray;
		width: 40px;
		height: 45px;
		margin-top: 7px;
		font-size: 1.5em;
	}
	
	div.inputserach{
		width: 400px;
		height: 50px;
		border: 1px solid gray;
		border-radius: 10px;
	}
	
	div.list{
		width: 900px;
		margin-left: 10px;
	}
	
	div.empname{
		width: 900px;
		height: 100px;
		padding-left: 20px;
		margin-bottom: 10px;
		border: 1px solid gray;
		border-radius: 20px;
		cursor: pointer;
		font-size: 1.2em;
	}
	
	div.empname:hover{
		background-color: #ddd;
	}
	
	a.empname{
		font-size: 1.5em;
		text-decoration: none;
		color: #282828;
		top: 20px;
	}
	
	div.menu button.menu{
		border-radius: 20px;
		width: 150px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="menu">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='review'">기업리뷰</button>
		
		<!--  -->
		<c:if test="${auth!=null }">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='addreview'">my리뷰</button>		
		</c:if>

	</div>
	
	<div class="empreview">
		<h1>기업 리뷰</h1>
		<br>
		<h4 style="color: gray;">앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?</h4>
		<div class="inputserach">
			<form action="searchlist" method="get">
			<input type="text" id="empname" name="empname" placeholder="기업 검색"
				style="width: 350px; height: 45px; border: 0px; margin-left: 3px;" class="form-inline">
			<button class="btn btn-sm" type="submit" style="background-color: white;">
			<span class="glyphicon glyphicon-search" style="font-size: 1.5em;"></span>
			</button>
			</form>
		</div>
	</div>
	<br><br><br>
	
	<!-- 기업 이미지  -->
	
	<div class="list">
		<h2>전체 기업리뷰 (${total})</h2>
		<br>
		<c:forEach items="${empname }" var="empname">
			<div class="empname">
			<br>
			<a class="empname" href="reviewdetail?empname=${empname.empname }">
			<img alt="" src="../image/+job.png" style="max-width: 50px; border: 1px solid gray; border-radius: 50px;">
			&nbsp;&nbsp;
			${empname.empname } 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<b style="font-weight: normal; color: gray;"># ${empname.good}</b></a>
			</div>
		</c:forEach>
	</div>
	
	
<!-- 페이지 번호 -->
<div style="width: 800px; text-align: center;">
	<ul class="pagination">
		<!-- 이전페이지 -->
		<c:if test="${startPage>1 }">
			<li><a href="review?pageNum=${startPage-1}">◁이전</a></li>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<!-- currentPage==pp -->
			<c:if test="${currentPage==pp }">
				<li class="active"><a href="review?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="review?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="review?pageNum=${endPage+1}">다음▷</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>