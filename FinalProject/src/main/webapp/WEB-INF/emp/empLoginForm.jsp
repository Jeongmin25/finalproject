<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
:root{
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--job-blue-color: #021B80;
	--job-blue-border-color: #06b350;
}

body *{
	  font-family: 'ELAND_Choice_M';
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}

.intro-ment-section-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 60px;
	margin-left: 30px;

}
</style>
</head>

<body>

<div class="main-container">
	<div class="main-wrap">
			<section class="intro-ment-section-wrap">
				<h3>관리자 계정 로그인</h3>
			</section>
			<br/><br/>
				<div class="emplogin">
				<form action="/emploginprocess" method="POST" style="margin-left: 40px;">
				<!-- 	<input type="text" name="username" placeholder="Username"/> 
					<br/><br/> -->
					<input type="email" name="email" placeholder="Email" style="width: 465px; height:40px;"/>
					<br/><br/>
					<input type="password" name="password" placeholder="Password" style="width: 465px; height:40px;"/> 
					<br/><br/>
					<button type="submit" class="btn btn-primary" style="width: 465px; height:40px; font-weight: bold;">로그인</button>
				</form>
				</div>
			<br/><br/>
			<a href="/empJoin" style="margin-left: 155px;">계정이 없으신가요? 관리자 계정 만들기</a>
	</div>
</div>
</body>
</html>