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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	i.fa-angle-right:hover {
		color: #176fd8;
	}
	div.apply_noapply{
		border: 0px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left:60px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		text-align: center;
		margin-top: 100px;
	}
	a.gonggo_link:hover{
		text-decoration: none;
	}
		div.myjob_apply{
		border: 1px solid #ccc;
		width: 600px;
		height: 130px;
		margin-left: 230px;
		border-radius: 5px;
		padding-top:30px;
		padding-left:10px;
		margin-top: 50px;
		margin-bottom: 50px;
	}
		div.myjob_apply_div div{
		float: left;
		margin-left: 110px;
		text-align: center;
	}
	div.table-wrap{
		margin-left: 100px;
		margin-top: 40px;
	}
	table.table{
		width: 800px;
	}
	table.table thead{
		background: #F3F9FE;
	}
	table.table tbody tr:hover{
		background: #F3F9FE;
	}
	img.applyFail_empimg{
		border-radius: 100px;
		border: none;
		width: 30px;
		height: 30px;
	}
	div.myjob_apply{
		margin-left: 200px;
	}
	div.apply_default{
		margin-left: 0px;
		margin-top: 20px;
		border: 0px solid gray;
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
 div.image{
	width: 200px;
	height: 150px;
	background-size: 200px 150px;
	border-radius: 10px;
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
<h2>지원 현황</h2>
<div class="myjob_apply">
		<div class="myjob_title"></div>
		<div class="myjob_apply_div">
			<div>
				<span style="font-size: 2em;cursor: pointer;" onclick="location.href='apply'" class="apply_status">${apply_cnt }</span>
				<h5>지원 완료</h5>
			</div>
			<div>
				<span style="font-size: 2em;cursor: pointer;" class="apply_status">0</span>
				<h5>합격</h5>
			</div>
			<div>
				<span style="font-size: 2em;cursor: pointer;" class="apply_status" onclick="location.href='apply?state=fail'">${failCnt }</span>
				<h5>불합격</h5>
			</div>
		</div>
	</div>
<c:if test="${state != 'fail' }">
<div class="apply_default">
<br><br>
<ul class="apply_ul">
	<c:if test="${cdto.size()==0}">
		<div class="apply_noapply">
			<h4>지원 내역이 없습니다.</h4>
			<a href="pjlist" class="gonggo_link">채용공고 둘러보기<i class="fas fa-chevron-right"></i></a>
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
					<div class="image" style="background-image: linear-gradient( rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7) ),url('gonggophoto/${cdto.empimg}');">
						<span class="glyphicon glyphicon-minus" style="color: #021B80;margin-left: 180px;" onclick="delapply(${cdto.num},${currentPage })"></span>
						<p style="color: #fff;text-align: center;padding-top: 25%;font-size: 1.1em;">지원 마감</p>
					</div>	
					<div class="gonggo" >	
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
					<div class="image" style="background-image: url('gonggophoto/${cdto.empimg}');">
						<span class="glyphicon glyphicon-minus" style="color: #021B80;margin-left: 180px" onclick="delapply(${cdto.num},${currentPage })"></span>
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
</div>

  <!-- 페이지 번호 -->
<div style="width:850px; text-align: center;position: absolute;top: 1100px;margin: auto;">
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

</c:if>
  <c:if test="${state == 'fail' }">
	  <c:if test="${failCnt=='0' }">
		 <div style="margin-top: 120px;text-align: center;">
			<h4>불합격한 내역이 없습니다.</h4>
			<a href="pjlist" class="gonggo_link">채용공고 둘러보기<i class="fas fa-chevron-right"></i></a>
		</div>
		  </c:if>
		    <c:if test="${failCnt!='0' }">
		  	<div class="table-wrap">
		 		<table class="table">
		 			<thead>
		 				<tr>
		 					<td style="color: black;text-align: center;max-width: 200px;">지원 회사</td>
		 					<td style="color: black;text-align: center;max-width: 100px;">지원 포지션</td>
		 					<td style="color: black;text-align: center;max-width: 100px;">지원상태</td>
		 				</tr>
		 			</thead>
		 			<tbody>
		 				<c:forEach var="adto" items="${failAdto }">
		 			
		 					<tr align="center" style="cursor: pointer;">
		 						<td><img  src="gonggophoto/${adto.empimg }" class="applyFail_empimg">&nbsp;${adto.empname }</td>
		 						<td>${adto.jobgroup }</td>
		 						<td style="color: #bbb;">불합격</td>
		 					</tr>
		 				</c:forEach>
		 			</tbody>
		 		</table>
		  	</div>
	 	 </c:if>
    </c:if>
  

</body>
</html>