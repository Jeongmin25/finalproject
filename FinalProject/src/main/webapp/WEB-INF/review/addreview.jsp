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
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">

	div.menu{
		margin-top: 10px;
		margin-left: 10px;
		margin-bottom: 50px;
	}
	button.menu:hover{
		background-color:  #021B80;
		color: white;
	}
	
	div.myreview{
		margin-left: 10px;
	}
	
	div.infomation{
		background-color: #eee;
		padding: 20px 20px 20px 20px;
	}
	
	div.statement{
		font-size: 1.4em;
		margin-top: 100px;
	}
	
	span.star{
		font-size: 1.4em;
		color: gray;
	}
	
	div.mylist{
		margin-bottom: 50px;
	}
	
	table.reviewtable{
		cursor: pointer;
	}
	
	table.reviewtable:hover{
		background-color: #eee;
	}
	
	div.menu button.menu{
		border-radius: 20px;
		width: 150px;
	}
	
	#alert:hover {
	background-color:  #021B80;
	color: white;
	}
	
	button.delete:hover {
	background-color:  #021B80;
	color: white;
	}
	
</style>
</head>
<body>
	<!-- 로그인 username -->
	<c:set var="email" value="${auth }"/>
	<div class="menu">
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='review'">기업리뷰</button>
		<button type="button" class="menu btn btn-default btn-lg"
			onclick="location.href='addreview'">my리뷰</button>
	</div>
	<div class="myreview">
		<h1>MY 기업리뷰 (${email }님)</h1>
		<br>
		<c:if test="${totalCount>=0}">
		<h4 style="color: gray;">${totalCount}개의 기업리뷰를 작성했습니다.</h4>
		<br>
		<!-- 작성리뷰 출력 -->
		<div class="mylist">
		<c:forEach var="data" items="${list }" varStatus="n">
			<table class="reviewtable table table" style="font-size: 1.3em;"
			data-toggle="popover" title="${data.empname }" data-placement="bottom"
			data-content="장점 : ${data.good } 단점 : ${data.bad}">
				<tr>
					<td width="70px;" align="center" style="height: 70px;">${n.count }</td>
					<td width="500px;">${data.empname }</td>
					<td width="100px;" align="right">${data.prenow }</td>
					<td width="100px;" align="right">
						<fmt:formatDate value="${data.writeday}" pattern="MM-dd"/>
					</td>
					<td width="100px;" align="right">
						<button type="button" class="delete btn btn-default" 
							num="${data.num }" >삭제</button>
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
	
  		<h3 href="#demo" class="alert alert-default" id="alert" data-toggle="collapse"
  			style="height:100px; border: 1px solid #dcdcdc;
  			padding: 30px 70px 30px 180px;
  			cursor: pointer;">
  			아직 작성하지 않은 리뷰가 있나요? 기업리뷰 작성하기></h3>
  	
	<!-- 리뷰작성 폼 -->
  	<div id="demo" class="collapse">
  	<div class="statement">
    <form action="add" method="post">
    	<input type="hidden" name="email" value="${email }">
    	
    	<table class="formtable table" style=" width: 700px; margin-left: 100px; border: 1px solid #ccc;">
    		<tr>
    			<th colspan="2" style="text-align: center; height: 150px;
    				font-size: 2em; line-height: 150px;">기업 리뷰 작성</th>
    		</tr>    		
    		<tr>
    			<th>기업명</th>
    			<td>
    				<input type="text" name="empname" placeholder="기업명을 입력하세요"
    					style="width: 300px; height: 40px;" required="required">
    			</td>
    		</tr>
    		<tr>
    			<th>현 직장/전 직장</th>
    			<td>
    				<select name="prenow" style="width: 300px; height: 40px;" required="required">
    					<option value="전 직장">전 직장</option>
    					<option value="현 직장">현 직장</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>직종</th>
    			<td>
    				<select name="job_group" style="width: 300px; height: 40px;" required="required">
    					<option value="IT/인터넷">IT/인터넷</option>
    					<option value="경영/기획/컨설팅">경영/기획/컨설팅</option>
    					<option value="디자인">디자인</option>
    					<option value="미디어/홍보/마케팅">미디어/홍보/마케팅</option>
    					<option value="생산/제조">생산/제조</option>
    					<option value="유통/무역">유통/무역</option>
    					<option value="서비스/고객지원">서비스/고객지원</option>
    					<option value="인사/총무">인사/총무</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>기업의 장점</th>
    			<td>
    				<textarea name="good" style="width: 500px; height: 70px;" required="required"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th>기업의 단점</th>
    			<td>
    				<textarea name="bad" style="width: 500px; height: 70px;" required="required"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th colspan="2" style="text-align: center; height: 150px;
    				font-size: 2em; line-height: 150px;">기업 평점</th>
    		</tr>
    		<tr>
    			<th >기업 총 평가 *</th>
				<td>
					<label class="radio-inline" style="margin-left: 50px;">
      				<input type="radio" name="rating" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="rating" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline"> 
      				<input type="radio" name="rating" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="rating" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="rating"  value="5"> 5
    				</label>  
				</td>
			</tr>
    		<tr>
    			<th>사내문화</th>
    			<td>
					<label class="radio-inline" style="margin-left: 50px;">
      				<input type="radio" name="cul" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="cul" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="cul"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>자기개발</th>
    			<td>
					<label class="radio-inline" style="margin-left: 50px;"> 
      				<input type="radio" name="imp" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="imp" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="imp"  value="5"> 5
    				</label>   				
    			</td>
    		</tr>
    		<tr>
    			<th>근무환경</th>
    			<td>
					<label class="radio-inline" style="margin-left: 50px;">
      				<input type="radio" name="env" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env" value="2" > 2
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env" value="3" > 3 
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="env" value="4" > 4 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="env"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>급여 및 복지</th>
    			<td>
					<label class="radio-inline" style="margin-left: 50px;">
      				<input type="radio" name="sal" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="sal" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="sal"  value="5"> 5
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>경영진</th>
    			<td>
					<label class="radio-inline" style="margin-left: 50px;">
      				<input type="radio" name="ceo" value="1" > 1
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="2" > 2 
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="3" > 3
    				</label>&nbsp;
     				<label class="radio-inline">
      				<input type="radio" name="ceo" value="4" > 4
    				</label>&nbsp;
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="5"> 5
    				</label> 				
    			</td>    			
    		</tr>
    	</table>
    	<br>
    	<button type="submit" class="btnsubmit btn-default btn-lg" style="margin-left: 400px;">제출하기</button>
    	<br>
    </form>
  </div>
	</div>	
	</div>
	</c:if>	
	
</body>
<script>

//팝오버 - 내용확인
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});

//삭제버튼
$(".delete").click(function() {
	
	var num=$(this).attr("num");
	//alert(num);
	
	location.href="deleteReview?num="+num;
	alert("삭제되었습니다.");
});
</script>
</html>