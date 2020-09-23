<%@page import="com.kh.user.board.model.vo.PageInfo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.user.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// type safety경고를 피하기위해 타입검사수행하였음
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
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<title>Insert title here</title>
    <style>
        a, a:hover {
            color: black;
            text-decoration: none;
            vertical-align: middle
        }

        form>div>a {
            margin-right: 30px!important;
        }

        .profileImg {
            border-radius: 100px;
        }

        .outer {
            width: 1000px;
            height: 550px;
            background: none;
            color: black;
            margin: auto;
            margin-top: 50px;
        }
        .listArea {
            border: 2px solid gray;
            text-align: center;
        }

        .listArea>tbody>tr:hover {
            cursor: pointer;
            background: gray;
        }

        .listArea>tbody>tr:hover div {
            color: black!important;
        }

        .bar:hover {
            cursor: auto!important;
            background: none!important;
        }

        .custom-select {
            color: black;
            width: 100px;
            font-size: 13px;
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            padding-left: 100px;
            color: rgb(9, 175, 79);
        }

        .content{
            width: 620px;
            height: 45px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .content * {
            display: inline;
            font-size: 16px;
            font-weight: normal;
            color: black;
        }

        .content img {
            display: none;
        }

        .content-title {
            height: 25px;
            width: 300px;
            -webkit-line-clamp: 1;
        }

        .btnWrite {
            font-size: 12px;
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
            line-height: 10px;
        }

        .btnSearch {
            border: none;
            background: none;
            vertical-align: middle;
        }

        .btnSearch:hover {
            cursor: pointer;
        }
        
        .btnDisabled {
			color: #fff;
			background-color: #007bff;
			border-color: #007bff;
		}
		
		.btnDisabled:hover {
			cursor: none;
		}
        
        .pagebtn {
        	background: rgb(170, 170, 170);
        }
    </style>
    <script>
    	$(function () {
    		var alertMsg = "<%= alertMsg %>";
    		
    		if(alertMsg != "null") {
    			alert(alertMsg);
    			<% session.removeAttribute("alertMsg"); %>
    		}
    	});
    </script>
</head>
<body>
    <!-- 메뉴바 추가 -->

    <div class="outer">

        <div align="right" style="width: 900px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
            </svg>

            <a href="">츄레</a>
            
            &lt;

            <a href="">자유게시판</a>

        </div>

        <br>
        <div class="title">자유게시판</div>
        <br><br><br>

        <form action="/search.bo" method="GET" style="margin-bottom: 10px;">
            <div align="right" style="width: 900px;">
                
                <a href="">일상</a>

                <a href="">후기</a>

                <select class="custom-select" name="searchType">
                    <option value="title" selected>제목</option>
                    <option value="createDate">등록일</option>
                    <option value="writer">작성자</option>
                </select>
    
                <input type="text" name="keyword" class="form-control" placeholder="검색어를 입력해주세요" style="display: inline-block; width: 200px; vertical-align: middle;">

                <button type="submit" class="btnSearch"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32.24800109863281" height="32.24800109863281" viewBox="0 0 32.24800109863281 32.24800109863281" fill="rgb(46, 204, 113)" data-svg-content="true"><g><path d="M 19,0C 11.82,0, 6,5.82, 6,13c0,3.090, 1.084,5.926, 2.884,8.158l-8.592,8.592c-0.54,0.54-0.54,1.418,0,1.958 c 0.54,0.54, 1.418,0.54, 1.958,0l 8.592-8.592C 13.074,24.916, 15.91,26, 19,26c 7.18,0, 13-5.82, 13-13S 26.18,0, 19,0z M 19,24 C 12.934,24, 8,19.066, 8,13S 12.934,2, 19,2S 30,6.934, 30,13S 25.066,24, 19,24z"></path></g></svg></button>

                <!-- AJAX로 정렬 -->
                <select class="custom-select" name="orderType">
                    <option value="dateDESC" selected>최신순</option>
                    <option value="writerName">작성자</option>
                </select>
            </div>
        </form>

        <table class="listArea" style="margin: 0px auto; width: 800px;">
            <!-- hover시 여백용 tr -->
            <tr style="height: 10px;"><td></td><td></td><td></td></tr>
            <% for(Board b : boardList) { %>
            <tr onclick="location.href='<%= request.getContextPath() %>/boardView.bo?bno=<%= b.getBoardNo() %>'">
            	<% if(b.getMemPic() == null) { %>
                <td width="10%"><img src="<%= request.getContextPath() %>/resources/image/board/defaultprofile.png" class="profileImg" width="40px" height="40px"></td>
                <% } else { %>
                <td width="10%"><img src="<%= request.getContextPath() %>/<%= b.getMemPic() %>" class="profileImg" width="40px" height="40px"></td>
                <% } %>
                <td width="10%"><%= b.getCategory() %></td>
                <td width="80%">
                    <div align="left" class="content content-title"><%= b.getBoardTitle() %></div>
                    <div class="content">
                    	<%= b.getBoardContent() %>
                    </div>
                    <div align="right" style="padding-right: 20px; color: gray;"><%= b.getCreateDate() %></div>
                </td>
            </tr>
            <tr class="bar">
                <td colspan="3" align="center">
                    <!-- 실제 서버에 이미지 올리고 업로드한 주소로 교체 -->
                    <div style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 750px; height: 20px;"></div>
                </td>
            </tr>
            <% } %>
            <!-- hover시 여백용 tr -->
            <tr style="height: 10px;"><td></td><td></td><td></td></tr>
        </table>
        
        <!-- 로그인했을때만 -->
        <div align="right" style="width: 900px;">
            <button class="btn btn-secondry btnWrite" onclick="location.href='<%= request.getContextPath() %>/boardWriteForm.bo'">
            	글쓰기
            </button>
        </div>
        
        <br>

		<!-- 페이징 -->
        <div class="pagingArea" align="center">
            
            <% if(pi.getCurrentPage() != 1) { %>
            <!-- 맨 처음으로 (<<) -->
            <a href="<%= request.getContextPath() %>/board.bo?p=1" class="btn btn-secondry"> &lt;&lt; </a>
            <!-- 이전페이지로 (<) -->
            <a href="<%= request.getContextPath() %>/board.bo?p=<%= pi.getCurrentPage() - 1 %>"class="btn btn-secondry"> &lt; </a>
         	<% } %>
         	
            <% for(int i = pi.getStartPage(), last = pi.getLastPage(); i <= last; i++) { %>
            	<% if(i == pi.getCurrentPage()) { %>
                <a class="btn btnDisabled"><%= i %></a>
            	<% } else { %>
            	<a href="<%= request.getContextPath() %>/board.bo?p=<%= i %>"class="btn btn-secondry pagebtn"><%= i %></a>
            	<% } %>
            	
            	<% 
            	if(i == pi.getMaxPage()) {
					break;            		
            	}
            	%>
            <% } %>
            
            <% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
            <!-- 다음페이지로 (>) -->
            <a href="<%= request.getContextPath() %>/board.bo?p=<%= pi.getCurrentPage() + 1 %>"class="btn btn-secondry"> &gt; </a>
            <!-- 맨 끝으로 (>>) -->
            <a href="<%= request.getContextPath() %>/board.bo?p=<%= pi.getMaxPage() %>" class="btn btn-secondry"> &gt;&gt; </a>
            <% } %>
        </div>
    </div>
    
    <!-- footer 추가 -->
    
</body>
</html>