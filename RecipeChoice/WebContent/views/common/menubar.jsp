<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<title>menubar</title>
</head>
<body>
<%@ include file="preloader.jsp" %>
<!-- start navbar -->
<div class="outer fixed-top">
		<nav class="navbar navbar-expand-sm bg-white navbar-light justify-content-center">

			<!-- Links -->
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown margin-top">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 꿀팁 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">재료손질</a> 
						<a class="dropdown-item" href="#">재료상식</a>
					</div>
				</li>
				<li class="nav-item margin-top"><a class="nav-link" href="<%=contextPath%>/recipeView.rp">레시피</a></li>
				<li class="nav-item margin-top"><a class="nav-link" href="#">커뮤니티</a></li>
				<!-- Brand -->
				<li class="nav-item">
					<a class="navbar-brand nav-link" href="<%=contextPath%>">
						<img src="resources/image/logo/logo.JPG" alt="logo" style="width: 130px;">
					</a>
				</li>

				<!-- Dropdown -->
				<li class="nav-item dropdown margin-top">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 
						<img src="resources/image/navbar/user.png" alt="logo" style="width: 30px;">
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">회원가입</a>
					</div>
				</li>
				<li class="nav-item margin-top">
					<a class="navbar-brand nav-link" href="#"> 
						<img src="resources/image/navbar/pencil.png" alt="logo" style="width: 30px;">
					</a>
				</li>
				<li class="nav-item dropdown margin-top">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 고객센터 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> 
						<a class="dropdown-item" href="#">FAQ</a> 
						<a class="dropdown-item" href="#">1:1 문의</a> 
						<a class="dropdown-item" href="#">개인정보취급방침</a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- searchbar -->
		<nav class="navbar navbar-expand-sm bg-teamColor navbar-light justify-content-center">
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
			</form>
		</nav>
</div>
<!-- end navbar -->


<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>