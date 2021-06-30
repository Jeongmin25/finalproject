<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%--  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> --%>
  	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<c:if test="${auth==null }">
<h1>로그인 하세유</h1>
</c:if>
<c:if test="${auth!=null }">
<h1>${auth}님이 로그인하셨습니다</h1>
</c:if>

<%-- <p>principal : <sec:authentication property="principal.user.id"/></p> --%>


</body>
</html>