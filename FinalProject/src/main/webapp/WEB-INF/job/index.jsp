<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
		div.entire{
	border: 1px solid black;
     min-width: 1000px;
   max-width: 1000px;
   margin: auto;
   padding: 10px;
	}
	
	div.nav {
	height: 100px;
	border: 1px solid black;
	z-index: 1;
	}
	
	div.body {
	margin-top : 50px;
	border: 1px solid black;
	}
	
</style>
</head>
<body>
<%

//go를 읽어서 null일경우 body.jsp를 include하고 null이 아닐경우 해당 파일 include
String body="layout/body.jsp";
String go=request.getParameter("go"); //경로 포함한 파일명
//go를 읽었을 때 null이 아니면
if(go!=null)
   body=go;

%>
	<div class="entire">
		<div class="nav">
			<jsp:include page="layout/nav.jsp" />
		</div>
		<div class="body">
			<jsp:include page="<%=body %>"/>
		</div>
	</div>
</body>
</html>