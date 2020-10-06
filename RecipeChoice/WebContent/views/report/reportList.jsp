<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList, com.kh.admin.report.model.vo.*, com.kh.user.member.model.vo.Member" %>
 <%
 	ArrayList<Report> list = (ArrayList<Report>)request.getAttribute("list");
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
 	
 	int listCount = pi.getListCount();
 	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();
 %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 #top{
            background:rgb(238, 237, 237);
            margin-top:auto;
            height:50px;
            
        }
	div{
	    box-sizing: border-box;
	}
	.wrap{
	    width:1000px;
	    height:800px;
	    margin: auto;
	}
	#header{height:20%} 
    .nav{background:rgb(39, 174, 96);}
        .menu{
            display:table-cell;
            height:30px;
            width:150px;
        }
	#navigator{height:5%}
	#content{height:70%}
	#footer{height:10%}
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
	#menu_2:hover{color:rgb(39, 174, 96);}
	.rep{border-collapse: collapse;}
	.rep{
    box-sizing: border-box;
    width: 95%;
    height: 40px;
    margin: 5px;
    }
    .rep td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .rep tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
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
    
	tr>td>a {cursor: pointer;}
	tbody>tr:hover{background: rgb(243, 243, 243)}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!--메뉴바 추가-->
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
    
        <div id="navigator"></div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqList.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;신고 관리</div>
               
            </div>
            <div id="content_2">
	
				<br><br>
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;신고 관리
                 </h3>
                <hr>
              
                <table class="rep">
                <thead>
                 <tr>
                    <th >NO.</th>
                    <th width="400">신고 게시물</th>
                    <th width="300">작성자</th>
                    <th width="200">신고자</th>
                    <th width="300">신고사유</th>
                    <th width="200">신고일</th>
                  </tr>
                </thead>
                <tbody>
                <%if(list.isEmpty()){ %>
        		<tr>
        			<td colspan ="6">조회된 리스트가 없습니다.</td>
       			</tr>
        		<% }else { %>
        	<%for(Report r: list) {%>
                    <tr>
                        <td><%= r.getRepNo()%></td>
                       
                        <td><a href="<%=contextPath%>/신고된게시글">신고된게시글이</a></td>
                       
                        <td><a href="<%=contextPath%>/memberDetail.mn?uno=<%=loginUser.getUserNo()%>"><%= r.getRepWriterNo()%></a></td>
                        <td><a href="<%=contextPath%>/memberDetail.mn?uno=<%=loginUser.getUserNo()%>"><%= r.getRepTargetNo() %></a></td>
                       <td><%= r.getRepReason()%></td>
                        <td><%= r.getRepDate()%></td>
                    </tr>
	                  <% } %> 
	                <% } %>  
               	 </tbody>
    			</table>
            </div>
          
        <div id="footer">
         <div class="pagination">
         		<% if(currentPage != 1) {%>
                <a href="location.href='<%=contextPath%>/reportList.mr?currentPage=1';">&laquo;</a> 
               <% } %>
               
               <%for(int p=startPage; p<=endPage; p++) { %> 
               <% if(p != currentPage){ %>
                <a href="location.href='<%=contextPath%>/reportList.mr?currentPage=<%=p%>';"><%=p %></a> 
               	<%}else{ %>
               	<a disabled><%= p %></a>
               	<%} %>
               <% } %>
               
                <%if(maxPage != 0 && currentPage != maxPage){ %>
                <a href="#location.href='<%=contextPath%>/reportList.mr?currentPage=<%= maxPage%>';">&raquo;</a>
            	<% } %>
            </div>
        </div>
    </div>
    </div>
    <!-- footer 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>