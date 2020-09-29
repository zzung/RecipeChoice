<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><link rel="stylesheet" href="resources/css/subvar.css">
<style>
 #deleteMemBtn{
        font-size: 12px;
        margin: 20px 60px 80px 110px
     }
     .deleteForm{
         margin-top: 70px;
         margin-left:70px;
         border: solid 1px green;
         padding: 31px;
         width: 450px;
         height: 270px;
     }

     .deleteForm p{
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
    	String email = loginUser.getEmail();
    	Date enrollDate = loginUser.getEnrollDate();
 %> 
	  <div class="wrap" style="">

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
                    <!-- <h4 align="center">xxx님 반갑습니다 :) </h4 -->
                     <!-- <svg width="120px" height="120px" viewBox="0 0 16 16" id="noImage"class="bi bi-person" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10 5a2 2 0 1 1-4 0 2 2 0 0 1 4 0zM8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm6 5c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                        </svg>  -->
                    <p style="font-size:12px;"align="center"><b><%=userName %><br>
                        가입일 : <%=enrollDate %></b></p>
                    
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
	
	      <div class="deleteForm">
	
	        <p align="center">회원 탈퇴시 자동으로 작성글이 삭제 되지 않으니<br> 게시글이 남는 것을 원하지 않으신다면 삭제 후 탈퇴 해주세요! </p>
	        <p align="center" id="important">탈퇴를 진행하시려면 비밀번호를 입력해주세요  </p>
	        <!-- 2_1. 입력을 받는 input요소들이 위치할 영역 -->
		            <form action="" id="deleteMemForm">
		    
		                <!-- 3_1. ID/PWD input요소가 들어갈 div -->
		                <table align="center">
		                    <tr>
		                        <td> 비밀번호 : </td>
		                        <td><input type="password" name="userPwd" maxlength="15" class="form-control" style="height:30px;" placeholder="password"required></td>
		                        <td></td>
		                    </tr>
		                    <tr>
		                        <td colspan="3"><input type="submit"class="btn btn-success" id="deleteMemBtn" value="탈퇴" >
		                        </td>
		                    </tr>
		                </table>
		            </form>
	
	      </div>    
	
    </div>
</div>
</body>
</html>