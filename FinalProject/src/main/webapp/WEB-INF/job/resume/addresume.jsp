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
	div.explanation{
		background-color: #eee
	}
	
	button.add{
		color: #021B80;
		border: none;
		font-weight: bold;
		font-size: 1.1em;
	}
	
	input.day{
		border: none;
		font-size: 0.8em;
	}
	
	input.school{
		font-weight: bold;
	}
	
	input.major{
		font-size: 0.9em;
	}
	
	input:focus{outline: none;}
</style>
<script type="text/javascript">
window.onload = function() {
	
	

	
	//경력 추가버튼을 클릭했을 때 이벤트
	document.getElementById('btnaddcarer').onclick=function(){
		
	//객체 생성
	var tr=document.createElement("tr");
	var td1=document.createElement("td");
	var td2=document.createElement("td");
	var td3=document.createElement("td");
	var startday=document.createElement("input");
	var endday=document.createElement("input");
	var company=document.createElement("input");
	var depart=document.createElement("input");
	var spanx=document.createElement("span");
	
	//객체 속성,css지정
	spanx.setAttribute("class","glyphicon glyphicon-remove");
	
	startday.setAttribute("placeholder","YYYY-MM");
	startday.setAttribute("class","day");
	endday.setAttribute("placeholder","YYYY-MM");
	endday.setAttribute("class","day");

	company.style.border="none";
	company.style.fontWeight="bold";
	company.setAttribute("placeholder","회사명");
	
	depart.style.border="none";
	depart.style.fontSize="0.9em";
	depart.setAttribute("placeholder","부서명/직책");
	
	//객체에 삽입
	var addcarer=document.getElementById("addcarer");
	addcarer.appendChild(tr);
	tr.appendChild(td1);
	tr.appendChild(td2);
	tr.appendChild(td3);
	td1.appendChild(startday);
	td1.appendChild(endday);
	
	td2.appendChild(company);
	
	td3.appendChild(depart);
	td3.appendChild(spanx);
		
		
	}
	
	//학력 추가 버튼을 클릭했을 때 이벤트
	document.getElementById('btnaddedu').onclick=function(){
		
		//객체 생성
		var tr=document.createElement("tr");
		var td1=document.createElement("td");
		var td2=document.createElement("td");
		var td3=document.createElement("td");
		var startday=document.createElement("input");
		var endday=document.createElement("input");
		var company=document.createElement("input");
		var depart=document.createElement("input");
		var spanx=document.createElement("span");
		
		//객체 속성,css지정
		spanx.setAttribute("class","glyphicon glyphicon-remove");
		
		startday.setAttribute("placeholder","YYYY-MM");
		startday.setAttribute("class","day");
		endday.setAttribute("placeholder","YYYY-MM");
		endday.setAttribute("class","day");

		company.style.border="none";
		company.style.fontWeight="bold";
		company.setAttribute("placeholder","학교명");
		
		depart.style.border="none";
		depart.style.fontSize="0.9em";
		depart.setAttribute("placeholder","전공 및 학위");
		
		//객체에 삽입
		var addedu=document.getElementById("addedu");
		addedu.appendChild(tr);
		tr.appendChild(td1);
		tr.appendChild(td2);
		tr.appendChild(td3);
		td1.appendChild(startday);
		td1.appendChild(endday);
		
		td2.appendChild(company);
		
		td3.appendChild(depart);
		td3.appendChild(spanx);
			
	}
}	

function searchskill() {
	var autoInput=document.getElementById('autoInput').innerHTML;
	alert(autoInput);
	$.ajax({
		type:"get",
		url:"http://api.dataatwork.org/v1/skills/normalize?skill_name="+autoInput,
		data:{"skill_name":autoInput},
		dataType:"json",
		success:function(data){
			alert(data.length);
		}
	});
}

</script>
</head>
<body>
<form action="">
<h2>이름</h2>
<br><br>
<h5>이름</h5>
<h5>이메일</h5>
<h5>핸드폰</h5>
<br><br><br>
<div class="intro">
<h5>간단 소개글</h5>
<hr>
<div class="explanation">
	<h6>• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요. </h6>
	<h6>• 3~5줄로 요약하여 작성하는 것을 추천합니다! </h6>
</div>
<textarea class="intro" name="intro" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요.(3~5줄 권장)"  style="width: 800px;height: 200px;border: none"></textarea>
</div>
<br><br>

<div class="carer">
<h5>경력</h5>
<hr>
<div class="explanation">
	<h6>• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요.  </h6>
	<h6>• 경력사항이 없는 경우 '신입'으로 작성해주세요. </h6>
	<h6>• 업무 성과는 되도록 구체적인 숫자 혹은 %로 표현해주세요!</h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddcarer">+ 추가</button>
<br><br>
<table id="addcarer">
	<tr>
		<td>
			<input name="startday" style="border: none;font-size: 0.8em;" placeholder="YYYY-MM">-<input name="endday" style="border: none;font-size: 0.8em;" placeholder="YYYY-MM">
		</td>
		<td><input style="border: none;font-weight: bold;" placeholder="회사명" name="company"></td>
		<td><input style="border: none;font-size: 0.9em;" placeholder="부서명/직책" name="depart"><span class="glyphicon glyphicon-remove"></span></td>
	</tr>
</table>
</div>
<br><br>

<div class="edu">
<h5>학력</h5>
<hr>
<div class="explanation">
	<h6>• 최신순으로 작성해주세요. </h6>
</div>
<br><br>
<button type="button" class="add" id="btnaddedu">+ 추가</button>
<table id="addedu">
</table>
</div>

<div class="skill">
<h5>스킬</h5>
<hr>
<div class="explanation">
	<h6>• 개발 스택, 디자인 툴, 마케팅 툴 등 가지고 있는 직무와 관련된 스킬을 추가해보세요.</h6>
	<h6>• 데이터 분석 툴이나 협업 툴 등의 사용해본 경험이 있으신 툴들도 추가해보세요.</h6>
</div>
<br><br>
<input type="text" style="border: none;" placeholder="보유 스킬을 검색해주세요" id="autoInput" onkeyup="searchskill()">
<table id="addedu">
</table>
</div>
<br><br>
</form>
</body>
</html>