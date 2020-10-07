<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>

    .outer{
	
    }
    .click_link a, a:hover {
    color: black;
    text-decoration: none;
    vertical-align: middle;
    font-size: 15px;
 

    }
    .form-control{
        font-size: 13px;
         width: 250px; 
    }
    #search_btn{
        margin-top: 10px;
        width: 345px;
    }
    #pwd_search td{
       padding: 0px 0px 10px 5px;
    }
    #pwd_search{
        margin-top: 300px;
        border: solid 1px green;
        padding: 20px;
        width:550px;
        margin: auto;
    }
    .click_link{
        margin: 190px 50px 60px 240px;
    }
    #checkNumBtn{
        font-size: 13px;
    }
 	.modal-body input{
 	width:250px;}
 </style>
</head>
<body>
<body>

<%@include file="../common/menubar.jsp" %>

    <div class="outer">
        <div align="right" class="click_link" style="width: 900px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
            </svg>

            <a href="">츄레</a>
            &lt;
            <a href="">로그인</a>
            &lt;
	        <a href="">PWD찾기</a>
        </div>

		<!-- 인증번호 랜덤 생성 -->
		<%! public int getRandom(){ 
			int random = 0;
			random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
			return random;
		} %>
        <!-- 1. 전체 내용을 감싸는 div -->
        <div id="pwd_search">
            <h3 align="center"><b>pwd 찾기</b></h3>
            <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
            <form action="send.me" id="pwd_search_form" method="post">
    
                <!-- 3_1. ID/PWD input요소가 들어갈 div -->
                <table align="center">
                    <tr>
                        <td> 아이디</td>
                        <td colspan="2"><input type="text" name="userId" id="userId" class="form-control" style="height:30px;"maxlength="20" placeholder="아이디를 입력해주세요"required></td><br>
                        
                    </tr>
                    <tr>
                        <td> 이메일</td>
                        <td><input type="email" name="userEmail" class="form-control" style="height:30px;"maxlength="30" placeholder="이메일을 입력해주세요"required></td><br>
                        <td><button type="submit"id="checkNumBtn"class="btn btn-success"style="width:100px">인증번호받기</button></td>
                    </tr>
                    <tr>
                        <td> 인증번호</td>
                        <td><input type="number" name="checkNum" class="form-control" style="height:30px;"maxlength="20" placeholder="인증번호 입력해주세요." disabled></td><br>
                        <td><input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>"></td>
                    </tr>
                  
                    <tr>
                        <td colspan="3"><input type=""class="btn btn-success"  data-toggle="modal" data-target="#exampleModal"id="search_btn" value="찾기">
                        </td>
                    </tr>
                </table>
            </form>
			      <!-- Modal -->
			    
					  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					    <div class="modal-dialog">
					      <div class="modal-content">
					        <div class="modal-header">
					          <h5 class="modal-title" id="exampleModalLabel">PWD 변경하기</h5>
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					            <span aria-hidden="true">&times;</span>
					          </button>
					        </div>
					     
					        <div class="modal-body">
					    		    <table >
					    		    	<tr>
					                        <td> 비밀번호 :</td>
					                        <td><input type="password" id="userPwd"name="userPwd" maxlength="15" placeholder="변경하실 비밀번호를 입력하세요"required></td>
					                    </tr>
					                     <tr>
					                    	<td colspan="3"><input type="hidden"></td>
					                    </tr>
					                    <tr>
					                        <td> 비밀번호확인 :</td>
					                        <td colspan="2"><input type="password" id="checkPwd"name="checkPwd" maxlength="15" placeholder="비밀번호를 한번 더 입력해주세요"required></td>
					                        
					                    </tr>
					    		    
					    		    </table>
					        </div>
					        <div class="modal-footer">
					          <button type="submit" id="loginBtn"class="btn btn-success" data-dismiss="modal">변경하기</button><br>
					        </div>
					      </div>
					    </div>
					  </div>
            	
        </div>
    
        
         
		  <script>
			 $userId = $("#userId").val();
			 $userPwd = $("#userPwd").val();
    	 	 $checkPwd = $("#checkPwd").val();
    	 	 
		      $("#loginBtn").click(function(){
		    	  $userPwd = $("#userPwd").val();
		    	  $checkPwd = $("#checkPwd").val();	  
				 var pwd1 = /^[a-z\d!@#$%^&*]{5,15}$/i;  //특수문자(!@#$%^&*)
			  	if(!pwd1.test($userPwd)){
		             alert("유효한 비밀번호를 입력하세요.");

		             $userPwd.focus(); 
		             
		             return false; 
		             
		         }else{

			    	  if($userPwd == $checkPwd){  
			    		  updatePwd();
			    	  }
			    	  else{
			    		  alert("동일한 비밀번호를 입력해주세요");
			    		  $("#userPwd").focus();
			    		  return false;
			    	  } 
		         }
		  
		      });
		  		
		    function updatePwd(){
		    	 $userId = $("#userId").val();
		    	$.ajax({
		    		url:"<%=contextPath%>/updatePwd.me",
		  			type:"post",
		  			data:{userId:$userId,userPwd:$userPwd},
		  			success:function(result){
		  				if(result == "success"){
		  					alert("비밀번호변경이 완료되었습니다.");
		  					location.href="<%=contextPath%>/loginForm.me"
		  				}
		  			},error:function(){
		  				console.log("ajax 통신실패!")
		  			}
		    	});
		    }
		      
		  </script>
		  
        
    </div>

</body>
</body>
</html>