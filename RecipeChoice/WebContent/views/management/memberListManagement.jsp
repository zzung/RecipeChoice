<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.user.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Member> memberList = (ArrayList<Member>)request.getAttribute("memberList");
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
	    height:800px;
	    margin: auto;
	}
	#header{height:20%;} 
	#content{height:70%; margin-top: 30px;}
	#footer{height:10%; margin-bottom: 30px;}
    .nav{background:rgb(39, 174, 96);}
        .menu{
            display:table-cell;
            height:30px;
            width:150px;
        }
	#navigator{height:5%}
	#content>div{
	    height:100%;
	    float:left;
	}
	#content_1{ width:18%; margin-right: 40px;}
	#content_2{ width:75%; }
	#menu_1{
	    height: 30%;
	    background: rgb(39, 174, 96);
	    color: white;
	    font-size: 18px;
	    text-align: center;
	    line-height: 180px;
	}
	#menu_2{
	    height: 6%;
	    margin-top: 8px;
	    line-height: 30px;
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
    
    .tb1{
        border: 1px solid lightslategrey;
        line-height: 30px;
        border-collapse: collapse;
        margin: 20px;
        text-align: center;
        font-size: 12px;
    }
    tbody a{text-decoration: none; color: black;}
    tbody a:hover{color: rgb(39, 174, 96);}
    thead>tr>th{background-color: lightgray;}

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
        <div class="nav">
            <div class="menu"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/memberList.mn'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/blackList.mn'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr'">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">전체 회원 조회</p>
                <hr> 
                <table class="tb1" border="1">
                    <thead>
                        <tr>
                            <th width="50">번호</th>
                            <th width="150">회원 아이디</th>
                            <th width="120">가입 날짜</th>
                            <th width="140">올린 게시글 수</th>
                            <th width="140">신고받은 횟수</th>
                            <th width="100">상태</th>
                        </tr>
                    </thead>
                    
                    <tbody>
                    	<% for(Member m : memberList){ %>
                        <tr>
                            <td><%= m.getUserNo() %></td>
                            <td><a href="<%=contextPath%>/memberDetail.mn?uno=<%=m.getUserNo()%>"><%= m.getMemId() %></a></td>
                            <td><%= m.getEnrollDate() %></td>
                            <td><%= m.getBoardCount() %></td>
                            <td><%= m.getMemReportCount() %></td>
                            <td><%= m.getStatus() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <hr>
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
</body>
</html>