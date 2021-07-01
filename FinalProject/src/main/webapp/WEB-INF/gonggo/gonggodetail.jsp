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
<aside>

</aside>
<button type="button" class="golist" onclick="location.href='gonggolist'">목록</button>
<button type="button" class="update" onclick="location.href='updategonggo?num=${dto.num}'">공고 수정</button>
<button type="button" class="delete" onclick="location.href='delete?num=${dto.num}'">공고 삭제</button>
</form>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-6093907a141e311e"></script>
</body>
</html>