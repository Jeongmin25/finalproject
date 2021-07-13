<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		width: 150px;
		height: 150px;
		min-width: 150px;
		min-height: 150px;
		margin-right: 15px;
		max-height: 150px;
		max-width: 150px;
		background-size: 150px 150px;
		text-align: right;
	}
	div.bookmark_nobookmark{
		border: 0px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left:160px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		text-align: center;
		margin-top: 100px;
	}
	a.gonggo_link:hover{
		text-decoration: none;
	}
	input.searchBookmark_keyword{
	        padding: 0 12px 2px;
	    height: 40px;
	    border: 1px solid #d7dce5;
	    border-radius: 4px;
	    box-sizing: border-box;
	    color: #373f57;
	    font-family: "Malgun Gothic",gulim,dotum,sans-serif;
	    font-size: 14px;
	    letter-spacing: -1px;
	    line-height: 36px;
	    vertical-align: middle;
	    background-color: #fff;
	}
	input.searchBookmark_keyword:focus {
		outline: none;
	}
	div.image{
	width: 200px;
	height: 150px;
	background-size: 200px 150px;
	border-radius: 10px;
}

div.gonggo{
	margin-left: 10px;
	margin-top: 10px;
}

 div.gonggo-box{
 	max-width: 200px;
 	min-width: 200px;
	height: 200px;
	cursor: pointer;
	margin-left:30px;
	margin-bottom: 100px;
	padding-top: 10px;
	float: left;
	border: none;
 }
</style>
</head>
<script type="text/javascript">
window.onload=function(){
	//검색했을 때
	document.getElementById('search_bookmark_icon').onclick=function(){
		var text=document.getElementById('searchBookmark_keyword').value;
		location.href="bookmark?keyword="+text;
	}
}
</script>
<body>
<h2>북마크</h2>
<div style="margin-left: 700px;margin-bottom: 30px;">
	<input type="text" class="searchBookmark_keyword" name="keyword" value="" placeholder="키워드 입력" id="searchBookmark_keyword">
	<i class="fas fa-search" style="cursor: pointer;" id="search_bookmark_icon"></i>
</div>
<ul class="bookmark_ul">
	<c:if test="${cdto.size()==0}">
		<div class="bookmark_nobookmark">
			<h4>북마크 내역이 없습니다.</h4>
			<a href="gonggolist" class="gonggo_link">채용공고 둘러보기<i class="fas fa-chevron-right"></i></a>
		</div>
	</c:if>
	
	<c:if test="${cdto.size()!=0}">
		<c:forEach var="cdto" items="${cdto }">
			<c:set var="end_plan_date" value="${cdto.deadline}" />
			<c:set var="strPlanDate" value="${date}" />
			<fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}"
				integerOnly="true" var="strDate" />
			<fmt:parseDate value="${end_plan_date}" var="endPlanDate"
				pattern="yyyy-MM-dd" />
			<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)+1}"
				integerOnly="true" var="endDate" />

			<c:if test="${(endDate - strDate)<0}">
				<li>
				<div class="gonggo-box">
					<input type="hidden" name="num" value="${cdto.num}">
						<div class="image" style="background-image: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ),url('gonggophoto/${cdto.empimg}');">
							<span class="bookmark fas fa-bookmark" 
								style="float: right; margin: 10px 10px 10px 10px; font-size: 1.3em; color: blue;"
								 onclick="location.href='delBookmark?num=${cdto.num }&pageNum=${currentPage}'"></span>	
								<p style="color: #fff;text-align: center;padding-top: 30%;font-size: 1.1em;">마감</p>
						</div>		
						<div class="gonggo" OnClick="location.href='gonggodetail?num=${cdto.num}'">	
							<h4 class="subject">${cdto.jobgroup}</h5>
							<h5>${cdto.empname }</h4>		
							<h5 style="color:gray">마감일 : ${cdto.deadline }</h5>
						</div>
				</div>
							
			</li>
			</c:if>
			
			<c:if test="${(endDate - strDate)>=0}">
			<li>
				<div class="gonggo-box">
					<input type="hidden" name="num" value="${cdto.num}">
						<div class="image" style="background-image:url('gonggophoto/${cdto.empimg}');">
							<span class="bookmark fas fa-bookmark" 
								style="float: right; margin: 10px 10px 10px 10px; font-size: 1.3em; color: blue;"
								onclick="location.href='delBookmark?num=${cdto.num }&pageNum=${currentPage}'"></span>	
			
						</div>		
						<div class="gonggo" OnClick="location.href='gonggodetail?num=${cdto.num}'">	
							<h4 class="subject">${cdto.jobgroup}</h5>
							<h5>${cdto.empname }</h4>		
							<h5 style="color:gray">마감일 : ${cdto.deadline }</h5>
						</div>
				</div>
			</li>
			</c:if>
		</c:forEach>
	</c:if>
	
</ul>
<!-- 페이지 번호 -->
<div style="width:850px; text-align: center;position: absolute;top: 850px;margin: auto;">
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