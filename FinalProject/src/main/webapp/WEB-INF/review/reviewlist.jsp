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
		background-color: highlight;
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
		height : 600px;
		margin-left: 10px;
	}
	
	div.empname{
		width: 200px;
		height: 30px;
		padding-left: 20px;
		margin-bottom: 10px;
		border: 1px solid gray;
		border-radius: 20px;
		cursor: pointer;
		font-size: 1.2em;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="menu">
		<button type="button" class="menu btn btn-default"
			onclick="location.href='review'">기업리뷰</button>
		<button type="button" class="menu btn btn-default"
			onclick="location.href='addreview'">my리뷰</button>
	</div>
	
	<div class="empreview">
		<h1>기업 리뷰</h1>
		<br>
		<h4 style="color: gray;">앞으로 근무할 기업은 어떤 모습일까 궁금하시죠?</h4>
		<div class="inputserach">
			<input type="text" id="search" name="search" placeholder="기업 검색"
				style="width: 350px; height: 45px; border: 0px; margin-left: 3px;" class="form-inline">
			<div class="runsearch glyphicon glyphicon-search"
				onclick=""></div>
		</div>
	</div>
	
	<div class="list">
		<h2>전체 기업리뷰</h2>
		<c:forEach items="${empname }" var="empname">
			<div class="empname">
			<a href="reviewdetail?empname=${empname.empname }">${empname.empname }</a>
			</div>
		</c:forEach>
	</div>

</body>
</html>