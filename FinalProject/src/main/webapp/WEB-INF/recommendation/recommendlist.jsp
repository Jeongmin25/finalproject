<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">

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
</style>
</head>
<body>
<c:set var="id" value="${username }"/>
<h1>추천 공고</h1>
<h5 class="alert alert-default">
	안녕하세요 ${id }님, 기입하신 전문분야를 기반으로 포지션을 추천드립니다.
</h5>
<div class="recommed">
<c:forEach var="dto" items="${data}" varStatus="n">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<img alt="" src="../gonggophoto/${dto.empimg }" style="width: 200px; height:150px; border-radius: 5px;">
		<h4 class="subject">${dto.jobgroup}</h5>
		<h5>${dto.empname }</h4>		
		<h5 style="color:gray">마감일 : ${dto.deadline }</h5>
	</div>
</c:forEach>

</div>



</body>
</html>