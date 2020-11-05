<%@page import="com.kh.admin.common.PagingManager"%>
<%@page import="com.kh.admin.tip.model.vo.Tip"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ArrayList<Tip> knowledgeList = (ArrayList<Tip>)request.getAttribute("knowledgeList");
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
        #header{height:200px;} 
        #content{height:70%}
        #footer{height:10%;}
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{ width: 5%;  }
        #content_2{ width: 90%; }
        #content_3{ width: 5%;}
        .listArea{
         width: 100%;
         margin: 10px;
        }
        .thumbnail{
            border: 1px solid white;
            width: 250px;
            display: inline-block;
            /* margin-left: 20px;
            margin-bottom: 20px; */
            margin: 20px;
        }
        .thumbnail:hover{
            cursor: pointer;
            opacity: 0.8;
        }
        #order>a{text-decoration: none; color: black;}
        #order>a:hover{color: rgb(39, 174, 96);}

        .pagination {
	    display: inline-block;
        margin-left: 40%;
        margin-top: 50px;
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
	<!-- 메뉴바추가 -->
	<%@ include file="../common/menubar.jsp" %>	

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
                
                <p style="font-weight: bolder; font-size: 18px;">재료에 대한 상식</p>
                <hr> 
                <p id="order" align="right" style="font-size: 14px; margin-right: 30px;">
                    <a href="" class="">조회순</a>&nbsp;&nbsp;&nbsp;
                    <a href="" class="">최신순</a>
                </p>
                <hr>

                <div class="listArea">
			
                    <% if(knowledgeList != null) { %>
                        <% for(Tip t : knowledgeList) { %> 
                            <div class="thumbnail">
                                <input type="hidden" value="<%= t.getTipNo() %>">
                                <a href="<%=contextPath%>/knowledgeDetail.tip?tno=<%= t.getTipNo()%>"><img src="resources/knowledge_upfiles/<%= t.getTipPicture() %>" width="250" height="180"></a> <br>
                                <p align="center" style="font-size: 14px; font-weight: bolder;"><%=t.getTipTitle() %></p>
                                <p> <%=t.getTipInfo() %></p>
                                <p align="right" style="margin-right: 10px;">조회수 : <%=t.getTipCount() %></p>
                            </div>     
                        <% } %>
                    <% }else { %>
                    <h3>게시물이 없습니다.</h3>
                    <% } %>
                </div>
                
				<div class="pagination" align="center">
	                <% PagingManager pm = (PagingManager)request.getAttribute("pagingManager"); %>
	                <%if(pm.getNowBlock()>=2) { %>
	               	<a href="<%=contextPath%>/knowledgeList.tip?page=<%=pm.getStartPage()-1%>">&laquo;</a>
	                <% } %>
	            	<%for(int i=0; i<pm.getEndPage(); i++){ %>
	            	<a href="<%=contextPath%>/knowledgeList.tip?page=<%=i+1%>"><%=i+1%></a>
	            	<% } %>
	            	<%if(pm.getNowBlock()<pm.getTotalBlock()){ %>
	            	<a href="<%=contextPath%>/knowledgeList.tip?page=<%=pm.getEndPage()+1%>">&raquo;</a>
	            	<% } %>
            	</div>
            	
            </div>
            <div id="content_3"></div>
        </div>
        </div>
        <div id="footer"></div>

</body>
</html>