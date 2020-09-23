<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>

	.wrap{
  	
	  	width:1000px;
	  	height:1000px;
	  	padding: 0px 200px 30px 500px;
  	
  	}
    .enroll{
    
        width:610px;
        height:800px;
        /* border:solid 1px; */
        margin: auto;
        margin-top: 50px;
        
    }
    
   .clickLink a, a:hover {
    color: black;
    text-decoration: none;
    vertical-align: middle;
    font-size: 15px;

    }
    .block{
            color:white;
            border: solid 1px;
            background-color:rgb(39, 174, 96) ;
            height:100px;
            box-sizing:border-box;
            float:left;
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
            padding-top: 40px;
    }
    .area1{
        width:33.3%;
        
    }
    .area2{width:33.3%; background-color: rgb(60, 223, 128);}
    .area3{width:33.3%}
    
  .btn-success{
      
        border-radius: 10px;
        font-size: 12px;
    }
    #content1{
        width: 100%;
        border:solid 1px green;
        margin-top: 170px;
        padding: 40px 80px 40px 80px;
    }
    #enrollFormTable{
      
        
        margin: auto;
        box-sizing: border-box;
        padding: 15px;
    }
   
    #content1 tr>td{
        padding: 10px 0px 10px 10px;
       
    }
     #content1 tr>td>input{
     	width:240px;
     	height:33px;
     }
    input::placeholder {
        font-size: 13px;
    }
    #nextBtn{
        margin: 30px 200px 30px 180px;
    }
    .clickLink{
        width:200px;
        margin: 170px 200px 10px 650px;
    }
    #enrollFormTable [type=button]{
     height:32px;
     font-size:14px;
     text-align:center;
    }
    </style>
</head>
<body>
    <!-- 메뉴바 추가 -->
<%@include file="../common/menubar.jsp" %> 
	<div class="wrap">
	    <div  class="clickLink" >
	
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
	            <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
	        </svg>
	
	        <a href="">츄레</a>
	        &lt;
	        <a href="">회원가입</a>
	    </div>
	
	
	    <div class="enroll">
	
	     
	        <br><br>
	
	        <div class="title" align="center">
	            <h2><b>츄레 회원가입</b></h2>
	        </div>
	
	        <div class="menubar">
	            <div class="block area1">1.약관동의</div>
	            <div class="block area2">2.정보입력</div>
	            <div class="block area3">3.가입완료</div>
	        </div>
	        
	
	        <div id="content1">
	            <form action="" id="enrollForm" method="post">
	
	                <table id="enrollFormTable">
	                    <tr>
	                        <td style="width:200px;"> 닉네임</td>
	                        <td><input type="text" name="userName" maxlength="5" placeholder=" 6~12자 (한글, 영문자, 숫자)"required></td>
	                        <td><button type="button" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                    <tr>
	                        <td> 아이디</td>
	                        <td><input type="text" name="userId" maxlength="12" placeholder=" 8~12자 (영문자, 숫자)"required></td>
	                        <td><button type="button" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                    <tr>
	                        <td> 비밀번호</td>
	                        <td><input type="password" name="userPwd" maxlength="15" placeholder=" 6~16자 (영문자, 숫자, 특수문자)"required></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td> 비밀번호확인</td>
	                        <td><input type="password" name="checkPwd" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요"required></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td> 이메일</td>
	                        <td><input type="email" name="email" placeholder="이메일을 입력해주세요"></td>
	                        <td><button type="button" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                  
	            
	                </table>
	
	                <a href="<%=contextPath%>/enrollForm3.me" type="submit" id="nextBtn" class="btn btn-success">다음</a>
	             </form>
	            </div>


  		  </div>
  	</div>
  	<!-- 닉네임, 아이디, 비밀번호 중복체크 ajax 사용  -->
</body>
</html>