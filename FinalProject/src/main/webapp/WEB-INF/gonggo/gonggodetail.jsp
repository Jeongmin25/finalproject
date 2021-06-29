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
.emplogo{
max-width: 600px;
max-height: 400px;
min-width: 600px;
min-height: 400px;
}

hr.seon{
border: solid 2px gray;
}
</style>
</head>
<body>
<form class="detail form form-inline">
<img src="../gonggophoto/${dto.empimg}" class="emplogo"><br>
<h2>${dto.jobgroup}</h2>
<h3>${dto.empname}</h3>

<hr class="seon">
${dto.empcontent}<br>
${dto.deadline}<br>
<aside>

</aside>
<button class="update" >공고 수정</button>
<button type="button"class="delete" onclick="location.href='delete?num=${dto.num}'">공고 삭제</button>
</form>
</body>
</html>