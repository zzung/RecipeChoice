<%@page import="com.kh.admin.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> noticeList = (ArrayList<Notice>)request.getAttribute("noticeList");
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
	#header{height:20%; margin-top:50px;} 
	#navigator{height:5%}
	#content{height:70%}
	#footer{height:10%; margin-bottom:10px;}
	#content>div{
	    height:100%;
	    float:left;
	}
	#content_1{ width:18%; margin-right: 40px;}
	#content_2{ width:75%}
	
	#menu_1{
	    height: 30%;
	    background: rgb(39, 174, 96);
	    color: white;
	    font-size: 18px;
	    text-align: center;
	    line-height: 180px;
	}
	#menu_2{
	    height: 8%;
	    margin-top: 10px;
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
    .tb1{border-collapse: collapse;}
    tr{
        box-sizing: border-box;
        border-radius: 10px;
        border: 1px solid lightgray;
        float: left;
        width: 95%;
        height: 40px;
        margin: 5px;
        
    }
   	.tb1 td:first-child{
        font-weight: bolder;
        line-height: 20px;
        padding: 5px;
        text-align: center;
    }
   
    .tb1 td{
		line-height: 40px;
        padding-left: 40px;
    }
    .tb1 td:last-child{
        padding-left: 400px;
        padding-right: 10px;
    }
    .notice-normal{
    	line-height: 20px;
        padding: 5px;
        font-weight: bolder;
    	font-size: 15px;
		margin-top: 10px;
		padding-left: 20px;
    } 
    .notice-important{
        background: orangered;
        color: white;
        font-size: 12px;
        font-weight: bolder;
        line-height: 10px;
        border-radius: 10px;
        float: left;
        margin: 5px 5px 5px 5px;
    }
    tr {cursor: pointer;}
    tr:hover{background: rgb(243, 243, 243)}
    
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
	<!-- 메뉴바 추가 -->
	 <%@include file="../common/menubar.jsp" %>
	 
	<div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">고객센터</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.no'">&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;1:1 문의</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;개인정보취급방침</div>
                <div id="menu_3">
                    <br>&nbsp;&nbsp;고객센터
                    <br>&nbsp;&nbsp;1234-5678
                    <br>&nbsp;&nbsp;평일 10:00 ~ 18:00
                    <br>&nbsp;&nbsp;(토,일 공휴일은 휴무)
                </div>
            </div>
            <div id="content_2">
                
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;츄레 공지사항 <img src="resources/image/admin/noticeEmo.png" style="width: 40px; height: 40px;"></h4>
                <hr>
                <table class="tb1">
                	<% if(noticeList.isEmpty()) { %>
                	<tr>
                		<td></td>
                		<td colspan="2"> 공지사항이 없습니다. </td>
                	</tr>
                	<%} else{ %>
	                	<% for (Notice n : noticeList) { %>
	                    <tr>
	                    	<% if (n.getNoticeImportant().equals("Y")){ %>
	                        	<td>공지</td>
	                        <% } else{ %>
	                        	<td><%= n.getNoticeNo() %></td>
	                        <% } %>
		                        <td> <%= n.getNoticeTitle() %> </td>
		                        <td> <%= n.getNoticeDate() %></td>
	                    <% } %>
	                    </tr>
	                <% } %>
                </table>
				
            </div>
            <div id="content_3"></div>
        </div>
        
        <div id="footer">
  				<div class="pagination" align="center">
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

        <script>
            $(function(){
                <%-- 중요 공지사항 일때 --%>
                $('.tb1 td:nth-child(1)').addClass( 'notice-important' ); 
            
                <%-- 일반 공지사항일때 --%>
                $('.tb1 td:nth-child(1)').addClass( 'notice-normal' );
           
                <%-- 제목 클릭시 상세페이지로 이동--%>
                $(".listArea>tbody>tr").click(function(){
                	var nno = $(this).children().eq(0).text();
                	location.href = "<%= contextPath %>/detail.no?nno=" + nno;
				});
            });
            
        </script>

    </div>
    
     <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
</body>
</html>