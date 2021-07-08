<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
div.giup{
border: 1px solid gray;
border-radius: 20px 20px;

}
</style>
</head>
<body>
<form action="#" class="form-inline">
<h2>My Company</h2>
<div class="giup">
<h3>&nbsp;${dto.empname} (${dto.email})</h3>
<hr>
<c:forEach var="${cdto}" items="${cdto}">
<c:if test="${cdto.amount ne null}">
<div>
${cdto.jobgroup}
</div>
</c:if>
</c:forEach>
</div>
</form>
</body>
</html>