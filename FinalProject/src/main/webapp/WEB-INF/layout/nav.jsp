<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
</head>
<body>
<div class="logo">
	<img src="/image/loggo.png">
</div>
<div id="nav" class="container-fluid">
			<nav class="navbar navbar-default">
				<ul class="navcategory">
					<li id="gg"><a>채용공고</a>
					</li>
					<li id="ch"><a>추천공고</a>
					</li>
					<li id="gc"><a >기업정보</a>
						<div>
							<ul class="info">
								<li><a>기업 리뷰</a></li>
								<li><a>직군별 연봉</a></li>
								<li><a>최신뉴스</a></li>
							</ul>
						</div></li>
					<li id="gs"><a>Mypage</a>
						<div>
							<ul class="Mypage">
							</ul>
						</div></li>
					<li id="gs"><a>고객센터</a>
						<div>
							<ul class="Support">
							<li><a>자주하는 질문</a></li>
								<li><a>공지사항</a></li>
							</ul>
						</div></li>
					<li id="log">
						<li>
						<div>
							<a onclick="location.href='/user/login'">회원가입/로그인</a>
						</div>
						</li>
	 					<li>
	 						<button type="button" class="btn btn-default"
	 						onclick="location.href='/empLogin'">기업서비스</button>
	 					</li>
 					</li>
				</ul>
			</nav>
		</div>
</body>
</html>