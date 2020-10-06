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
            /* border: 1px solid red */
        }
        .wrap{
            width:1000px;
            height:800px;
            margin: auto;
        }
        #header{height:20%;} 
        #content{height:70%}
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqdetail.fa'">&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.co?currentPage'">&nbsp;&nbsp;1:1 문의</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;개인정보취급방침</div>
                <div id="menu_3">
                    <br>&nbsp;&nbsp;고객센터
                    <br>&nbsp;&nbsp;1234-5678
                    <br>&nbsp;&nbsp;평일 10:00 ~ 18:00
                    <br>&nbsp;&nbsp;(토,일 공휴일은 휴무)
                </div>
            </div>
            <div id="content_2">
                <div id="contentTop" align="right" style="margin-top:20px; margin-bottom:20px">
		            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
		                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
		            </svg>
		            <a href="<%=contextPath%>/serviceCenter.no">고객센터</a>
		            &lt;
		            <a href="<%=contextPath%>/notice.no">공지사항</a>
		        </div>
		        
                <hr>
                <div id="noticeTitle">No.<%=n.getNoticeNo()%>&nbsp;&nbsp;<%= n.getNoticeTitle() %></div>
                <hr>
                <div id="noticeDate"><%= n.getNoticeDate() %></div>
                <br><br><br>

                <span id="noticeContent">
					<%= n.getNoticeContent() %>   
              	 	<br><br><br><br><br><br>
                </span>
                
                <br><br><br><br><br><br><br>
                <hr>
                
                <div align="center"><a href="<%=contextPath%>/notice.no" class="btn btn-success">목록으로</a></div>
	        
            </div>
            
            <div id="content_3"></div>
        </div>
    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
</body>
</html>