<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

 

    <!-- Custom styles for this template-->
    <link href="/acss/sb-admin-2.min.css" rel="stylesheet">
    <style type="text/css">
    	#noticeadd {
    		position: absolute;
    		top: 150px;
    		left:400px;  	
    	}
    	
    	#btnlogout {
	text-align: left;
	width: 130px;
	background-color: #021B80; 
	color:white;
	border-radius: 5px;" 
		
	
	}
     
    </style> 
</head>


<body id="page-top">

 
    <!-- Page Wrapper -->
    <div id="wrapper">

 
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

 
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" >
                <img class="img-profile rounded-circle" src="/img/p.png" style="width:50px;">
                <div class="sidebar-brand-text mx-3">Job+</div>   
           </a>

 

            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">

                <a class="nav-link" href="#">

                    <i class="fas fa-user-cog"></i>

                    <span>관리자페이지</span></a>

            </li>

            <!-- Divider -->

            <hr class="sidebar-divider">

            

             <!-- Heading -->

            <div class="sidebar-heading">

            </div>

 

            <!-- Nav Item - Pages Collapse Menu -->
               <li class="nav-item">
                <button type="button" 
                id="btnlogout"
                data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo"
                    onclick="location.href='/adminlogout'">
                  <i class="fas fa-sign-out-alt"></i>
                    <span>로그아웃</span></button>
                </a>
            </li>
            

            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminnotice/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-exclamation"></i>
                    <span>공지관리</span>
                </a>
            </li>

            

              <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminmember/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                   <i class="fas fa-users-cog"></i>
                    <span>회원관리</span>
                </a>
            </li>

            

             <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminmember/elist" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-users"></i>
                    <span>기업회원관리</span>
                </a>
            </li>
            
             <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/admingonggo/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-users"></i>
                    <span>채용공고관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link collapsed" href="/admin2/adminreview/list" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                  <i class="fas fa-edit"></i>
                    <span>기업리뷰관리</span>
                </a>
            </li>
              

           

            <!-- Divider -->

            <hr class="sidebar-divider d-none d-md-block">

 

            <!-- Sidebar Toggler (Sidebar) -->

            <div class="text-center d-none d-md-inline">

                <button class="rounded-circle border-0" id="sidebarToggle"></button>

            </div>

 

           

        </ul>

        <!-- End of Sidebar -->

 

        <!-- Content Wrapper -->

        <div id="content-wrapper" class="d-flex flex-column">

 

            <!-- Main Content -->

            <div id="content">

 

                <!-- Topbar -->

                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

 

                    <!-- Sidebar Toggle (Topbar) -->

                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

 

                   

 

                <!-- Begin Page Content -->

                <div class="container-fluid">

 

                    <!-- Page Heading -->

                    <h1 class="h3 mb-4 text-gray-800"></h1>

                    <form action="insert" method="post" enctype="multipart/form-data">
                    	<!-- hidden -->
						<input type="hidden" name="num_n" value="${num_n}">
				
                    	<table class="table table-bordered" id="noticeadd" style="width:600px;">

                    	<tr>
                    		<th colspan="4" bgcolor="#021B80" style="color:white;font-size: 10pt;"><b>공지글 등록</b></th>
                    	</tr>
                    		<tr>
                    			<td width="90" bgcolor="#021B80" style="color:white;font-size: 10pt;">카테고리</td>
                    			<td><select name="category" required="required">
									<option value="공지">공지</option>
									<option value="안내">안내</option>
									<option value="기타">기타</option>
									<option value="이벤트">이벤트</option>	
								</select></td>	
                    			<td width="100" bgcolor="#021B80" style="color:white;font-size: 10pt;">작성자</td>
                    			<td>
                    				<input type="text" name="writer" 
                    				class="form-control" required="required" >
                    			</td>
                    		</tr>
                    		<tr>
                    			<th width="100" bgcolor="#021B80" style="color:white;font-size: 10pt;">제목</th>
                    			<td colspan="3">
									<input type="text" name="subject"
									class="form-control" required="required" >		
								</td>
                    		<tr>
								<th width="100" bgcolor="#021B80" style="color:white;font-size: 10pt;">사진</th>
								<td colspan="3">
									<input type="file" name="upload" class="form-control"
									>		
								</td>
							</tr>
							<tr>
								<th width="100" bgcolor="#021B80" style="color:white;font-size: 10pt;">내용</th>
								<td colspan="4">
									<textarea name="content" class="form-control"
									required="required" style="width: 450px;height: 100px;"></textarea>
								</td>
							</tr>

							<tr>
								<td colspan="4" bgcolor="#021B80" align="center">
									<button type="submit"
									style="width: 120px;font-size: 10pt;">글저장</button>
				
									<button type="button"
									style="width: 120px;font-size: 10pt;"
									onclick="location.href='list'">목록</button>
								</td>
							</tr>
						</table>
                    </form>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->

 

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

 

        </div>

        <!-- End of Content Wrapper -->

 

    </div>

    <!-- End of Page Wrapper -->

 

    <!-- Scroll to Top Button-->

    <a class="scroll-to-top rounded" href="#page-top">

        <i class="fas fa-angle-up"></i>

    </a>

 

   
    <!-- Bootstrap core JavaScript-->

   

 

<script src="<c:url value="/vendor/jquery/jquery.min.js" />">

<script src="<c:url value="/vendor/bootstrap/js/bootstrap.bundle.min.js" />">

 

    <!-- Core plugin JavaScript-->

   <script src="<c:url value="/vendor/jquery-easing/jquery.easing.min.js" />">

 

    <!-- Custom scripts for all pages-->

  <script src="<c:url value="/js/sb-admin-2.min.js" />">

 

</body>

 

</html>