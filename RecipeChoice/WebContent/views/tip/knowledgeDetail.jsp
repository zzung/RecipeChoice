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
            height:2500px;	/****자동으로 페이지 높이 조정하는 방법,,,,,,,*****/
            margin: auto;
        }
        #header{height:150px;} 
        #content{height:auto;}
        #footer{height:10%;}
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{ width: 5%;  }
        #content_2{ width: 90%; }

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
	<%@ include file="../common/menubarTemp.jsp" %>	
		 
	 <div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
        <div id="navigator"></div>
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

                <br><br><br>
                <div class="detailArea">
                    <div align="center">
                        <img src="resources/knowledge_upfiles/<%=t.getTipPicture() %>" width="400" height="250">
                    </div>
                    <br><br>
                    
                    <div align="center" style="font-size: 25px; font-weight: bolder; ">
                        <%=t.getTipTitle() %>
                    </div>
                    <div align="center">
	                    <hr width="500px">
	                    <div align="center" style="width: 400px;">
	                       <%=t.getTipInfo() %>
				                        간단설명간단설명간단설명간단설명간단설명간단설명간단설명
				                        간단설명간단설명간단설명간단설명간단설명간단설명간단설명간단설명간단설명간단설명간단설명
	                    </div>
	                    <hr width="500px">
                    </div>
                    <br><br><br>

                    <div id="detailContent" align="center" >
                        <p id="conTitle" style="font-size: 16px; font-weight: bolder;">asdfasdfasdf</p>
                        <img src="" width="400" height="250" style="margin-bottom: 20px;">
                        <p id="conInfo" style="word-break: break-all; width: 600px; margin-bottom: 100px;">
                            asdfadfasdfaasdfasdfasdfadfsdfasd
                            fasdfasdfadfasdfaasdfasdfasdfadfsdfasdfa
                            sdfasdfadfasdfaasdfasdfasdfadfsdfasdfasdfasdfadfasdfaa
                            sdfasdfasdfadfsdfasdfasdf
                        </p>
                        <p id="conTitle" style="font-size: 16px; font-weight: bolder;">asdfasdfasdf</p>
                        <img src="" width="400" height="250" style="margin-bottom: 20px;">
                        <p id="conInfo" style="word-break: break-all; width: 600px;">
                            asdfadfasdfaasdfasdfasdfadfsdfasd
                            fasdfasdfadfasdfaasdfasdfasdfadfsdfasdfa
                            sdfasdfadfasdfaasdfasdfasdfadfsdfasdfasdfasdfadfasdfaa
                            sdfasdfasdfadfsdfasdfasdf
                        </p>
                    </div>
                   
                </div>
                
                <br><br>
                <hr>

                <%-- 관리자 일때만 보이게 --%>
                <div align="right" style="margin-right: 50px;">
                	<% if(t.getStatus().equals("N")){ %>
                    	<a href="<%=contextPath%>/changeTipStatus.mn?tno=<%=t.getTipNo()%>" class="btn btn-danger">활성화</a>
					<% }else{ %>
                    	<a href="<%=contextPath%>/deleteKnowledge.mn?tno=<%=t.getTipNo()%>" class="btn btn-danger">삭제</a>
                    <% } %>
                    <a href="<%=contextPath%>/updateFormKnowledge.mn?tno=<%=t.getTipNo()%>" class="btn btn-success">수정</a>
                    <a href="<%=contextPath%>/knowledgeList.mn" class="btn btn-secondary">목록</a>
                </div>
                
                
            </div>
        </div>

        </div>
	 
	 <%@ include file="../common/footerTemp.jsp" %>
</body>
</html>