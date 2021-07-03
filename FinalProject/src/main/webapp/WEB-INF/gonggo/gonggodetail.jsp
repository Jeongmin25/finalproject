<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
div.one{
 border: 2px solid #021B80;
    border-radius: 20px 20px;
    font-size: 1.2em;
    color: gray;
    width: 100px;
    padding-left: 10px;
}
</style>
</head>
<body>
<form action="#" class="gonggodetail">
<div class="header">
<img src="../gonggophoto/${dto.empimg}" class="emplogo"><br>
<h2>${dto.jobgroup}</h2>
<h3>${dto.empname}</h3>
<c:forEach var="cdto" items="${cdto}">
<div class="one">${cdto.tag}</div>
</c:forEach>
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