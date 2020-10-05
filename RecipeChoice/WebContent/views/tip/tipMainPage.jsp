<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .tb1{border-collapse: collapse; margin: 10px; width: 700px; }
    tr{
        border: 1px solid lightgray;
        border-radius: 10px;
        line-height: 30px;
        cursor: pointer;
        margin-top: 8px;
        float: left;
        height: 40px;
    }
    .tb1 td{
        font-size: 15px;
        padding: 5px;
    }
    tr:hover{background: rgb(243, 243, 243)}
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/memberList.mn'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/blackList.mn'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/tip.mn'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">꿀팁 관리</p>
                <hr> 

                <table class="tb1">
                	<thead>
	                    <tr>
	                        <td width="50px">&nbsp;&nbsp;&nbsp;<img src="resources/image/admin/boardIcon1.png" style="width: 20px; height: 20px;"></td>
	                        <td width="700px"> 재료 손질법 게시판 관리</td>
	                        <td width="50px">&gt;&gt;</td>
	                    </tr>
	               </thead>
	               <tbody>
	                    <tr>
	                        <td width="50px">&nbsp;&nbsp;&nbsp;<img src="resources/image/admin/boardIcon1.png" style="width: 20px; height: 20px;"></td>
	                        <td width="700px"> 재료 상식 게시판 관리</td>
	                        <td width="50px">&gt;&gt;</td>
	                    </tr>
                   </tbody>
                </table>

            </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
        
        
        <script>
        	$(function(){
        		
        		$(".tb1>thead>tr").click(function(){
        			location.href="<%=contextPath%>/careTipList.mn";
        		});
        		
        		$(".tb1>tbody>tr").click(function(){
        			location.href="<%=contextPath%>/knowledgeList.mn"
        		});
        		
        	});
        </script>
        
        
</body>
</html>