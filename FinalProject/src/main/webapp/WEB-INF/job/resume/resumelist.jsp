<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	body{
		background-color: #F8F8FA;
	}
	  div.resume-entire{
	padding-left: 100px;
	padding-right: 100px;
	padding-top: 10px;
	}
	div.gonggoicon{
   width: 75px;
   height: 75px;
   border-radius: 50px 50px 50px;
   border: 0px solid black;
   margin: 28px 35px;
   background-color: #021B80;
}
	div.gonggoicon span{
    font-size:30pt;
    padding: 15px 18px;
    color: white;
 }
 	div.gonggoicon p{
  	width: 100px;
  	padding-top: 20px;
  }
  
  table.resumebox{
  	border: 1px solid #D4D6D0;
  	float: left;
  	margin-left: 10px;
  	margin-bottom: 10px;
  	min-height: 140px;
  	min-width: 170px;
  }
 
  table.resumelist{
  	border: 1px solid #D4D6D0;
  	float: left;
  	margin-left: 10px;
  	margin-bottom: 10px;
  }
  
  div.popup{
  /* 	display: none; */
  }
  span.glyphicon-option-vertical:hover{
	  	cursor: pointer;
   }
  div.popup{
  	display: none;
  	border: 1px solid gray;
  	background-color: white;
  }
  
 li a{
 	text-decoration: none;
 	color: black;
 }
 li a:hover{
	background-color: #eee;
	color: black;
}
 
</style>
<script type="text/javascript">
window.onload=function(){
	
	 var list=document.querySelectorAll("#vertical-menu");
	
	for(i=0;i<list.length;i++){
		list[i].onclick=function(e){
			var t= e.target.offsetTop;//상단 좌표
			var l= e.target.offsetLeft;//좌측 좌표
			
			var popup= document.getElementById("popup");
			popup.style.zIndex="10";
			popup.style.position="absolute";
			popup.style.top=t+10+"px";
			popup.style.left=l-100+"px";
			popup.style.display="block";
		}
	} 
}
</script>
</head>
<body>
<div class="resume-entire">
<table class="resumebox" onclick="location.href='addresume'" style="cursor: pointer;">
 	<tr>
 		<td>
 			<div class="gonggoicon">
   			<span class="glyphicon glyphicon-file" ></span>
   			<p style="color: #495057;text-align: center;">새 이력서 작성</p>
   			</div>
 		</td>
 	</tr>
</table>
<c:forEach var="dto" items="${list }" varStatus="n">
	<table class="resumelist" id="resumelist">
		<tr>
			<td align="left" style="width: 170px;height: 120px;">
				<h4 style="color:#868e96;">${n.count }이름</h4>
				<h5 style="color:#adb5bd;"><fmt:formatDate value="${dto.nowdate }" pattern="yyyy.MM.dd"/></h5><br><br>
			</td>
		</tr>
		<tr>
			<td align="right" style="background-color: #F1F3EF">
				<span class="glyphicon glyphicon-option-vertical" style="color:#868e96;" id="vertical-menu"></span>
			</td>
		</tr>
	</table>
</c:forEach>
<div class="popup" id="popup">
		<ul>
			<li><a href="#">다운로드</a></li>
			<li><a href="#">삭제</a></li>
		</ul>
	</div>
</div>
</body>
</html>