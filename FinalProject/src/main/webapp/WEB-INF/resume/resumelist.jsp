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
  
  span.glyphicon-option-vertical:hover{
	  	cursor: pointer;
   }
  div.popup{
  	display: none;
  	border: 1px solid gray;
  	background-color: white;
  	width: 130px;
  }
  
  div.popup *{
  	color: #495057;
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
//선택한 이력서 num을 전역 변수로 설정
var num_r;

window.onload=function(){
	
	//:를 클릭했을 때 다운로드, 삭제 poopup 띄우기
	var list=document.querySelectorAll("#vertical-menu");
	
	for(var i=0;i<list.length;i++){
		list[i].onclick=function(e){
			var t= e.target.offsetTop;//상단 좌표
			var l= e.target.offsetLeft;//좌측 좌표
			num_r=e.target.getAttribute('num');
			
			var popup= document.getElementById("popup");
			popup.style.zIndex="10";
			popup.style.position="absolute";
			popup.style.top=t+10+"px";
			popup.style.left=l-100+"px";
			popup.style.display="block";
			popup.setAttribute("num",num_r);
			
			
			
			
			
		}
	} 
}

//각자 이력서 다운로드, 삭제 이벤트
function godown(e){
	location.href="downresume?num_r="+num_r;
}

function godel(e){
	location.href="delresume?num_r="+num_r;
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
		<tr onclick="location.href='resumedetail?num_r=${dto.num_r}'">
			<td align="left" style="width: 170px;height: 120px;">
				<h4 style="color:#868e96;">이름</h4>
				<h5 style="color:#adb5bd;"><fmt:formatDate value="${dto.nowdate }" pattern="yyyy.MM.dd"/></h5><br><br>
			</td>
		</tr>
		<tr>
			<td align="right" style="background-color: #F1F3EF">
				<span class="glyphicon glyphicon-option-vertical" style="color:#868e96;" id="vertical-menu" num="${dto.num_r }"></span>
			</td>
		</tr>
	</table>
	
	<div class="popup" id="popup" >
		<ul>
			<li onclick="godown()">다운로드</li>
			<li onclick="godel()">삭제</li>
		</ul>
	</div>
</c:forEach>
	
</div>
</body>
</html>