<%@page import="com.kh.user.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/w3.css">
<title>menubar</title>
<script>
	$(function(){
		var msg = "<%=alertMsg%>"; 

		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	});
</script>
</head>
<body>

<!-- start navbar -->
<div class="outer fixed-top">
		<nav class="navbar navbar-expand-sm bg-white navbar-light justify-content-center">

			<!-- Links -->
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown margin-top">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 꿀팁 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=contextPath%>/careTipList.tip?page=1">재료손질</a> 
						<a class="dropdown-item" href="<%=contextPath%>/knowledgeList.tip?page=1">재료상식</a>
					</div>
				</li>
				<li class="nav-item margin-top"><a class="nav-link" href="<%=contextPath%>/pageList.rp?currentPage=1">레시피</a></li>
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
						<%if(loginUser == null) {%>
						<a class="dropdown-item" href="<%=contextPath%>/enrollForm.me">회원가입</a>
						<a class="dropdown-item" href="<%=contextPath%>/loginForm.me">로그인</a>
						<%}else{ %>
						<!-- 로그인 회원 -->
						<!-- 관리자 로그인하고 마이페이지 누르면 관리자페이지로 이동  -->
						 <% if(loginUser != null && loginUser.getMemId().equals("admin") ){ %>
						<a class="dropdown-item" href="<%=contextPath%>/admin.mm">마이페이지</a>
						<%}else {%>
						<a class="dropdown-item" href="<%=contextPath%>/mypage.me">마이페이지</a>
						<% } %>
						<a class="dropdown-item" href="<%=contextPath%>/logout.me">로그아웃</a>
						<%} %>
					</div>
				</li>
				<li class="nav-item margin-top">
				<%if(loginUser == null){ %>
					<a class="navbar-brand nav-link" href="#" onclick="recipeWrite();"> 
						<img src="resources/image/navbar/pencil.png" alt="logo" style="width: 30px;">
					</a>
				<%} else { %>
					<a class="navbar-brand nav-link" href="<%=contextPath%>/recipeWrite.rp"> 
						<img src="resources/image/navbar/pencil.png" alt="logo" style="width: 30px;">
					</a>
				<%} %>
				<script>
					function recipeWrite(){
						alert("로그인 후 사용 가능합니다.")
					}
				</script>
				
				</li>
				<li class="nav-item dropdown margin-top">
				<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown"> 고객센터 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%= contextPath %>/serviceCenter.no">이용 방법</a> 
						<a class="dropdown-item" href="<%= contextPath%>/notice.no">공지사항</a> 
						<a class="dropdown-item" href="<%= contextPath%>/faqDetail.fa">FAQ</a> 
						<a class="dropdown-item" href="<%= contextPath%>/contactList.co?currentPage=1">1:1 문의</a> 
						<a class="dropdown-item" href="#">개인정보취급방침</a>
					</div>
				</li>
			</ul>
		</nav>
		<!-- searchbar -->
		<nav class="navbar navbar-expand-sm bg-teamColor navbar-light justify-content-center">
			<form class="form-inline" action="<%=contextPath %>/searchBar.sh">
				<input type="hidden" name="currentPage" value="1"> 
				<input class="form-control mr-sm-2" type="text" placeholder="Search" name="keyword">
				<button class="btn btn-success my-2 my-sm-0" type="submit" >Search</button>
			</form>
		</nav>
</div>
<!-- end navbar -->

</body>
</html>