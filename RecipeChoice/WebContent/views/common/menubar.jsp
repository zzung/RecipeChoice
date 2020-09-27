<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/w3.css">
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
				<li class="nav-item margin-top"><a class="nav-link" href="<%=contextPath%>/board.bo">커뮤니티</a></li>
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
						<a class="dropdown-item" href="<%=contextPath%>/enrollForm.me">회원가입</a>
						<a class="dropdown-item" href="<%=contextPath%>/login.me">로그인</a>
						<!-- 로그인 회원 -->
						<a class="dropdown-item" href="<%=contextPath%>/mypage.me">마이페이지</a>
					</div>
				</li>
				<li class="nav-item margin-top">
					<a class="navbar-brand nav-link" href="<%=contextPath%>/recipeWrite.rp"> 
						<img src="resources/image/navbar/pencil.png" alt="logo" style="width: 30px;">
					</a>
				</li>
				<li class="nav-item dropdown margin-top">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 고객센터 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%= contextPath %>/serviceCenter.no">이용 방법</a> 
						<a class="dropdown-item" href="<%= contextPath%>/notice.no">공지사항</a> 
						<a class="dropdown-item" href="<%= contextPath%>/faqDetail.fa">FAQ</a> 
						<a class="dropdown-item" href="<%= contextPath%>/contact.co">1:1 문의</a> 
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