<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
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
	
	div.text {
		font-size: 1.3em;
	}
	
	pre.content{
 	text-decoration:none;
 	background-color:white;
 	font-family:'ELAND_Choice_M';
 	font-size:1em;
 	border:none;
    padding:10px;
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
}  



	


</style>
</head>
<body>
	<div class="content">
	<h2>공지사항</h2>
	<br>

	<h2 style="margin-left: 20px;">${dto.subject}</h2>
		

	 	<span style="margin-left: 20px; color: gray;">
	 		<fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd" /> | &nbsp;
	 		<span class="glyphicon glyphicon-eye-open" >${dto.viewcount}</span>
		</span> 
 		<Br>
 		<hr>
			
				
			<br>
			<pre class="content">${dto.content}</pre><br> 
		
					<img src="/noticephoto/${dto.photo}" style="max-width: 600px; margin-bottom: 50px;"onerror="this.src='/noticephoto/+job.png'">
		<hr>		

				
	</div>
			<button type="button" id="btnlist" style="margin-left: 400px;"
				onclick="location.href='notice'">목록</button><BR>
</body>
</html>