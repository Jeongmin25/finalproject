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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	header.apply_applyul_header{
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
	i.fa-angle-right:hover {
		color: #176fd8;
	}
	div.apply_noapply{
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
</style>
<script type="text/javascript">
function delapply(num,pageNum){
	alert("지원을 취소하였습니다.");
	location.href="delapply?num="+num+"&pageNum="+pageNum;
}
</script>
</head>
<body>
<h3>지원 현황</h3>
<ul class="apply_ul">
	<c:if test="${cdto.size()==0}">
		<div class="apply_noapply">
			<h4>지원 내역이 없습니다.</h4>
			<a href="gonggolist" class="gonggo_link">채용공고 둘러보기<i class="fas fa-chevron-right"></i></a>
		</div>
	</c:if>
	<c:if test="${cdto.size()!=0}">
	<c:forEach var="cdto" items="${cdto }">
		<li>
			<a>
				<div style="float: left;margin-left: 10px;">
					<header class="apply_applyul_header" style="background-image: url('gongophoto/${cdto.empimg}');">
						<span class="glyphicon glyphicon-minus" style="color: #021B80;margin-right: 5px;" onclick="delapply(${cdto.num},${currentPage })"></span>
					</header>
					<div>
						<h3 style="color: black;">${cdto.jobgroup }</h3>
						<h6 style="color: black;">${cdto.job }</h6>
						<h5 style="color: gray">${cdto.empname }<i class="fas fa-angle-right" onclick="location.href='gonggodetail?num=${cdto.num}'" style="margin-left: 90px;"></i></h5>
						
					</div>
				</div>
			</a>
		</li>
	</c:forEach>
	</c:if>
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
				<li class="active"><a href="apply?pageNum=${pp }">${pp }</a></li>
			</c:if>
			<!-- currentPage!=pp -->
			<c:if test="${currentPage!=pp }">
				<li><a href="apply?pageNum=${pp }">${pp }</a></li>
			</c:if>
		</c:forEach>
		
		<!-- 다음페이지 -->
		<c:if test="${endPage<totalPage }">
			<li><a href="apply?pageNum=${endPage+1}">다음</a></li>
		</c:if>
	</ul>
</div>

  
</body>
</html>