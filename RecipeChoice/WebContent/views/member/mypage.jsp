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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</head>
<body>
	
<%@include file="../common/menubar.jsp" %>
 <%

	String userId = loginUser.getMemId();
	String userName = loginUser.getMemName();
	String userPwd = loginUser.getMemPwd();
	String image = loginUser.getMemPic();
	String email = loginUser.getEmail();
	Date enrollDate = loginUser.getEnrollDate();
%> 
   

<div class="wrap" >


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
   
      <div class="content2">

          <div class="content2_1">
              <table class="table table">
                  <thead>
                    <tr>
                      <th  colspan="2"> 최근 본 게시물</th>
                    </tr>
                  </thead>
                </table>
              <div class="content2_1_1">
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/AD.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/AD.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/AD.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/AD.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
              </div>   
          </div>
       
          <div class="content2_2">
              <table class="table table-striped" id="dd">
                  <thead>
                    <tr>
                      <th scope="col" colspan="2"> 작성글</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                </table>
              <div class="content2_2_1">
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
              </div>   
              <div class="content2_2_2">
                  <a href="" id="moreBtn" class="btn btn-light">more</a>
              </div>
          </div>
          <div class="content2_3">
              <table class="table table-striped">
                  <thead>
                    <tr>
                      <th scope="col" colspan="2"> 스크랩한 게시글 보기</th>
                      <th scope="col"></th>
                    </tr>
                  </thead>
                </table>
              <div class="content2_3_1">
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width:10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
                  <div class="card" style="width: 10.8rem;">
                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                      <div class="body" style="height: 45px; ">
                          <p><b>글제목</b></p>
                          <p>작성일 : 2020-01-01</p>
                      </div>
                  </div>
              </div>   
           
              <div class="content2_3_2">
                  <a href="" id="moreBtn" class="btn btn-light">more</a>
              </div>
          </div>


       </div>


    </div>
</body>
</body>
</html>