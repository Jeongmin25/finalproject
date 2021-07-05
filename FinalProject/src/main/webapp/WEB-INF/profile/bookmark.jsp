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
					<header class="bookmark_bookmarkul_header"></header>
					<div>
						<h3 style="color: black;">${cdto.jobgroup }</h3>
						<h5 style="color: gray">${cdto.empname }</h5>
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
</ul>
</body>
</html>