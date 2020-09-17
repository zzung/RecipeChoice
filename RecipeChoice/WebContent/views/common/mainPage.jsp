<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/content_footer.css">
<title>menubar</title>
</head>
<%@include file="preloader.jsp"%>

<!-- start navbar -->
<div class="outer fixed-top">
		<nav
			class="navbar navbar-expand-sm bg-white navbar-light justify-content-center">

			<!-- Links -->
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown margin-top"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> 꿀팁 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">재료손질</a> <a
							class="dropdown-item" href="#">재료상식</a>
					</div></li>
				<li class="nav-item margin-top"><a class="nav-link" href="#">레시피</a></li>
				<li class="nav-item margin-top"><a class="nav-link" href="#">커뮤니티</a></li>
				<!-- Brand -->
				<li class="nav-item"><a class="navbar-brand nav-link" href="#">
						<img src="resources/image/logo/logo.JPG" alt="logo"
						style="width: 130px;">
				</a></li>

				<!-- Dropdown -->
				<li class="nav-item dropdown margin-top"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> <img
						src="resources/image/navbar/user.png" alt="logo"
						style="width: 30px;">
				</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">회원가입</a>
					</div></li>
				<li class="nav-item margin-top"><a
					class="navbar-brand nav-link" href="#"> <img
						src="resources/image/navbar/pencil.png" alt="logo"
						style="width: 30px;">
				</a></li>
				<li class="nav-item dropdown margin-top"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> 고객센터 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">FAQ</a> <a class="dropdown-item"
							href="#">1:1 문의</a> <a class="dropdown-item" href="#">개인정보취급방침</a>
					</div></li>
			</ul>
		</nav>
		<!-- searchbar -->
		<nav
			class="navbar navbar-expand-sm bg-teamColor navbar-light justify-content-center">
			<form class="form-inline">
				<input class="form-control mr-sm-2" type="text" placeholder="Search">
				<button class="btn btn-success my-2 my-sm-0" type="button">Search</button>
			</form>
		</nav>
</div>
<!-- end navbar -->


	<div class="contents">
		<div id="content">
			<div class="content_1">

			</div>
			<div class="content_2">

			</div>
			<div class="content_3">

			</div>
		</div>
	</div>

<!-- footer -->
<div class="bottom">
        <div id="footer_1">
            <a href="">회사소개</a> <a href="">개인정보취급방침</a> <a href="">고객센터</a>
        </div>
        
        <div id="footer_2">
            <img src="resources/image/logo/churro.png" width="50px"
                height="50px">
        </div>
        
        <div id="footer_3">
            <span>
				<span>상호 : 주식회사 츄레 (서울시 강남구 테헤란로 14길 6 남도빌딩 3층)</span><br> 
				<span>대표자 : 츄레 개인정보관리책임자: 츄레 </span><br>
				<span>사업자번호 : 222-22-2222-222 전화 : 02-222-2222  메일: recipechoice5@gmail.com</span>
            </span>
        </div>
    </div>



<script src="resources/js/bootstrap.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>