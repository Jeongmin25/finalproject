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
<h3>회원가입</h3>
<br/>
<form action="/join" method="post">
	이름<br/>
	<input type="text" name="username" placeholder="이름을 입력해주세요" style="width: 300px;"/> 
	<br/><br/>
	휴대폰 번호<br/>
	<input type="tel" name="hp" placeholder="예시) 01034567890" style="width: 300px;"/> 
	<br/><br/>
	이메일<br/>
	<input type="email" name="email" placeholder="Email" style="width: 300px;"/> 
	<br/><br/>
	비밀번호<br/>
	<input type="password" name="password" placeholder="비밀번호를 6자 이상 입력해주세요" style="width: 300px;"/> 
	<br/><br/>
	비밀번호 확인<br/>
	<input type="password" name="password" placeholder="비밀번호를 다시한번 입력해주세요" style="width: 300px;"/> 
	<br/><br/>
	<button type="button" class="btn btn-primary" style="width: 150px;">회원가입</button>
	</form>
</body>
</html>