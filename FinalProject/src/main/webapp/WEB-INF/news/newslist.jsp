<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	div.newstitle{
		width: 900px;
		height: 200px;
		border: 1px solid #ccc;
		padding: 20px 20px 20px 20px;
	}
	
	div.newsmenu{
		width: 900px;
		height: 70px;
		border: 1px solid gray;
	}
	
	div.newslist{
		width: 900px;
		cursor: pointer;
	}
	
	.newstable:active{
		background-color: #dcdcdc;
	}
	
	#latestTitle{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
<h1>최신뉴스</h1><br>
<div class="newstitle">
	<c:forEach var="news" items="${latest}" varStatus="n">
		<table style="width: 900px;">
			<tr>
				<td style="width: 800px;">
					<a href="newsdetail?num=${news.num}" id="latestTitle">
						<img alt="" src="../image/new.PNG" style="float: left;">	
						<h4>${news.title}</h4>
					</a>
				</td>
				<td align="right;">
					<h5 style="color: gray;">
					<fmt:formatDate value="${news.writeday}" pattern="MM-dd" />
					</h5>
				</td>
			</tr>
	</table>
</c:forEach>
</div>

<br><br><br>

<!-- 뉴스 게시글 개수 -->
<c:set var="count" value="${totalCount}" />
<h4>총 ${count}개</h4>

<div class="newslist">
	<c:forEach var="news" items="${list}" varStatus="n">
		<table class="newstable table table" num="${news.num}" style="width: 900px;">
			<tr>
				<td style="width:210px; height: 150px;">
					<img src="../newsImage/${news.image}" style="max-width: 200px; max-height: 150px;">
				</td>
				<td>
					<h4>${news.title}</h4>
					<br>
					<h5 style="color: gray;">${news.content}</h5>
					<br>
					<h5>
						<fmt:formatDate value="${news.writeday}" pattern="yyyy-MM-dd"/> | 
						<span class="glyphicon glyphicon-eye-open" style="font-size: 1.2em;"></span>
						${news.readcount}
					</h5>
				</td>
			</tr>
	</table>
</c:forEach>
</div>

<!-- 페이지 번호 -->
<div style="width: 800px; text-align: center;">
	<ul class="pagination">
		<!-- 이전페이지 -->
		<c:if test="${startPage>1 }">
			<li><a href="news?pageNum=${startPage-1}">◁이전</a></li>
		</c:if>
		
		<!-- 페이지번호 -->
		<c:forEach var="pp" begin="${startPage }" end="${endPage }">
			<!-- currentPage==pp -->
			<c:if test="${currentPage==pp }">
				<li class="active" ><a href="news?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="news?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="news?pageNum=${endPage+1}">다음▷</a></li>
		</c:if>
	</ul>
</div>
</body>
<script type="text/javascript">

//테이블 클릭 이벤트(상세페이지 이동)
$(".newstable").click(function() {
	//num값 저장
	var num=$(this).attr("num");
	//alert(num);
	
	//num값을 컨트롤러로 전달
	location.href="/newsdetail?num="+num;
});
</script>
</html>