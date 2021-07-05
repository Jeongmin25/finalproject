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
	#btnlist {
	
		
		
			width: 80px; 
			background-color: #021B80; 
			color: white; 
			border-radius: 5px;
			
		
	
	}
	


</style>
</head>
<body>
	<h2>공지사항</h2>
	
	<hr style="border: solid 1px black;">

	<b style="font-size: 1.5em;">${dto.subject}</b>
	 <b style="color: gray; float: right;"> 
	 	<fmt:formatDate value="${dto.writeday}"pattern="yyyy-MM-dd"/>
			</b>

			<br><br>카테고리:<b style="margin-right: 20px;">${dto.category}</b>작성자:<b>${dto.writer}</b>

				<span style="float: right;">조회 ${dto.viewcount}</span>
				
				<br><br><br><br>
		<h2>${dto.content}</h2> <br> <c:if test="${dto.photo!='no'}">
		
					<img src="/noticephoto/${dto.photo}" style="max-width: 500px;">

					</c:if>
				
		<hr style="border: solid 1px black;">		

			<button type="button" id="btnlist" style="float: right;"
				
				onclick="location.href='notice'">목록</button>

</body>
</html>