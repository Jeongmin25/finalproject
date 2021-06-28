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
div.bar{
border-radius: 20px 20px;
width: 100px;
height: 40px;
line-height: 30px;
margin-right: 20px;
text-align: center;
font-size: 1.5em;
}
</style>
</head>
<body>
<form class="list form-inline">
<div class="bar form-control">전체</div><div class="bar form-control">채용 중</div><div class="bar form-control">채용마감</div>



<c:set var="now" value="<%=new java.util.Date()%>"/>

<fmt:parseNumber value="${strPlanDate/ (1000*60*60*24)}" integerOnly="true" var="strDate"/>


<br>
<h2>오늘은:  ${now}</h2><br>

<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>채용 중</h3>


<div class="addgonggo form-control" OnClick="location.href='writeform'">
	<div class="gonggoicon">
	<span class="glyphicon glyphicon-file" ></span>
	<p>공고 작성</p>
	</div>
</div>
<c:forEach var="dto" items="${gonggolist}" varStatus="n">
	<c:set var="deadline" value="${dto.deadline} "/>
	<fmt:parseDate value="202112120000" pattern="yyyyMMddHHmm" var="endDate"/>
	<fmt:formatDate value="${now}" pattern="yyyyMMddHHmm" var="nowDate"/>
	<fmt:formatDate value="${endDate}" pattern="yyyyMMddHHmm" var="closeDate"/>
	<%-- <fmt:formatDate value="${dto.deadline }" var="deadline" pattern="YYYY.MM.dd"/>
	<c:set var="endPlanDate" value="${deadline}"/> --%>

	<c:if test="${closeDate>nowDate}">
	<div class="gonggo-box form-control" OnClick="location.href='gonggodetail?num=${dto.num}'">
		<input type="hidden" name="num" value="${dto.num}">
		<h3>${dto.empsubject}</h3>
		<br>
		<b>마감일 :${deadline.substring(0,16)} </b>
		
		<!--<fmt:parseDate value='${dto.deadline}' var='issueDate1' pattern="yyyy-MM-dd" scope="page"/>
		<fmt:formatDate var="endPlanDate"  type="date"  value="${issueDate1}" pattern="yyyy-MM-dd"/>-->
	</div>
	</c:if>
</c:forEach>


</form>
</body>
</html>