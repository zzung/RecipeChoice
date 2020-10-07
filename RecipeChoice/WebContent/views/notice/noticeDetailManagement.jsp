<%@page import="com.kh.admin.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("n");
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
        #header{height:20%; margin-bottom:10px;} 
        #content{ margin-top:20px;}
        #footer{height:10%; }
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{ width:18%;  margin-right: 40px;}
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
        #noticeTitle{
            text-align: center; 
            line-height: 50%;
            padding: 10px;
            font-size: 15px;
            font-weight: bolder;
            }
        #noticeDate{
            float: right;
            padding: 5px;
            font-size: 12px;
            font-weight: bolder;
        }
        #noticeContent{
            margin-bottom: 10%;
            height: 350px;
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
        <div class="nav">
            <div class="menu"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn?page=1'" style="color: rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/memberList.mn?page=1'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/blackList.mn?page=1'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqList.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr?currentPage=1'">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">

                <hr>
                <div id="noticeTitle">No.<%=n.getNoticeNo()%>&nbsp;&nbsp;<%= n.getNoticeTitle() %></div>
                <hr>
                <div id="noticeDate"><%= n.getNoticeDate() %></div>
                <br><br><br><br>

                <div id="noticeContent">
					<%= n.getNoticeContent() %>   
				</div>
				                
                <hr>
                <div  align="center">
	                <a href="<%=contextPath%>/notice.mn" class="btn btn-dark">목록으로</a>
	                <a href="<%=contextPath%>/updateForm.mn?nno=<%=n.getNoticeNo()%>" class="btn btn-primary">수정하기</a>
	                <a href="<%=contextPath%>/delete.mn?nno=<%=n.getNoticeNo()%>" class="btn btn-danger">삭제하기</a>
                </div>
	        	
            </div>
            
            <div id="content_3"></div>
        
        
    </div>
</body>
</html>