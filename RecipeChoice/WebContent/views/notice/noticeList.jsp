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
    .tb1{border-collapse: collapse; margin: 10px; width: 700px; text-align: center;}
    tr{
        border: 1px solid lightgray;
        border-radius: 10px;
       line-height: 40px;
       cursor: pointer;
       margin-top: 8px;
       float: left;
       height: 40px;
    }
    tr:hover{background: rgb(243, 243, 243)}
    .tb1 td:first-child{
        font-size: 12px;
        font-weight: bolder;
    }
    #important{
        background-color: orangered;
        border: 1px solid orangered;
        color: white;
        height: 30px;
        border-radius: 10px;
        font-size: 12px;
        font-weight: bolder;
       	margin-top: 2px;
       	line-height: 15px;
    }

    
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.no'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;공지사항</div>
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
                
                <p style="font-size:18px; font-weight: bolder;">
                	&nbsp;&nbsp;츄레 공지사항
                	<img src="resources/image/admin/noticeEmo.png" style="width: 40px; height: 40px;">
                </p>
                <hr>
                
                <table class="tb1">
                	<% if(noticeList.isEmpty()) { %>
                	<tr>
                		<td colspan="3" width="700px"> 공지사항이 없습니다. </td>
                	</tr>
                	<%} else{ %>
	                	<% for (Notice n : noticeList) { %>
	                    <tr>
	                    	<% if(n.getNoticeImportant().equals("Y")){ %>
	                    	<td width="55px"><button id="important">공지</button></td>
	                    	<% } else{ %>
                        	<td width="55px"><%= n.getNoticeNo() %></td>
                        	<% } %>
	                        <td width="500px"><%= n.getNoticeTitle() %></td>
	                        <td width="145px"><%= n.getNoticeDate() %></td>
	                    </tr>
	                    <% } %>
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
                <%-- 제목 클릭시 상세페이지로 이동--%>
	            $(".tb1 tr").click(function(){
	            	var nno = $(this).children().eq(0).text();
	            	location.href = "<%= contextPath %>/noticeDetail.no?nno="+ nno;
	            	console.log(nno);
	            });
	            <%-- 중요공지사항일때 상세페이지 주소'nno=공지' 로 넘어가는거 수정 --%>
           
            });
            
            
            
        </script>

    </div>
    
     <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
</body>
</html>