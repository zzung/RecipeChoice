<%@page import="com.kh.admin.tip.model.vo.Tip"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Tip t = (Tip)request.getAttribute("t");
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
            overflow: hidden;
            height: auto;	/****자동으로 페이지 높이 조정하는 방법,,,,,,,*****/
            margin: auto;
        }
        #header{height:150px;} 
        #content{height:auto;}
        #footer{height:10%;}
        #content>div{
            height:auto;
            float:left;
        }
        #content_1{ width: 5%;  }
        #content_2{ width: 90%; }
        #content_3{ width: 5%; }

        #detailTop>p{ margin-left: 20px;}

        .detailTable{border-collapse: separate;border-spacing: 0 50px;}
        .detailTable img{margin-right: 50px;}
        .detailTable tr:last-child{
            width: 60%;
            height: 150px;
            margin: 5%;
            margin-left: 100px;
            margin-top: 50px;
        }
		.detailTable td{text-align: center;}

        .pagination {
	    display: inline-block;
        margin-left: 40%;
        margin-top: 100px;
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
</head>
<body>

	<!-- 사용자 화면에서도 띄워질것 -->
	
	<!-- 메뉴바추가 -->
	<%@ include file="../common/menubar.jsp" %>	
		 
	 <div class="wrap">
        <div id="header"></div>
        <div id="content">
            <div id="content_1">
                
            </div>
            <div id="content_2">
                
                <div id="detailTop">
                    <hr>
                    <p style="font-size: 18px; font-weight: bolder;"><%=t.getTipTitle() %></p>
                    <hr>  
                    <p>관리자 &nbsp;&nbsp;|&nbsp;&nbsp;<%=t.getCreateDate() %></p>
                    <hr>
                    <p align="right">조회수 : <%=t.getTipCount() %></p>
                </div>

                <br>
                <div class="detailArea" align="center">
                    <div align="center" style="font-size: 25px; font-weight: bolder;"><%=t.getTipTitle() %></div>
                    <input type="hidden" id="tipPic" name="tipPic" value="<%=t.getTipPicture() %>">
                    <hr width="500px">
                    <div align="center" style="width: 400px;">
			        	<%=t.getTipInfo() %>
                    </div>
                    <hr width="500px">
                    <br>

                    <table class="detailTable" align="center">
                        <tr>
                            <td width="800" style="word-break: break-all; ">
                               <%=t.getTipContent() %>
                            </td>
                        </tr>
                    </table>
                </div>
                
                
                <br>
                <hr>

                <div align="right" style="margin-right: 50px;">
                	<% if(loginUser.getMemId().equals("admin")){ %>
	                	<% if(t.getStatus().equals("N")){ %>
	                    	<a href="<%=contextPath%>/changeTipStatus.mn?tno=<%=t.getTipNo()%>" class="btn btn-danger">활성화</a>
						<% }else{ %>
	                    	<a href="<%=contextPath%>/deleteCareTip.mn?tno=<%=t.getTipNo()%>" class="btn btn-danger">삭제</a>
	                    <% } %>
                    <a href="<%=contextPath%>/updateFormCareTip.mn?tno=<%=t.getTipNo()%>" class="btn btn-success">수정</a>
                    <a href="<%=contextPath%>/careTipList.mn" class="btn btn-secondary">목록</a>
                    <%} %>
                    <a href="<%=contextPath%>/careTipList.tip?page=1" class="btn btn-secondary">목록</a>
                </div>
				
            </div>
        </div>
	 
	 </div>
	 <br><br>
	 <%@ include file="../common/footerTemp.jsp" %>
</body>
</html>