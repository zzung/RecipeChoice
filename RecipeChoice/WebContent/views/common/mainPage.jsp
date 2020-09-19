<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/footer.css">
<title>menubar</title>
<style>
	.contents{
		margin-top:70px;
		height:1000px;
	}
	#content{
		width:900px;
		height: 100%; 
		margin:auto; 
	}
</style>
</head>
<%@include file="menubar.jsp" %>


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