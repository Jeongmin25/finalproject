<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	header.bookmark_bookmarkul_header{
		background-image: url('image/company.png');
		width: 150px;
		height: 150px;
		min-width: 150px;
		min-height: 150px;
		margin-right: 15px;
		max-height: 150px;
		max-width: 150px;
		background-size: cover;
		text-align: right;
	}
	
</style>
</head>
<body>
<h3>북마크</h3>
<ul class="bookmark_ul">
	<c:forEach var="cdto" items="${cdto }">
		<li>
			<a href="gonggodetail?num=${cdto.num }">
				<div style="float: left;">
					<header class="bookmark_bookmarkul_header">
						<i class="fas fa-bookmark" style="color: #021B80;padding-right: 5px;padding-top: 5px;"></i>
					</header>
					<div>
						<h3 style="color: black;">${cdto.jobgroup }</h3>
						<h6 style="color: black;">${cdto.empcontent }</h6>
						<h5 style="color: gray">${cdto.empname }</h5>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
</ul>
<!-- 페이지 번호 -->
<div style="width:850px; text-align: center;position: absolute;top: 750px;margin: auto;">
	<ul class="pagination">
		<!-- 이전페이지 -->
		<c:if test="${startPage>1 }">
			<li><a href="bookmark?pageNum=${startPage-1}">이전</a></li>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<!-- currentPage==pp -->
			<c:if test="${currentPage==pp }">
				<li class="active"><a href="bookmark?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="bookmark?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="bookmark?pageNum=${endPage+1}">다음</a></li>
		</c:if>
	</ul>
</div>
</body>
</html>