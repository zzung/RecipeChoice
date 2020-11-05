<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.contact.model.vo.*" %>  

<%  
	ArrayList<Contact> list =(ArrayList<Contact>)request.getAttribute("list");//조회된 1:1문의 리스트가 담김
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
	div{
	    box-sizing: border-box;
	}
	.wrap{
	    width:1000px;
	    height:800px;
	    margin: auto;
	}
	#header{height:20%} 
   
	#navigator{height:5%}
	#content{height:70%}
	#footer{height:10%;}
	#content>div{
	    height:100%;
	    float:left;
	}
	#content_1{ width:18%; margin-right: 40px;}
	#content_2{ width:75%}
	#content_3{ width:3%}
	
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
	.inq {border-collapse: collapse;}
	.inq{
    box-sizing: border-box;
     width: 95%;
    height: 40px;
    margin: 5px;
    }
    .inq td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .inq tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    .inq td{
		line-height: 30px;
        padding-left: 0px;
    }
    
    #img{
        cursor:pointer;
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
        background-color: gray;
        border-radius: 5px;
    }
 
    tbody>tr:hover{background: rgb(243, 243, 243)}

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
        
        <div id="navigator"></div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">고객센터</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href='<%= contextPath%>/faqDetail.fa'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.co?currentPage=1'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;1:1 문의</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;개인정보취급방침</div>
                <div id="menu_3">
                    <br><b>&nbsp;&nbsp;고객센터</b><br>
                    <b>&nbsp;&nbsp;1234-5678</b>
                    <br>&nbsp;&nbsp;평일 10:00 ~ 18:00
                    <br>&nbsp;&nbsp;(토,일 공휴일은 휴무)<br>
                </div>
            </div>
            <div id="content_2">
	
				<br><br>
                <h3>1:1 문의 조회
                    &nbsp;<img src="<%= request.getContextPath() %>/resources/image/admin/inquiry.JPG">
				</h3>
            	
                <hr>
                <table class="inq">
                <thead>
                  <tr>
                    <th width="80">NO.</th>
                    <th width="300">Type</th>
                    <th width="400">Title</th>
                    <th width="200">Name</th>
                    <th width="200">Date</th>
                    <th width="200">Status</th>
                  </tr>
                </thead>
                <tbody>
                   <!--자기꺼만 삭제할 수 있도록 보여지기 삭제아이콘-->
                   <!-- 리스트가 비어있을 경우 -->
                   <% if(list.isEmpty()){ %>
                   <tr>
                   		<td colspan="6">존재하는 1:1문의가 없습니다.</td>
                   </tr>
                   <% }else { %>
                   <!-- 리스트가 비어있지 않을 경우 -->
                   <% for(Contact c: list) { %>
                    <tr>
                        <td><%=c.getConNo() %></td>
                        <% if (c.getConType().equals("답변")){ %>
                        <td>  </td>
                        <% }else {%>
                        <td><%=c.getConType() %></td>
                        <% } %>
                        <td><%=c.getConTitle() %></td>
                        <td><%=c.getUserNo() %></td>
                        <td><%=c.getConDate() %></td>
                        <td>  <% if(loginUser != null && loginUser.getMemId().equals(c.getUserNo())) { %>
                         <img id="img"onclick="contactDelete(this); event.stopImmediatePropagation();" src="resources/image/admin/recyclebin.JPG" >
                		<%} %>
                    </tr>
                    <script>
	                const contactDelete =  function(e){
				    var answer = confirm("삭제하시겠습니까 ?");
				    if(answer){
				       var cno = e.parentNode.parentNode.childNodes[1].textContent;
				           // 삭제 진행
				       location.href="<%=contextPath%>/delete.co?cno="+cno;
				     }else{
					return;
				     }
				    };
				    
				    $(function(){
					$(".inq>tbody>tr").click(function(){
				    	var cno = $(this).children().eq(0).text();
					 	location.href="<%=contextPath%>/detail.co?cno=" + $(this).children().eq(0).text();   	
				     });
				    });
					</script>
                   <% } %>
                 <% } %>
                 </tbody>
                 
                </table>
                 
                <br>
           		<!-- 로그인한 회원만 글작성이 보여짐,, -->
                <% if(loginUser != null ){ %>
                <div id="content_3" align="right" style="width:710px;">
                <button onclick="location.href='<%=contextPath%>/enrollForm.co';">글작성</button>
                <br><br>
                </div>
                <% } %>
                
                
        	<div id="footer">
            <div class="pagination">
         		<% if(currentPage != 1) {%>
                <a href='<%=contextPath%>/contactList.co?currentPage=1'>&laquo;</a> 
               <% } %>
               
             <%for(int p=startPage; p<=endPage; p++) { %> 
                <% if(p != currentPage){ %>
                <a href='<%=contextPath%>/contactList.co?currentPage=<%= p%>'><%= p%></a> 
               	<%}else{ %>
               	<a disabled><%= p %></a>
               	<%} %>
              <% } %>
               
                <%if(maxPage != 0 && currentPage != maxPage){ %>
                <a href='<%=contextPath%>/contactList.co?currentPage=<%= maxPage%>'>&raquo;</a>
            	<% } %>
            </div>
         
        </div>
    </div>
    </div>
    </div>
  
        <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
</body>
</html>