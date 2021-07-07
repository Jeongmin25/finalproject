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
	
	button.update:hover{
	background-color:  #021B80;
	color: white;	
	} 
	
	button.delete:hover {
	background-color:  #021B80;
	color: white;
	}
	
	div.reviewInfo{
		padding: 10px 10px 10px 10px;
		width: 1000px;
		height: 250px;
		border: 1px solid #eee;
		background-color: #eee;
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
			>
				<tr>
					<td width="70px;" align="center" style="height: 70px;">${n.count }</td>
					<td width="500px;"
						data-toggle="popover" title="${data.empname }" data-placement="bottom"
						data-content="장점 : ${data.good } 단점 : ${data.bad}">${data.empname }</td>
					<td width="100px;" align="right">${data.prenow }</td>
					<td width="100px;" align="right">
						<fmt:formatDate value="${data.writeday}" pattern="MM-dd"/>
					</td>
					<td width="130px;" align="right">
						<!-- 현재날짜, 작성일 -->
						<c:set var="today" value="${date}" />
						<c:set var="writeday" value="${data.writeday}" />
						
						<!-- 기준날짜:현재날짜-7 -->
						<fmt:parseNumber value="${today.time/ (1000*60*60*24)-7}"
							integerOnly="true" var="expired" />
						<fmt:parseDate value="${writeday}" var="wrote"
							pattern="yyyy-MM-dd" />
						<fmt:parseNumber value="${wrote.time/ (1000*60*60*24)}"
							integerOnly="true" var="write" />
							
						<!-- 기준날짜보다 최신 -->
						<c:if test="${expired<write}">
							<button type="button" class="update btn btn-default" 
								num="${data.num }" >수정</button>
							<button type="button" class="delete btn btn-default" 
								num="${data.num }" >삭제</button>
						</c:if>
						
						<!-- 기준날짜보다 지남 -->
						<c:if test="${expired>write}">
							<button class="pastupdate btn btn-default" disabled>수정</button>
							<button class="pastedelete btn btn-default" disabled>삭제</button>
						</c:if>			
					</td>
				</tr>
			</table>
		</c:forEach>
		</div>
	
  		<h3 href="#demo" class="alert alert-default" id="alert" data-toggle="collapse"
  			style="height:100px; border: 1px solid #dcdcdc;
  			padding: 30px 70px 30px 180px;
  			cursor: pointer;">
  			아직 작성하지 않은 리뷰가 있나요? 기업리뷰 작성하기></h3><br><br><br>
  	
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
    	<br><br><br>
    </form>
  </div>
	</div>	
	</div>
	</c:if>	

 <div class="reviewInfo">
 	<h3>기업리뷰 안내사항</h3><br><br>
 	<p>- 현직자 퇴사자가 직접 입력한 데이터로 실제 기업의 내용과 차이가 발생할 수 있으므로 참고하는 자료로 활용하시기를 권장해드립니다.</p><br>
 	<p>- 최초 작성 후 7일까지 수정/삭제가 가능하며 이후에는 수정/삭제가 불가합니다.</p><br>
 	<p>- 본 자료의 저작권은 +JOB에 있으며 동의 없이 재가공 및 재배포 할 수 없음을 알려드립니다.</p><br><br>
 </div>
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

//수정버튼
$("button.update").click(function() {
	
	var num=$(this).attr("num");
	//alert(num);
	
	location.href="updateReview?num="+num;
	
});
</script>
</html>