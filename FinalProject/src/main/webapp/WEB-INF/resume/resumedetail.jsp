<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	form.resumedetail{
		padding: 10px 0px 230px 230px;
	}
</style>
</head>
<body>
<button type="button" onclick="location.href='updateresume'">수정하기</button>
<button type="button" onclick="location.href='down'"><span class="glyphicon glyphicon-download-alt"></span></button>
<form action="#" class="resumedetail">
	<h2>이름</h2>
	<br><br>
	<h5>이름</h5>
	<h5>이메일</h5>
	<h5>핸드폰</h5>
	<br><br><br>
	<table class="carer">
		<tr style="border-bottom: 1px solid gray;">
			<th style="width: 300px;height: 100px;">
				<h4><b>경력</b></h4>
			</th>
			<td>
				<c:forEach var="cdto" items="${cdto }">
					<span>${cdto.company }</span>&nbsp;
				</c:forEach>
			</td>
		</tr>
		<tr style="border-bottom: 1px solid gray;">
			<th style="width: 300px;height: 100px;">
				<h4><b>학력</b></h4>
			</th>
			<td>
				<c:forEach var="edto" items="${edto }">
					<span>${edto.school }</span>&nbsp;
				</c:forEach>
			</td>
		</tr>
		<tr style="border-bottom: 1px solid gray;">
			<th style="width: 300px;height: 100px;">
				<h4><b>수상경력 및 활동</b></h4>
			</th>
			<td>
				<c:forEach var="adto" items="${adto }">
					<span>${adto.activity }</span>&nbsp;
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th style="width: 300px;height: 100px;">
				<h4><b>외국어</b></h4>
			</th>
			<td>
				<c:forEach var="fdto" items="${fdto }">
					<span>${fdto.lang }</span>&nbsp;
				</c:forEach>
			</td>
		</tr>
	</table>
</form>
</body>
</html>