<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><link rel="stylesheet" href="resources/css/subvar.css">
<style>
 #updateMemBtn{
        font-size: 12px;
        margin: 20px 60px 80px 30px;
     }
     .updateForm{
         margin-top: 100px;
         margin-left:70px;
         border: solid 1px green;
         padding: 50px 30px 30px 30px;
         width: 450px;
         height: 270px;
     }
	 #updateMemForm td{
	 	margin:10px;
	 }
     .updateForm p{
         font-size: 14px;
        font-weight: 500;   
     }
     #important{
         font-weight: 600px;
     }
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
	  <div class="wrap" style="">

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
                           <th scope="row" colspan="3"onclick="location.href='<%=contextPath%>/'";>내 문의 확인</th>
                       </tr>
                       <tr>
                           <th scope="row" colspan="3" onclick="location.href='<%=contextPath%>/writtenBoard.me'";>작성 게시글 보기 </th>
                           
                       </tr>
                        <tr>
                           <th scope="row" colspan="3"onclick="location.href='<%=contextPath%>/'";>작성 레시피 보기 </th>
                           
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
		 <div class="content2">
	
	      <div class="updateForm">
	
	       
	        <p align="center" id="important">회원 정보를 수정하시려면 아래에 비밀번호를 입력해주세요 !  </p><br>
	        <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
		          
      
		    <form action="updateForm2.me" method="post">
                <!-- 3_1. ID/PWD input요소가 들어갈 div -->
                <table align="center">
               
                    <tr>
                        <td> 비밀번호 : </td>
                        <td></td>
                        <td colspan="2"><input type="password" name="userPwd" maxlength="15" class="form-control" style="height:30px;" placeholder="password"required></td>
                      
                    </tr>
                    <tr>
                    	<td colspan="3"><br></td>
                    </tr>
                    <tr>
                    	<td></td>
                        <td colspan="2"><input type="submit"class="btn btn-success" onclick="return validatePwd();" id="updateMemBtn" value="확인" >
                        </td>
                    </tr>
                </table>
        	</form>

	      </div>    
	
    </div>
</div>

<script>
	function validatePwd(){
		if($("input[name=userPwd]").val() == <%=userPwd%>){
			
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			$("input[name=userPwd]").focus();
			return false;
		}
	}

</script>
</body>
</html>