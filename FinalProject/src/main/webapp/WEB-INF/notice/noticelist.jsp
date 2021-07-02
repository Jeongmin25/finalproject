<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script> 
 <script src="<c:url value="/vendor/datatables/jquery.dataTables.min.js"/> ">  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script type="text/javascript">
 $(document).ready( function () {
    $('#dataTable').DataTable();
    dom: 'iptfl'//데이터테이블위치수정기능추가
} );
 
/* jQuery(function($){
	$("#dataTable").DataTable({
		dom: 'iptfl'
		
			
			
			
			
	});
}); */

</script>
<style type="text/css">

 
</style>
	
</head>
<body>
	<h2>공지사항</h2>

	<!-- DataTales Example -->
	<div class="noticelist">
		<table class="table table-bordered" id="dataTable"
			style="width: 900px;">
			<thead>
				<tr>
					<th bgcolor="#021B80" style="color: white;">번호</th>
					<th bgcolor="#021B80" style="color: white;">카테고리</th>
					<th bgcolor="#021B80" style="color: white;">제목</th>
					<th bgcolor="#021B80" style="color: white;">작성일</th>




				</tr>
			</thead>
			<tfoot>
				<tr>

					<th bgcolor="#021B80" style="color: white;">번호</th>
					<th bgcolor="#021B80" style="color: white;">카테고리</th>
					<th bgcolor="#021B80" style="color: white;">제목</th>
					<th bgcolor="#021B80" style="color: white;">작성일</th>


				</tr>
			</tfoot>
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="a">
					<tr>
						<td>${a.count}</td>
						<td align="center">${dto.category}</td>
						<td><a href="noticecontent?num_n=${dto.num_n}"
							style="color: black;">${dto.subject}</a></td> 
                        <td align="center"><fmt:formatDate value="${dto.writeday}"
										pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>


			</tbody>
		</table>


	</div>

</body>
</html>