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
            padding:100px 10px 300px 510px;
            /* margin: auto; */
        }
          #login_form_etc a, a:hover{
              color: black;
            text-decoration: none;
            vertical-align: middle;
            font-size: 15px;
          }
        .clickLink a, a:hover {
            color: black;
            text-decoration: none;
            vertical-align: middle;
            font-size: 15px;
        }
        #login_btn{
            width: 310px;
        }
        #login_form td{
           padding: 5px 10px 20px 10px;
        }
        #login_form{
            /*margin-top: 10px; */
            border: solid 1px green;
            padding: 20px;
            width:100%;
            height:380px;
         
        }
      
          .clickLink{
            width:150px;
            margin: 100px 200px 60px 600px;
        }
        #login_form_etc{
            margin-top: 30px;
        }
    
     </style>     
</head>
<body>
    <!-- 메뉴바 추가 -->
<%@include file="../common/menubar.jsp" %>



	<div class="wrap">
	    <div align="right" class="clickLink" >
	
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
	            <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
	        </svg>
	
	        <a href="">츄레</a>
	        &lt;
	        <a href="">로그인</a>
	    </div>
	
	
	        <!-- 1. 전체 내용을 감싸는 div -->
	        <div id="login_form">
	            <h3 align="center"><b>로그인</b></h3>
	            <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
	            <form action="" id="login_form_input">
	    
	                <!-- 3_1. ID/PWD input요소가 들어갈 div -->
	                <table align="center">
	                    <tr>
	                        <td> 아이디</td>
	                        <td><input type="text" name="userId" class="form-control" style="height:30px;width:230px;"maxlength="12" placeholder=" 아이디를 입력하세요"required></td><br>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td> 비밀번호</td>
	                        <td><input type="password" name="userPwd" maxlength="15" class="form-control" style="height:30px;" placeholder="비밀번호를 입력하세요"required></td>
	                        <td></td>
	                    </tr>
	                    <tr>
	                        <td colspan="3"><input type="submit"class="btn btn-success" id="login_btn" value="로그인">
	                        </td>
	                    </tr>
	                </table>
	            </form>
	    
	            <!-- 2_2. 회원가입페이지, ID/PWD 찾기 페이지 이동용 a 가 들어갈 영역-->
	            <div id="login_form_etc" align="center">
	                <a href="">회원가입 |</a> 
	                <a href="">ID 찾기 |</a> 
	                <a href="">PWD 찾기 </a>
	            </div>
	    
	        </div>
    </div>


</body>
</html>