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
		background-color: highlight;
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
	}
	
	span.star{
		font-size: 1.4em;
		color: gray;
	}
	
</style>
</head>
<body>
	<div class="menu">
		<button type="button" class="menu btn btn-default"
			onclick="location.href='review'">기업리뷰</button>
		<button type="button" class="menu btn btn-default"
			onclick="location.href='addreview'">my리뷰</button>
	</div>
	<div class="myreview">
		<h1>MY 기업리뷰</h1>
		<br>
		
		<c:if test="${totalCount>=0}">
		<h5 style="color: gray;">${totalCount}개의 기업리뷰를 작성했습니다.</h5>
  	<a href="#demo" class="btn btn-info" data-toggle="collapse">
  	기업리뷰 작성하기>
  	</a>
  	<div id="demo" class="collapse">
  	<div class="statement">
	

    <form action="add" method="post">
    	<input type="hidden" name="email" value="yk@naver.com">
    	
    	<table class="table table-bordered" style="border: none;">
    		<tr>
    			<th colspan="2">기업 리뷰 작성</th>
    		</tr>    		
    		<tr>
    			<th>기업명</th>
    			<td>
    				<input type="text" name="empname" placeholder="기업명을 입력하세요"
    					style="width: 300px; height: 40px;">
    			</td>
    		</tr>
    		<tr>
    			<th>현 직장/전 직장</th>
    			<td>
    				<select name="prenow" style="width: 300px; height: 40px;">
    					<option value="전 직장">전 직장</option>
    					<option value="현 직장">현 직장</option>
    				</select>
    			</td>
    		</tr>
    		<tr>
    			<th>직종</th>
    			<td>
    				<select name="job_group" style="width: 300px; height: 40px;">
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
    				<textarea name="good" style="width: 500px; height: 70px;"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th>기업의 단점</th>
    			<td>
    				<textarea name="bad" style="width: 500px; height: 70px;"></textarea>
    			</td>
    		</tr>
    		<tr>
    			<th colspan="2">기업 평점</th>
    		</tr>
    		<tr>
    			<th>기업 총 평가</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="rating" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="rating" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="rating" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="rating" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="rating"  value="5">
    				</label>   				
    			</td>
    		</tr>
    		<tr>
    			<th>사내문화</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="cul" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="cul" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="cul" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="cul"  value="5">
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>자기개발</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="imp" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="imp" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="imp" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="imp"  value="5">
    				</label>   				
    			</td>
    		</tr>
    		<tr>
    			<th>근무환경</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="env" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="env" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="env" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="env" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="env"  value="5">
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>급여 및 복지</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="sal" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="sal" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="sal" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="sal"  value="5">
    				</label>  				
    			</td>
    		</tr>
    		<tr>
    			<th>경영진</th>
    			<td>
					<label class="radio-inline">
      				<input type="radio" name="ceo" value="1" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="2" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="3" >
    				</label>
     				<label class="radio-inline">
      				<input type="radio" name="ceo" value="4" >
    				</label>
    				<label class="radio-inline">
      				<input type="radio" name="ceo" value="5">
    				</label> 				
    			</td>    			
    		</tr>
    	</table>
    	
    	<button type="submit">제출하기</button>
    </form>
  </div>
	</div>	
	</div>
	</c:if>	
	
</body>

</html>