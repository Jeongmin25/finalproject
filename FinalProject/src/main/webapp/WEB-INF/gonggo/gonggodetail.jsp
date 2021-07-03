<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.emplogo{
max-width: 600px;
max-height: 400px;
min-width: 600px;
min-height: 400px;
}

hr.seon{
border: solid 2px gray;
}


button.bookmark_btn{
		background-color: white;
		color: #021B80;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
	}
	button.apply_btn{
		background-color: #021B80;
		color: white;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
	}
	div.bookmarkBox{
		border: 1px solid gray;
		width: 300px;
		height: 200px;
		text-align: center;
		position: relative;
	}
	aside.bookmarkBox{
		position: absolute;
		left: 1000px;
		top: 200px;
		float: left;
		border: 1px solid gray;
	}
	div.apply_info_box{
		position: absolute;
		width: 300px;
		height: auto;
		min-height: 200px;
		border: 1px solid gray;
		z-index: 100;
		top: 0px;
		display: none;
		background-color: white;
	}
	div.apply_resumelist{
		border: 1px solid #ccc;
	    width: 200px;
	    height: 40px;
	    color: gray;
	    padding-left: 5px;
	    padding-right: 5px;
	    margin-right: 5px;
	    margin-left: 5px;
	    cursor: pointer;
	    margin-bottom: 10px;
	    text-align: center;
	    line-height: 40px;
	}
</style>
</head>
<script type="text/javascript">
window.onload=function(){
	//북마크 하기 버튼을 클릭했을 때 이벤트 주기
	document.getElementById("bookmark_btn").onclick=function(){
		var ch_book=this.getAttribute('value');
		if(ch_book=="북마크하기"){
			alert("북마크에 저장되었습니다.")
			location.href="gonggodetail?num=${dto.num}&book=yes";
		}else if(ch_book=="북마크완료"){
			location.href="gonggodetail?num=${dto.num}&book=no";
		}
	}
	
	//지원하기를 클릭했을 때 지원창이 뜨는 이벤트
	document.getElementById('apply_btn').onclick=function(){
		document.getElementById("appy_info_box").style.display="block";
	}
	
	//뒤로가기 버튼을 클릭했을 때 이벤트
	document.getElementById("apply_box_backbtn").onclick=function(){
		document.getElementById("appy_info_box").style.display="none";
	}
}
</script>
<body>
<form class="detail form form-inline">
<div class="header">
<img src="../gonggophoto/${dto.empimg}" class="emplogo"><br>
<h2>${dto.jobgroup}</h2>
<h3>${dto.empname}</h3>

</div>
<hr class="seon">
<p>${dto.empcontent}<p><br>
<hr class="seon">
<h4>마감일&nbsp; ${dto.deadline}</h4>
<h4>근무지역 &nbsp;</h4>
<aside class="bookmarkBox">
<div class="bookmarkBox">
<c:if test="${book!='yes' }">
<button type="button" class="bookmark_btn" id="bookmark_btn" value="북마크하기">
	<i class="far fa-bookmark"></i>북마크하기
</button>
</c:if>
<c:if test="${book=='yes' }">
<button type="button" class="bookmark_btn" id="bookmark_btn" value="북마크완료">
	<i class="fas fa-bookmark"></i>북마크완료
</button>
</c:if>
<br>
<button type="button" class="apply_btn" id="apply_btn">
	지원하기
</button>
</div>
<div class="apply_info_box" id="appy_info_box">
<header>
	<h3 style="text-align: center;">지원하기</h3>
	<button type="button" id="apply_box_backbtn">뒤로</button>
</header>
<br>
<table class="apply">
	<caption><b>지원정보</b></caption>
	<tr>
		<th>이름</th>
		<th><sec:authentication property="principal.username"/></th>
	</tr>
	<tr>
		<th>이메일</th>
		<th><sec:authentication property="principal.user.email"/></th>
	</tr>
	<tr>
		<th>연락처</th>
		<th><sec:authentication property="principal.user.hp"/></th>
	</tr>
</table>
<br>
<table>
	<caption><b>첨부파일</b></caption>
	<c:forEach var="rdto" items="${list }" varStatus="n">
		<tr>
			<td>
				<div class="apply_resumelist">
					<div style="float: left;">
						<i class="far fa-square"></i>
						<span>${n.count }번 이력서</span>&nbsp;
						<span>
							<fmt:formatDate value="${rdto.nowdate }" pattern="YYYY-MM-dd"/>
						</span>
					</div>
				</div>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
			<button type="button" onclick="location.href='addresume'">새 이력서 작성</button>
		</td>
	</tr>
</table>
<footer style="text-align: center;">
		<button>제출하기</button>
</footer>
<div>
	
</div>
</div>
</aside>
<button type="button" class="golist" onclick="location.href='gonggolist'">목록</button>
<button type="button" class="update" onclick="location.href='updategonggo?num=${dto.num}'">공고 수정</button>
<button type="button" class="delete" onclick="location.href='delete?num=${dto.num}'">공고 삭제</button>
</form>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6093907a141e311e"></script>
</body>
</html>