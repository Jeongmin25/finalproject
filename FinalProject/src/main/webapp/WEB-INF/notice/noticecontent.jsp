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

	


</style>
</head>
<body>
	<table class="table table-bordered" id="noticecontent"
		style="width: 600px;">

		<tr>
			<td><b style="font-size: 1.5em;">${dto.subject}</b> <span
				style="color: gray; float: right;"> <fmt:formatDate
						value="${dto.writeday}" pattern="yyyy-MM-dd" />
			</span></td>
		</tr>
		<tr>
			<td>카테고리:<b style="margin-right: 20px;">${dto.category}</b>작성자:<b>${dto.writer}</b>
				<span style="float: right;">조회 ${dto.viewcount}</span>
			</td>
		</tr>
		<tr>
			<td><pre>${dto.content}</pre> <br> <c:if
					test="${dto.photo!='no'}">

					<img src="/noticephoto/${dto.photo}" style="max-width: 200px;">

				</c:if></td>
		</tr>
		<tr>
			<td align="center">
			<button type="button"
				style="width: 80px; background-color: #021B80; color: white; border-radius: 5px;"
				onclick="location.href='notice'">목록</button>
			</td>
		</tr>
	</table>

</body>
</html>