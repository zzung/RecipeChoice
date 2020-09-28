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
	    height:1000px;
	    margin: auto;
	}
	#header{height:20%;} 
	#content{/* height:70%; */ margin-top: 30px;}
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
    .tb1 {border-collapse: collapse;}
	.tb1{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    margin: 5px;
    }
    .tb1 td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .tb1>tr{
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    .tb1 td, .tb1 th{
		line-height: 30px;
        padding-left: 0px;
        text-align: center;
    }
    .tb1 a{color: black; font-size:13px;}
	tbody>tr {cursor: pointer;}
	tbody>tr:hover{ background: #f3f3f3;}
    .pagination {
	    text-align: center;
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
	<!-- 메뉴바추가 -->
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                <br>
                <p style="font-size:18px; font-weight: bolder;">공지사항 관리</p>
                <hr>
                
                <% if(!noticeList.isEmpty()) { %>
	                <table class="tb1">
	                	<thead>
	                        <tr>
	                            <th width="80" >NO.</th>
	                            <th width="500">content</th>
	                            <th width="150">Date</th>
	                            <th width="200">Setting</th>
	                        </tr>
	                    </thead>
	                    <tbody>
	                    	<% for(Notice n : noticeList){ %>
		                    <tr>
		                       <td><%= n.getNoticeNo()%></td>
		                       <td><%= n.getNoticeTitle() %></td>
		                       <td><%= n.getNoticeDate() %></td>
		                       <td>
			                       <a id="noticeUpdate" onclick="return noticeUpdate();">수정</a>&nbsp;&nbsp;
			                       <a id="noticeDelete" onclick="return noticeDelete();">삭제</a>
		                       </td>
		                 	 </tr>
	                        <% } %>
	                    </tbody>
	                </table>
                <% } else{ %>
                	<div style="font-size: 18px;"><b>공지사항이 없습니다.</b></div>
                <% } %>
                <hr>
                <div align="right"><a href="<%=contextPath %>/enrollForm.mn" class="btn btn-secondary">글 작성</a></div>
                <div class="pagination" style="margin-left: 25%">
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
            <div id="content_3"></div>
        </div>
        
        <div id="footer">
            
        </div>
    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
    <script>
    	$(function(){
    		
    		$("#noticeUpdate").click(function noticeUpdate(){
    			var answer = confirm("수정하시겠습니까 ?");
                if(answer){
                	var nno = $(this).parents().parents().children().eq(0).text();
                    console.log(nno);
                    // 수정페이지로 이동
                    location.href="update.mn?nno="+nno;
                }else{
                    return;
                }
                event.stopPropagation();
    		});
    		
    		$("#noticeDelete").click(function noticeDelete(){
    			var answer = confirm("삭제하시겠습니까 ?");
                if(answer){
                	var nno = $(this).parents().parents().children().eq(0).text();
                    console.log(nno);
                    // 삭제 진행
                    
                    
                }else{
	                return;
                }
                event.stopPropagation();
    		});
    		
    		
    		$(".tb1>tbody>tr").click(function(){
    			var nno = $(this).children().eq(0).text();
				location.href="<%=contextPath%>/detail.mn?nno="+ nno;    	
				console.log(nno);
    		});
    		
    	});
            

    </script>
    
    
    
    
    
</body>
</html>