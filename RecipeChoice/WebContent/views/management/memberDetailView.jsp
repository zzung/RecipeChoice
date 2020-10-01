<%@page import="com.kh.user.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.member.model.vo.Member"%>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
	    box-sizing: border-box;
	}
	.wrap{
	    width:1000px;
	    height:1200px;
	    margin: auto;
	}
	#header{height:15%;} 
	#content{height:70%; margin-top: 30px;}
	#footer{height:15%; margin-bottom: 30px;}
	#navigator{height:5%}
	#content>div{
	    height:100%;
	    float:left;
	}
	#content_1{ width:18%; margin-right: 40px;}
	#content_2{ width:75%; }
	#menu_1{
	    height: 20%;
	    background: rgb(39, 174, 96);
	    color: white;
	    font-size: 18px;
	    text-align: center;
	    line-height: 180px;
	}
	#menu_2{
	    height: 5%;
	    margin-top: 8px;
	    line-height: 40px;
	    border: 1px solid lightslategrey;
	    border-radius: 5px;
	}
	#menu_3{
	    height: 25%; 
	    margin-top: 10px;
	    border: 1px solid lightslategrey;
	    border-radius: 5px;
	}
	#menu_2{cursor: pointer;}
	#menu_2:hover{color: rgb(39, 174, 96);}
    .tb2 {border-collapse: collapse;}
	.tb2{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    margin: 5px;
    text-align: center;
    }
    .tb2 td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    }
    .tb2>tr{
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    .tb2 td{
		line-height: 30px;
        padding-left: 0px;
        text-align: center;
    }
    .tb2 a{color: black; font-size:13px;}
    .tb2>tbody>tr:hover{background: #f3f3f3; cursor: pointer;}

    #tb1_outer{
        width: 60%;
        height: 150px;
        margin: 5%;
        margin-left: 100px;
        margin-top: 50px;
    }
    #tb1_outer>.tb1{float: right; height: 100%;}

    .pagination {
	    display: inline-block;
        margin-left: 40%;
    }
    .pagination a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }

    .pagination a.active {
        background-color: rgb(39, 174, 96);
        color: white;
        border-radius: 5px;
    }

    .pagination a:hover:not(.active){
        background-color: #ddd;
        border-radius: 5px;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	<!--  메뉴바추가 -->
	<%@include file="../common/menubar.jsp" %>
	
    <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/memberList.mn'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/blackList.mn'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">회원 상세 조회</p>
                <hr> 

                <div id="tb1_outer">
                    <table class="tb1">
                        <thead id="con1" style="width: 150px; height: 150px;">
                        	<tr><%= m.getMemPic() %></tr>
                        </thead>
                        <tbody id="con2">
                            <tr>
                                <th width="150px">아이디</th>
                                <td><%= m.getMemId() %></td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td><%= m.getEnrollDate() %></td>
                            </tr>
                            <tr>
                                <th>게시글 </th>
                                <td><%= m.getBoardCount() %></td>
                            </tr>
                            <tr>
                                <th>신고받은 횟수</th>
                                <td><%= m.getMemReportCount() %></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <% if(m.getStatus().equals("N")){ %>
                                <td>비활성</td>
                                <% }else { %>
                                <td>활성</td>
                                <% } %>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br><br>
                <table class="tb2">
                    <thead>
                        <tr>
                            <th width="100" >NO.</th>
                            <th width="200" >Category</th>
                            <th width="400" >Content</th>
                            <th width="150" >Date</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<% if(boardList.isEmpty()) { %>
                    		<tr>
                    			<td colspan="4"> 올린 게시글이 없습니다.</td>
                    		</tr>
                    	<% } else{ %>
                    		<% for(Board b : boardList) { %>
	                        <tr>
	                            <td><%= b.getBoardNo()%></td>
	                            <td><%= b.getCategory() %></td>
	                            <td><%= b.getBoardTitle() %></td>
	                            <td><%= b.getCreateDate() %></td>
	                        </tr>
                        	<% } %>
                        <% } %>
                    </tbody>
                </table>
                
                <hr>
                <div align="right">
                	<a href="<%=contextPath%>/enabled.mn" class="btn btn-primary">회원 활성화</a>
                	<a href="<%=contextPath%>/disabled.mn" class="btn btn-dark">회원 비활성화</a>
                </div>
                
            </div>
            <div id="content_3"></div>
        </div>
        <div id="footer">
            <div class="pagination">
                <a href="#">&laquo;</a> 
                <a href="#">1</a> 
                <a href="#">2</a> 
                <a href="#">3</a> 
                <a href="#">4</a> 
                <a href="#">5</a> 
                <a href="#">6</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
    </div>
    

    <script>
    	$(function(){
    		$(".tb2>tbody>tr").click(function(){
    			var bno = $(this).children().eq(0).text();
    			location.href="<%= contextPath%>/boardView.bo?bno="+bno;
    		});
    	});
    </script>
                
</body>
</html>