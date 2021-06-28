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
</head>
<style>
	div.profile_title{
		border: 1px solid gray;
		width: 100px;
		height: 50px;
		margin-bottom: 20px;
	}
	div.profile_personW{
		border: 1px solid gray;
		width: 200px;
		height: 400px;
		float: left;
		
	}
	div.profile_personInfo{
		border: 1px solid gray;
		width: 600px;
		height: 400px;
		margin-left: 230px;
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
	input.profile_input{
		/* border: none; */
		BORDER-BOTTOM: 1px solid #eee;
		BORDER-LEFT: medium none;
		BORDER-RIGHT: medium none;
		BORDER-TOP: medium none;
		FONT-SIZE: 10pt


	}
	input.profile_input:focus{
		outline: none;
	}
	button.profile_btn{
		width: 100px;
		height: 40px;
		color: white;
		background-color: #021B80;
		border: none;
		border-radius: 5px;
		float: right;
		margin-right: 20px;
	}
</style>
<script type="text/javascript">
	function selresume(val){
		location.href="profile?num_r="+val;
		
	}
</script>
<body>
<div class="profile_entire">
	<div class="profile_title">
		<h4>프로필</h4>
	</div>
	<div class="profile_personW">
		<div class="profile_img">
			<img alt="없음" src="image/profile.png">
			<br><br>
			<h4>이름</h4>
			<h5 style="color: #ccc;">rlatngus9655@naver.com</h5>
			<h5 style="color: #ccc;">01041639655</h5>
			<br>
			<button type="button" class="profile_update" style="color: #021B80;">기본정보 수정</button>
		</div>
	</div>
	<div class="profile_personInfo">
		<div class="personInfo_title">
			<h4>기본정보 수정</h4>
			<h5 style="color: #ccc;">지원 결과 또는 추천 포지션 정보를 받아볼 이메일/연락처 정보 입력해주세요.</h5>
		</div>
			<br>
		<table>
			<tr>
				<td style="width: 100px;color: #bbb;height: 70px;" >이름</td>
				<td>
					<input style="width: 200px;" class="profile_input">
				</td>
			</tr>
			<tr>
				<td style="width: 100px;color: #bbb;height: 70px;" >이메일</td>
				<td>
					<input style="width: 200px;" class="profile_input">
				</td>
			</tr>
			<tr>
				<td style="width: 100px;color: #bbb;height: 70px;" >연락처</td>
				<td>
					<input style="width: 200px;" class="profile_input">
				</td>
			</tr>
		</table>
		<br>
		<button type="button" class="profile_btn">확인</button>	
	</div>
</div>
</body>
</html>