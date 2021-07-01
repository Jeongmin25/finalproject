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
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<style>
	div.profile_title{
		border: 0px solid gray;
		width: 100px;
		height: 50px;
		margin-bottom: 20px;
	}
	div.profile_personW{
		border: 1px solid #ccc;
		width: 200px;
		height: 400px;
		float: left;
		border-radius: 5px;
		
	}
	div.profile_resume{
		border: 1px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
	}
	
	div.profile_jobGroup{
		border: 1px solid #ccc;
		width: 600px;
		height: 300px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		margin-top: 10px;
	}
	
	div.jobGroup_main{
		border: 1px solid #ccc;
		width: 600px;
		margin-top: 10px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
	}
	
	div.profile_noresume{
		border: 0px solid #ccc;
		width: 600px;
		height: 400px;
		margin-left: 230px;
		border-radius: 5px;
		padding: 10px 10px 10px 10px;
		text-align: center;
		margin-top: 100px;
	}
	
	
	div.profile_img{
		text-align: center;
		padding-top: 20px;
	}
	
	div.profile_img img{
		border-radius: 100px;
		width: 70px;
		height: 70px;
	}
	
	button.profile_update{
		border-radius: 30px;
		width: 100px;
		height: 30px;
		border: 1px solid #eee;
		background-color: white;
	}
	.sel{
		border: 1px solid gray;
		width: 300px;
		height: 30px;
		line-height: 30px;
	}
	.sel:active{
		border: 1px solid gray;
	}
	.sel:focus{
		outline: none;
	}
	
	.textarea{
		border:none;width: 300px;height: 100px;
	}
	.textarea:focus {
		outline: none;
	}
	span.glyphicon-pencil:hover{
		color: blue;
		cursor: pointer;
	}
	
	a.addresume_link:hover{
		text-decoration: none;
	}
</style>
<script type="text/javascript">
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}
</script>
<body>
<c:set var="user_id"><sec:authentication property="principal.user.id"/></c:set>
<div class="profile_entire">
	<div class="profile_title">
		<h4>프로필</h4>
	</div>
	<div class="profile_personW">
		<div class="profile_img">
			<img alt="없음" src="image/profile.png">
			<br><br>
			<h4><sec:authentication property="principal.username"/></h4>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.email"/></h5>
			<h5 style="color: #ccc;"><sec:authentication property="principal.user.hp"/></h5>
			<br>
			<button type="button" class="profile_update" onclick="location.href='personUpdateForm'" style="color: #021B80;">기본정보 수정</button>
		</div>
	</div>
	<div class="jobGroup_main">
		<div class="bookmarks_title" style="float: left;">
			<h4>전문분야 설정</h4>
		</div>
		<br><br>
		<div>
			<table>
				<tr>
					<td>직군</td>
					<td>
						<select>
							<option>개발</option>
							<option>경영 비지니스</option>
							<option>마케팅 광고</option>
							<option>고객서비스 리테일</option>
							<option>영업</option>
							<option>미디어</option>
							<option>인사</option>
							<option>게임 제작</option>
							<option>금융</option>
							<option>엔지니어링 설계</option>
							<option>물류 무역</option>
							<option>의류 제작 바이오</option>
							<option>교육</option>
							<option>법률 법집행기관</option>
							<option>식음료</option>
							<option>건설 시설</option>
							<option>공공 복지</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>