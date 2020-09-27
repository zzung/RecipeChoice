<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/subvar.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <style>
    	.table{
        width: 752px;
    }

    .text-muted{

        font-size: 11px;
    }
    #updateFormTable td{
        margin: 6px;
        font-size: 14.5px;
    }
    .profileimg{
        margin-top: 10px;
    }
    #updateFormTable  .btn-outline-success{
        font-size: 13px;
    }
    #updateBtn{
        margin: 20px 190px;
    }
    #content2_1{

        border: solid 1px rgb(39, 174, 96);
        width:500px;
        height:550px;
        padding: 45px 35px;
        margin: 50px 70px
    
    </style>
</head>
<body>
<%@include file="../common/menubar.jsp" %>

     <div class="wrap">
    
            <span class="clickLink">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                    <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
                </svg>
        
                <a href="">츄레</a>
                &lt;
                <a href="">회원가입</a>
            </span>   
            <div id="subvar"class="content1">
                <div class="profile">
                  <img src="resources/image/mypage/cat.jpg" align="center"id="profileImg"  style="width:160px;height:130px;"> 
                   <!--  <h4 align="center">xxx님 반갑습니다 :) </h4 -->
                    <!--    <svg width="120px" height="100px" viewBox="0 0 16 16" id="noImage"class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                        </svg> --> 
                    <p style="font-size:12px;"align="center"><b>뭐해먹지 님<br>
                        가입일 : 2020-08-01</b></p>
                    
                </div>
                <div class="memInfo">
                    <table class="menutable table-hover">
                    
                        <tbody>

	                       <tr>
	                           <th scope="row" colspan="3"onclick="location.href='<%=contextPath%>/updateForm.me'";>개인 정보 수정</th>
	                       </tr>
	                       <tr>
	                           <th scope="row" colspan="3"onclick="location.href='<%=contextPath%>/contactForm.me'";>내 문의 확인</th>
	                       </tr>
	                       <tr>
	                           <th scope="row" colspan="3" onclick="location.href='<%=contextPath%>/writtenBoard.me'";>작성 게시글 보기 </th>
	                           
	                       </tr>
	                       <tr>
	                           <th scope="row" colspan="3"onclick="location.href='<%=contextPath%>/writtenBoard.me'";>스크랩한 게시글 보기 </th>
	                           
	                       </tr>
	                       <tr>
	                           <th scope="row" colspan="3" onclick="location.href='<%=contextPath%>/deleteForm.me'";>회원 탈퇴 </th>
	                           
	                       </tr>
                       </tbody>
                    </table>
                
            </div>
        </div>
        <script>
            $(function(){
                $(".memInfo>tbody>tr").click(function(){
                    location.href = "<%= contextPath %>/" ;
                });
            });
            
            </script>
        <div class="content2">
            <div id="content2_1">
                <form action="" id="updateForm" method="post">
                    <h3 align="Center" style="margin-bottom: 30px;"><b>개인 정보 수정</b></h3>
                    <table id="updateFormTable">
                        <tr>
                            <td> 닉네임</td>
                            <td><input type="text" class="form-control form-control-sm" name="userName" maxlength="5" required></td>
                            <td><button type="button" class="btn btn-outline-success">중복확인</button></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">6~12자 (한글,영문자,숫자)</td>
                        </tr>
                        <tr>
                            <td> 아이디</td>
                            <td colspan="2"><input type="text" name="userId" class="form-control form-control-sm"maxlength="12" readonly></td>
                          
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">아이디는 변경이 불가합니다.</td>
                        </tr>
                        <tr>
                            <td> 비밀번호</td>
                            <td colspan="2"><input type="password" name="userPwd"class="form-control form-control-sm" maxlength="15" required></td>
                         
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                        </tr>
                        <tr>
                            <td> 비밀번호 확인</td>
                            <td colspan="2"><input type="password" class="form-control form-control-sm"name="checkPwd" maxlength="15" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                        </tr>
                        <tr>
                            <td> 이메일</td>
                            <td><input type="email" name="email" class="form-control form-control-sm"></td>
                            <td><button type="button" class="btn btn-outline-success">중복확인</button></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                            
                        </tr>
    
                        <tr>
                            <td class="profileimg"> 프로필 이미지 </td>
                            
                            <td colspan="2"><input type="file" class="form-control-e" id="exampleFormControlFile2"></td>
                        </tr>
                        
                
                    </table>
    
                    <button type="submit" id="updateBtn" class="btn btn-success">수정</button>
                 </form>

            	</div>
        
           
        </div>


    </div>
</body>
</html>