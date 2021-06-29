<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/gonggo.css" />
<style type="text/css">
h3.numdday{
color: #021B80;
font-size: 1.5em;
margin-top : 5px;
}
h3.endday{
font-size: 1.3em;
margin-top: 0px;
line-height: 0.8;
color: gray;
}

div.circle{
    border: 2px solid #021B80;
    border-radius: 20px 20px;
    font-size: 1.2em;
    color: gray;
    width: 100px;
	margin-top: 25px;
    margin-bottom: 0px;
    margin-left: 35px;
}
</style>
</head>
<body>
<form class="list form-inline">

<c:set var="now" value="<%=new java.util.Date()%>"/>
<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowDate"/>

<br>

<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>채용 중</h3>
<br>
<div class="addgonggo form-control" OnClick="location.href='writeform'">
	<div class="gonggoicon">
	<span class="glyphicon glyphicon-file" ></span>
	<p>공고 작성</p>
	</div>
</div>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="deadline" value="${dto.deadline} "/>
	<c:set var="end" value="${deadline.substring(0,4).concat(deadline.substring(5,7).concat(deadline.substring(8,10)))}"/>
	<fmt:parseDate value="${end}" pattern="yyyyMMdd" var="endDate"/>
	<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>

	<c:if test="${closeDate>=nowDate}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h3>${dto.jobgroup}</h3>
	<c:set var="endday1" value="${deadline.substring(0,4)}"/>
	<c:set var="endday2" value="${deadline.substring(5,7)}"/>
	<c:set var="endday3" value="${deadline.substring(8,10)}"/>
	<!-- 마감일이 30일보다 클 때 -->
	<c:if test="${closeDate-nowDate>30}">
	<div class="circle">마감일</div>
	<h3 class="endday"><br>${endday1}년 ${endday2}월 ${endday3}일</h3>
	</c:if>
	<!-- 마감일이 30일보다 적을 때 -->
	<c:if test="${closeDate-nowDate<=30}">
	<p>마감일 : ${endday1}년 ${endday2}월 ${endday3}일</p>
	<h3 class="numdday">D - ${closeDate-nowDate}</h3>
	</c:if>
	</div>
	</c:if>
</c:forEach>
<hr>
<!-- 마감 날짜가 현재 날짜를 지났을때 -->
<h3>채용 마감</h3>
<br>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="deadline" value="${dto.deadline} "/>
	<c:set var="end" value="${deadline.substring(0,4).concat(deadline.substring(5,7).concat(deadline.substring(8,10)))}"/>
	<fmt:parseDate value="${end}" pattern="yyyyMMdd" var="endDate"/>
	<fmt:formatDate value="${endDate}" pattern="yyyyMMdd" var="closeDate"/>
	<c:if test="${closeDate<nowDate}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h3>${dto.jobgroup}</h3><br>
		<c:set var="endday1" value="${deadline.substring(0,4)}"/>
		<c:set var="endday2" value="${deadline.substring(5,7)}"/>
		<c:set var="endday3" value="${deadline.substring(8,10)}"/>
		<p>마감일 : ${endday1}년 ${endday2}월 ${endday3}일</p>
	</div>
	</c:if>
</c:forEach>
</form>
</body>
</html>