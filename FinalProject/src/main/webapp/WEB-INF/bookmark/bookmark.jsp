<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
	button.bookmark_btn{
		background-color: white;
		color: #021B80;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
	}
	button.apply_btn{
		background-color: #021B80;
		color: white;
		border-radius: 20px;
		width: 160px;
		height: 40px;
		line-height: 30px;
		border: 1px solid #021B80;
	}
	div.bookmarkBox{
		border: 1px solid gray;
		width: 230px;
		height: 200px;
		text-align: center;
	}
</style>
</head>
<script type="text/javascript">
window.onload=function(){
	//북마크 하기 버튼을 클릭했을 때 이벤트 주기
	document.getElementById("bookmark_btn").onclick=function(){
		var val=this.getAttribute('value');
		alert(val);
	}
}
</script>
<body>
<div class="bookmarkBox">
<button type="button" class="bookmark_btn" id="bookmark_btn" value="북마크하기">
	<i class="far fa-bookmark"></i>북마크하기
</button>
<br>
<button type="button" class="apply_btn">
	지원하기
</button>
</div>
<div>
	
</div>
</body>
</html>