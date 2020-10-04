<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="com.kh.user.board.model.vo.PageInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.user.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>

<%

	ArrayList<Board> boardList = new ArrayList<Board>();
	if(request.getAttribute("boardList") instanceof ArrayList) {
		ArrayList<?> tmpList = (ArrayList<?>)request.getAttribute("boardList");
		for(Object obj : tmpList) {
			if(obj instanceof Board) {
				boardList.add((Board)obj);
			}
		}
	}
	PageInfo pi = (PageInfo)request.getAttribute("pageInfo");
	
	session.removeAttribute("alertMsg");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/subvar.css">
 
<style>
.paging{
	margin-left:300px;
}

</style>
</head>
<body>
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
                    <% for(Board b : boardList) { %>
              			<% if(userName.equals(b.getMemName())) {%>
		                  <div class="card" style="width:10.8rem;">
		                      <img src="resources/image/mypage/cat2.jpg" class="card-img-top" alt="...">
		                      <div class="body" style="height: 45px; ">
		                          <p><b><%=b.getBoardTitle() %></b></p>
		                          <p><%=b.getCreateDate() %></p>
		                      </div>
		                  </div>
	                  	<%} %>
	                 <%} %> 
                </div>   
            </div>
         
         
            <div class="content2_3">
                 
             
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