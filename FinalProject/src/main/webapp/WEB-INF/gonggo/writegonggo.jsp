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
.btn {
width: 120px; 
background-color: #021B80;
border: none;
}
</style>
</head>
<body>
<form action="insert" method="post" enctype="multipart/form-data" class="form form-inline">
<div class="write" style="width: 800px;">
<h2>채용공고 작성</h2><br>

<h3>회사 이름<br><br><!-- account 연결 필요 -->
<input type="text" name="empname" class="form-control"></h3>

<h3>직군/직무<br><br>
<input type="text" name="jobgroup" placeholder="직군 작성" class="form-control"></h3>

<h3>회사 로고</h3>
<input type="file" name="upload" class="form-control">

<h3>공고 내용</h3>
<textarea rows="20" cols="100" class="form-control" name="empcontent" ></textarea>

<h3>마감일</h3>
<input type="date" name="deadline" value="2021-07-14" class="form-control">
<br>
<br>

<button type="submit" class="btn btn-info">업로드</button>
<button type="button" class="btn btn-info" onclick="location.href='gonggolist'">목록</button>
</div>
</form>
</body>
</html>