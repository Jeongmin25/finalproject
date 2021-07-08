<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
	<link rel="stylesheet" type="text/css" href="css/gonggo.css" />

</head>

<body>

<h2>전체 </h2>
<hr>
<!-- 북마크  -->
 <div class="bookmark-button">
		<button data-attribute-id="explore__bookmarkPage__click" type="button" style="background-color: white; border: none;" onclick="location.href='/bookmark'">
		<svg width="13" height="17" viewBox="0 0 13 17" style="color:#36f"><defs>
		<path id="bookmarkIconFill" d="M6.25 13.21L.905 16.22c-.403.228-.905-.06-.905-.517V.596C0 .267.27 0 .605 0h11.29c.334 0 .605.267.605.596v15.107c0 .458-.502.745-.905.518L6.25 13.209z">
		</path></defs>
		<g fill="none" fill-rule="evenodd" transform="translate(.188)">
		<use fill="currentColor" xlink:href="#bookmarkIconFill"></use></g></svg>
		<span>북마크 모아보기</span><svg width="12" height="12" viewBox="0 0 12 12">
		<path fill="currentColor" d="M4.22 9.72a.75.75 0 001.06 1.06l4.25-4.25a.75.75 0 000-1.06L5.28 1.22a.75.75 0 00-1.06 1.06L7.94 6 4.22 9.72z">
		</path></svg></button>
 </div>	 
<br/>

<form id="tag" method="post" >        
	<div class="position">
		<button type="button" class="btn btn-default btn-ms" data-toggle="collapse" data-target="#demo">
			<span class="tag">태그</span>
		  	<span class="tag_info" style="color: #021B80"><b>딱 맞는 기업찾기</b></span>
		  	<span class="tag_arrow">▼</span>
		</button>
		<br/>
		<div id="demo" class="collapse">
			<div class="statement">
				<br/>
			  <b>기업의 특별한 복지, 혜택 등 태그를 선택하여 <br/>
			  나에게 꼭 맞는 포지션을 찾아보세요!</b>
				<table id="seltag" >
					<tr>
						<td>
						<h5>1. 카테고리 선택</h5>
							<select style="width: 200px; height: 35px;" name="cctg" id="cctg" class="sel form-control" 
							onchange="selectctg(this.value)">
								<option hidden disabled>카테고리</option>
									<option value="보상">보상</option>
									<option value="출퇴근">출퇴근</option>
									<option value="식사/간식">식사/간식</option>
									<option value="기업문화">기업문화</option>
									
							</select>
		          	<br/>
						<h5>2. 태그 선택</h5>
							<select style="width: 200px; height: 35px;" name="hashtag" id="hashtag" class="sel form-control" onchange="selecttag(this.value)">
								<option >해시태그</option>
							</select>
								<!-- <button type="button" class="add" id="btnaddctg">+ 추가</button>-->
							<div id="output1">
							 <c:forEach var="category" items="${category}">
								<div class="form-control">
									<input type="button" name="ctg" id="ctg" value="${category.ctg}"> 
									<span class="remove1 glyphicon glyphicon-remove"></span>
								</div>
							 </c:forEach>
							</div>
							<br/>
							<div id="output2">
							 <c:forEach var="category" items="${category}">
								<div class="form-control">
									<input type="button" name="tag" id="tag" value="${category.tag}"> 
									<span class="remove1 glyphicon glyphicon-remove"></span>
								</div>
							 </c:forEach>        
							</div>
						</td>
					</tr>
				</table>
				<div class="footer">
		          <button type="submit" class="tagconfirm btn btn-defualt" id="tagModalConfirm1" style="margin-left: 200px;">확인</button>
		        </div>
	 		</div>
		</div>
	</div>


<script type="text/javascript">

	function selectctg(c) {
		
		var ipt = document.createElement("input");
		ipt.setAttribute("type","button");
		ipt.setAttribute("class","form-control");
		ipt.setAttribute("name","ctg");
		ipt.setAttribute("id","ctg");
		ipt.setAttribute("value",c);
		var space= document.getElementById("output1");
		var spanx=document.createElement("span");
		spanx.setAttribute("class","remove glyphicon glyphicon-remove");
		//space.appendChild(ipt);
		//space.appendChild(spanx);	
		
	    var pay = ["연봉업계평균이상","연봉상위1%","연봉상위2~5%","연봉상위6~10%","연봉상위11~20%"];
	    var com = ["성과급", "상여금", "연말보너스","스톡옵션"];
	    var work = ["택시비", "차량지원", "재택근무", "원격근무"];
	    var eat = ["조식제공", "중식제공", "석식제공", "식비","커피","간식"];
	    var culture = ["수평적조직", "스타트업", "자율복장", "워크샵"];
	    var hashtag = document.getElementById("hashtag");
	   
	    if(c == "업계연봉수준") var t = pay;
	    else if(c == "보상") var t = com;
	    else if(c == "출퇴근") var t = work;
	    else if(c == "식사/간식") var t = eat;
	    else if(c == "기업문화") var t = culture;
	
	    hashtag.options.length = 0;
	
	    for (x in t) {
	        var opt = document.createElement("option");
	       	opt.setAttribute("type","button");
	        opt.value = t[x];
	        opt.innerHTML = t[x];
	        hashtag.appendChild(opt);
	    }
	}

	function selecttag(t) {
			var ipt = document.createElement("input");
			ipt.setAttribute("type","button");
			ipt.setAttribute("class","form-control");
			ipt.setAttribute("name","tag");
			ipt.setAttribute("id","tag");
			ipt.setAttribute("value",t);
			var space= document.getElementById("output2");
			var spanx=document.createElement("span");
			spanx.setAttribute("class","remove glyphicon glyphicon-remove");
			space.appendChild(ipt);	
			space.appendChild(spanx);	
		
	}
	
	$(document).on("click",".remove1",function(e){
		var r1 = e.target;
		var r2= r1.parentNode;
		r2.parentNode.removeChild(r2);
		
	});
		

	$( document ).ready( function() {
		$( 'button#tagModalConfirm1' ).click( function() {
			var tag = $( 'input#tag' ).val();
			//alert( tag );
			
			$.ajax({
		        type : "post",  
		        url : "/pjlistsearchtag",        
		        data : "tag="+tag,
		        dataType: 'json',
		        
		        error : function(){
		            alert("통신 에러","error","확인",function(){});
		        },
		        
		        
				success : function(data) {
		        	
		        	location.reload();
		        	console.log(data); //list 데이터 확인 
		        	alert("성공!")
		        	
		        		
		        	}	        	
		               	
		        	
		        })	

			})				
		});
	//});
	
</script>
</form>

<br/>

 <form class="list form-inline">
<!-- <input type="hidden" name="empname" value="${dto.empname}"> -->
<br>
<h3>적극 채용 중인 회사</h3>
<hr>
<br>
<c:set var="strPlanDate" value="${date}"/>
<div class="pjlist">
	<c:forEach var="dto" items="${gonggolist}" varStatus="n">	
		<div class="gonggo-box form-control" onclick="location.href='/pjlist/gonggodetail?num=${dto.num}'">
			<input type="hidden" name="num" value="${dto.num}">
			<h4 class="subject">${dto.jobgroup}</h4>
			<h6 class="empname">${dto.empname }</h6>
			<h5 class="job">${dto.job }</h5>
		</div>
	</c:forEach>
</div>
</form>


</body>

</html>