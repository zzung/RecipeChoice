<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/subvar.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
.paging{
	margin-left:300px;
}

</style>
</head>
<body>
	<body>
	
<%@include file="../common/menubar.jsp" %>

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
        <script>
            $(function(){
               $(".memInfo>tbody>tr").click(function(){
                  location.href = "" ;
               });
            });
         
         </script>
        <div class="content2">

            <div class="content2_1">
                <table class="table table">
                    <thead>
                      <tr>
                        <th  colspan="2"> 내가 작성한 게시물</th>
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
                    <div class="card" style="width:10.8rem;">
                        <img src="resources/image/mypage/AD.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 45px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                    <div class="card" style="width:10.8rem;">
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
               
                <div class="content2_2_1">
                    <div class="card" style="width:10.8rem;">
                        <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 50px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                    <div class="card" style="width: 10.8rem;">
                        <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 50px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                    <div class="card" style="width:10.8rem ;">
                        <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 50px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                    <div class="card" style="width: 10.8rem;">
                        <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 50px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                </div>   
                
            </div>
            <div class="content2_3">
                
                <div class="content2_3_1">
                    <div class="card" style="width: 10.8rem; margin-top:10px;">
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
                    <div class="card" style="width: 10.8rem;">
                        <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
                        <div class="body" style="height: 45px; ">
                            <p><b>글제목</b></p>
                            <p>작성일 : 2020-01-01</p>
                        </div>
                    </div>
                </div>   
             
             	<div class="content2_3_1">
             		<nav aria-label="Page navigation example" class="paging">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#"aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						  </ul>
					</nav>
             	</div>
            </div>
			
  
        </div>
		

    </div>
</body>
</body>
</html>