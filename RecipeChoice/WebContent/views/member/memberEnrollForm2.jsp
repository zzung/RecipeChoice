<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  
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
	
	        <a href="<%=contextPath%>">츄레</a>
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
	            <form action="insert.me" id="enrollForm" method="post">
	
	                <table id="enrollFormTable">
	                    <tr>
	                        <td style="width:200px;"> 닉네임</td>
	                        <td><input type="text" id="userName" name="userName" maxlength="12" placeholder=" 6~12자 (한글, 영문자, 숫자)"required autofocus></td>
	                        <td><button type="button" onclick="nameCheck();" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                    <tr>
	                    	<td></td>
	                    	<td colspan="2"  id="checkName"></td>
	                    </tr>
	                    <tr>
	                        <td> 아이디</td>
	                        <td><input type="text" id="userId"name="userId" maxlength="12" placeholder=" 6~12자 (영문자, 숫자)"required></td>
	                        <td><button type="button" onclick="idCheck();" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                     <tr>
	                     	<td></td>
	                    	<td colspan="2" id="checkId" ></td>
	                    </tr>
	                    <tr>
	                        <td> 비밀번호</td>
	                        <td><input type="password" id="userPwd"name="userPwd" maxlength="15" placeholder=" 6~16자 (영문자, 숫자, 특수문자)"required></td>
	                        <td></td>
	                    </tr>
	                     <tr>
	                    	<td colspan="3"></td>
	                    </tr>
	                    <tr>
	                        <td> 비밀번호확인</td>
	                        <td><input type="password" id="checkPwd"name="checkPwd" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요"required></td>
	                        <td></td>
	                    </tr>
	                     <tr>
	                    	<td colspan="3"></td>
	                    </tr>
	                    <tr>
	                        <td> 이메일</td>
	                        <td><input type="email" id="email"name="email" placeholder="이메일을 입력해주세요"></td>
	                        <td><button type="button" onclick="emailCheck();" class="btn btn-success">중복확인</button></td>
	                    </tr>
	                     <tr>
	                     	<td></td>
	                    	<td colspan="2" id="checkEmail"></td>
	                    </tr>
	                  
	            
	                </table>
	                <input type="submit" onclick="return validate();" type="submit" id="nextBtn" class="btn btn-success" value="가입"></input>
	                
	             </form>
	            </div>


  		  </div>
  	</div>
  	<!-- 닉네임, 아이디, 중복체크 ajax 사용  -->
  	
  	
  	<script>
  	function nameCheck(){
  		var $userName = $("#enrollFormTable input[name=userName]");
  		
  		$.ajax({
  			url:"<%=contextPath%>/nameCheck.me",
  			type:"get",
  			data:{checkName:$userName.val()},
  			success:function(count){
  				if(count == "fail"){
  				
  					$("#checkName").text("이미 존재하는 닉네임입니다!").css("color","red").css("font-size","13px");
  					$userId.focus();
  				}else{
  					$("#checkName").text("사용 가능한 닉네임 입니다!").css("color","	#719E71").css("font-size","13px");
  					$userId.attr("readonly", true);
  				}
  			}, error:function(){
  				console.log("ajax 통신 실패 !");
  			}
  			
  		});
  		
  	}
  	
  	// 중복체크 ajax
  	function idCheck(){
  		
  		var $userId = $("#enrollFormTable input[name=userId]");
  		
  		$.ajax({
  			url:"<%=contextPath%>/idCheck.me",
  			type:"get",
  			data:{checkId:$userId.val()},
  			success:function(result){
  				if(result == "fail"){
  				
  					$("#checkId").text("이미 존재하는 아이디 입니다!").css("color","red").css("font-size","13px");
  					$userId.focus();
  				}else{
  					$("#checkId").text("사용가능한 아이디 입니다!").css("color","#719E71").css("font-size","13px");
  					$userId.attr("readonly", true);
  				}
  			}, error:function(){
  				console.log("ajax 통신 실패 !");
  			}
  			
  		});
  	}
  	function emailCheck(){
  		var $email = $("#enrollFormTable input[name=email]");
  		
  		$.ajax({
  			url:"<%=contextPath%>/emailCheck.me",
  			type:"get",
  			data:{checkEmail:$email.val()},
  			success:function(count){
  				if(count == "fail"){
  					$("#checkEmail").text("이미 존재하는 이메일 입니다!").css("color","red").css("font-size","13px");
  					$userId.focus();
  				}else{
  					$("#checkEmail").text("사용가능한 이메일 입니다!").css("color","#719E71").css("font-size","13px");
  					$userId.attr("readonly", true);
  				}
  			}, error:function(){
  				console.log("ajax 통신 실패 !");
  			}
  			
  		});
  		
  	}
  	
  	
  	 function validate(){
         // 유효성 검사 : 아이디, 비밀번호, 비밀번호일치, 이름 
         var userName = document.getElementById("userName");
         var userId = document.getElementById("userId");
         var userPwd = document.getElementById("userPwd");
         var userPwd2 = document.getElementById("checkPwd");
    	 var email = document.getElementById("userEmail");
         
         var id = /^[a-z][a-z\d]{5,11}$/;
         var pwd1 = /^[a-z\d!@#$%^&*]{5,15}$/i;  //특수문자(!@#$%^&*)
         var name = /^[가-힣a-z\d]{5,12}$/;
		 var email = /^[0-9a-z]([-_.]?[0-9a-z])*@[0-9a-z]([-_.]?[0-9a-z])*.[a-z]{2,3}$/i;
	
         if(!name.test(userName.value)){
             alert("닉네임을 정확하게 기입해주세요.");
             userName.value ="";
             userName.focus(); 

             return false; 
         }
         if(!id.test(userId.value)){ 
             alert("유효한 아이디 입력하세요.")
             
             userId.value = "";  // 입력했던 값들 삭제시켜줌
             userId.focus();     // 어떤 부분이 틀렸는지 깜빡깜빡 보여주기. 

             return false; //--> 빠져나가서 함수 호출한것으로 나가기. --> validate으로 빠짐 
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
         
         location.href="<%=contextPath%>/enrollForm3.me";
  	 }
  	</script>
</body>
</html>