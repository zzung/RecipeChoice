<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
  <link rel="stylesheet" href="resources/css/subvar.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
    
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
	 <%
    	String userId = loginUser.getMemId();
    	String userName = loginUser.getMemName();
    	String userPwd = loginUser.getMemPwd();
    	String email = loginUser.getEmail();
    	String image = loginUser.getMemPic();
    	Date enrollDate = loginUser.getEnrollDate();
    %> 
     <div class="wrap">
    
            <span class="clickLink">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                    <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
                </svg>
        
                <a href="">츄레</a>
                &lt;
                <a href="">마이페이지</a>
                &lt;
	       	    <a href="">정보수정</a>
            </span>   
            <div id="subvar"class="content1">
                <div class="profile">
                
                <!-- 프로필 이미지 없는 회원 -->
                <%if(image == null) {%>
               	   <svg width="120px" height="115px" viewBox="0 0 16 16" id="noImage"class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                       <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                       </svg> 
                     <p style="font-size:12.5px;"align="center"><b><%=userName%> 님<br>
                     	   가입일 : <%=enrollDate %></b></p>   
                <%}else{ %>
                  <img src="resources/member_upfiles/<%=image%>" align="center"id="profileImg"  style="width:160px;height:130px;"> 
                   <!--  <h4 align="center">xxx님 반갑습니다 :) </h4 -->
                  
                    <p style="font-size:12.5px;"align="center"><b><%=userName%> 님<br>
                     	   가입일 : <%=enrollDate %></b></p>
                    <%} %>
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
        
            
            </script>
        <div class="content2">
            <div id="content2_1">
                <form action="update.me" id="updateForm" method="post" enctype="multipart/form-data">
                    <h3 align="Center" style="margin-bottom: 30px;"><b>개인 정보 수정</b></h3>
                    <table id="updateFormTable">
                        <tr>
                            <td> 닉네임</td>
                            <td><input type="text" class="form-control form-control-sm" name="userName" id="userName" maxlength="12" value="<%=userName%>"></td>
                            <td><button type="button"  onclick="nameCheck();"class="btn btn-outline-success">중복확인</button></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" id="checkName" style="font-size: 12px;"class="form-text text-muted">6~12자 (한글,영문자,숫자)</td>
                        </tr>
                        <tr>
                            <td> 아이디</td>
                            <td colspan="2"><input type="text" name="userId" id="userId" class="form-control form-control-sm"maxlength="12" readonly  value="<%=userId%>"></td>
                          
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">아이디는 변경이 불가합니다.</td>
                        </tr>
                        <tr>
                            <td> 비밀번호</td>
                            <td colspan="2"><input type="password" name="userPwd" id="userPwd" class="form-control form-control-sm" maxlength="15" value="<%=userPwd%>"></td>
                         
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                        </tr>
                        <tr>
                            <td> 비밀번호 확인</td>
                            <td colspan="2"><input type="password" name="checkPwd" id="checkPwd"class="form-control form-control-sm"name="checkPwd" value="<%=userPwd%>" maxlength="15" required></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2" style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                        </tr>
                        <tr>
                            <td> 이메일</td>
                            <td><input type="email" name="email" class="form-control form-control-sm" value="<%=email%>"></td>
                            <td><button type="button" onclick="emailCheck();" class="btn btn-outline-success">중복확인</button></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="2"  style="font-size: 12px;"class="form-text text-muted">6~16자 (한글,영문자,숫자,특수문자)</td>
                            
                        </tr>
    
                        <tr>
                            <td class="profileimg"> 프로필 이미지 </td>
                            
                            <td colspan="2"><input type="file" name="upfile" class="form-control-e" id="exampleFormControlFile2" value="<%=image%>"></td>
                        </tr>
                        
                
                    </table>
    
                    <button  onclick="return validate();" id="updateBtn" data-toggle="modal" data-target="#exampleModal" class="btn btn-success" >수정</button>
                    
			     	<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						        ...
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="submit" class="btn btn-primary">Save changes</button>
						      </div>
						    </div>
						  </div>
						</div>
				 </form>

            	</div>
        			
        </div>

    </div>
        
    <script>
    
		function nameCheck(){
	  		var $userName = $("#updateFormTable input[name=userName]");
	  		
	  		$.ajax({
	  			url:"<%=contextPath%>/nameCheck.me",
	  			type:"get",
	  			data:{checkName:$userName.val()},
	  			success:function(count){
	  				if(count == "fail"){
	  					alert("이미 존재 하는 닉네임입니다.")
	  					$userName.focus().setCursorPosition(last);
	  				
	  				}else{
	  				
	  				}
	  			}, error:function(){
	  				console.log("ajax 통신 실패 !");
	  			}
	  			
	  		});
	  		
	  	}
		function emailCheck(){
	  		var $email = $("#updateFormTable input[name=email]");
	  		
	  		$.ajax({
	  			url:"<%=contextPath%>/emailCheck.me",
	  			type:"get",
	  			data:{checkEmail:$email.val()},
	  			success:function(count){
	  				if(count == "fail"){
	  					alert("이미 존재 하는 이메일입니다.")
	  					$email.focus();
	  				
	  				}else{
	  				
	  				}
	  			}, error:function(){
	  				console.log("ajax 통신 실패 !");
	  			}
	  			
	  		});
	  		
	  	}
	  	
 	 function validate(){
         // 유효성 검사 :  이메일, 비밀번호일치, 닉네임
         var userName = document.getElementById("userName");
         var userPwd = document.getElementById("userPwd");
         var userPwd2 = document.getElementById("checkPwd");
    	 var email = document.getElementById("userEmail");
         
        
         var pwd1 = /^[a-z\d!@#$%^&*]{5,15}$/i;  //특수문자(!@#$%^&*)
         var name = /^[가-힣a-z\d]{3,12}$/;
		 var email = /^[0-9a-z]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
	
         if(!name.test(userName.value)){
             alert("닉네임을 정확하게 기입해주세요.");
             userName.value ="";
             userName.focus(); 

             return false; 
         }
      
         if(!pwd1.test(userPwd.value)){
             alert("유효한 비밀번호를 입력하세요.");

             userPwd.value ="";
             userPwd.focus(); 
             
             return false; 
         }
         
         
         if(userPwd.value != userPwd2.value){
             alert("동일한 비밀번호를 입력하세요!");
             userPwd2.value = "";
             userPwd2.focus(); 

             return false; 
         }
         
         if(!email.test(userEmail.value)){
        	 alert("이메일을 다시 입력해주세요");
       	     email.value = "";
       	     email.focus ="";
       		  return false; 
         }
         
  	 }
    
 	 
    </script>
    
  
</body>
</html>