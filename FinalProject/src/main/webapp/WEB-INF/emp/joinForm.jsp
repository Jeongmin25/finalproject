<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<h3>관리자 계정 로그인</h3>
<form action="/login" method="POST">
	<input type="text" name="empname" placeholder="기업명"/> 
	<br/><br/>
	<input type="text" name="managername" placeholder="담당자성함"/>
	<br/><br/>
	<input type="text" name="team" placeholder="직책(or팀)"/>
	<br/><br/>
	<input type="text" name="hp" placeholder="연락처"/>
	<br/><br/>
	<input type="email" name="email" placeholder="회사이메일(로그인 아이디로 사용됩니다)"/> 
	<br/><br/>
	<input type="password" name="password" placeholder="6자리 이상 비밀번호"/> 
	<br/><br/>
	<button type="submit" class="btn btn-primary" style="width: 150px;">관리자 계정 생성</button>
	<b>회원가입시 개인정보 처리방침을 읽었으며, 이용약관에 동의하신 것으로 간주합니다.</b>
	<hr>
	<h6 onclick="location.href='loginForm'">이미 가입되어 있으신가요? 로그인하기</h6>
</form>
<br>
</body>
</html>