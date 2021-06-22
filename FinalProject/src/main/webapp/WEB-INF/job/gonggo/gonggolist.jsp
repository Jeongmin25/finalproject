<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<style type="text/css">

</style>
</head>
<body>
<form class="list form-inline">
<h3>공고등록</h3>
<br>
<div class="addgonggo form-control" OnClick="location.href='writegonggo.jsp'">
	<div class="gonggoicon">
	<span class="glyphicon glyphicon-file" ></span>
	<p>공고 작성</p>
	</div>
</div>

<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail.jsp'">
		<h3>${dto.empsubject}</h3>
		<br>
		<b>마감일 : ${dto.deadline}</b>
	</div>
</c:forEach>
</form>
</body>
</html>