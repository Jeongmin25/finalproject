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
</head>
<body>
<form class="list form-inline">
<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>채용 중</h3>
<br>
<div class="addgonggo form-control" OnClick="location.href='writegonggo'">
	<div class="gonggoicon">
	<span class="glyphicon glyphicon-file" ></span>
	<p>공고 작성</p>
	</div>
</div>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="end_plan_date"  value="${dto.deadline}"/>
	<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
	<fmt:parseDate value="${end_plan_date}" var="endPlanDate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
	
	<c:if test="${(endDate - strDate-18807)>=0}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h4 class="subject">${dto.jobgroup}</h4>
	<c:set var="endday1" value="${end_plan_date.substring(0,4)}"/>
	<c:set var="endday2" value="${end_plan_date.substring(5,7)}"/>
	<c:set var="endday3" value="${end_plan_date.substring(8,10)}"/>
	<h5 style="color:gray">마감일 : ${endday1}년 ${endday2}월 ${endday3}일</h5>
	<h3 class="numdday">D - ${(endDate - strDate)-18807}</h3>
	</div>
	</c:if>
</c:forEach>
<hr>
<!-- 마감 날짜가 현재 날짜를 지났을때 -->

<h3>채용 마감</h3>
<br>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="end_plan_date"  value="${dto.deadline}"/>
	<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"/>
	<fmt:parseDate value="${end_plan_date}" var="endPlanDate" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"/>
	
	<c:if test="${(endDate - strDate-18807)<0}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h4 class="subject">${dto.jobgroup}</h4>
		<c:set var="endday1" value="${end_plan_date.substring(0,4)}"/>
		<c:set var="endday2" value="${end_plan_date.substring(5,7)}"/>
		<c:set var="endday3" value="${end_plan_date.substring(8,10)}"/>
		<div class="circle">마감일</div>
	<h3 class="endday"><br>${endday1}년 ${endday2}월 ${endday3}일</h3>
	</div>
	</c:if>
</c:forEach>
</form>
</body>
</html>