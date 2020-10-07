<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.admin.contact.model.vo.*" %>    
<% 
	Contact c = (Contact)request.getAttribute("c");
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
	#footer{height:10%}
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
	
    .EnrollArea {border-collapse: collapse;}
	.EnrollArea{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    }
    .EnrollArea td:first-child{
    font-weight: bolder;
     text-align: center;
    }
    .EnrollArea tr {
    border-bottom: 1px solid gray;
   
    }
    .EnrollArea td{
		line-height: 30px;
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
        
        <div id="navigator"></div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">고객센터</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/faqDetail.fa'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/contactList.co?currentPage=1'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;1:1 문의</div>
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
                <h3>1:1 문의
                    &nbsp;<img src="<%= request.getContextPath() %>/resources/image/admin/inquiry.JPG">
				 </h3>
                <hr>

                <table class="EnrollArea" >
                    <tr>
                        <th >제목 | </th>
                        <td colspan="4" ><%=c.getConTitle() %></td>
                    </tr>
                    <tr>
                        <th>작성자 |</th>
                        <td><%=c.getUserNo() %></td>
                        <th>작성일 |</th>
                        <td><%=c.getConDate() %></td>
                    </tr>
                    <tr>
                        <th><h6><b>분야 |&nbsp;</b></h6></th>
                        <td >
                           	<%=c.getConType() %>
                        </td>
                    </tr>
                    <tr>
                        <td><h6><b>내용&nbsp;</b></h6></td>
                        <td>
                           <textarea name="content" cols="70" rows="8" style="resize:none; margin-top:10px;" readonly><%=c.getConContent() %></textarea>
                        </td>
                    </tr>
            </table> 
            <br> 
            <hr>     
            <% if(loginUser != null && loginUser.getMemId().equals(c.getUserNo())){ %>
             <div align="right">
                <button onclick="location.href='<%=contextPath%>/contactList.co?currenPage=1';">목록가기</button>
                <!-- 현재 로그인한 사용자가 해당 글을 작성한 작성자일 경우-->
                <button onclick="location.href='<%=contextPath%>/updateForm.co?cno=<%=c.getConNo()%>';">수정하기</button>
                <button onclick="deleteConfirm();">삭제하기</button>
            </div>
            <script>
	          function deleteConfirm(){
	        	  var del = confirm("삭제하시겠습니까 ?")
	        	  if(del == true)
	        	  {
	        		 location.href="<%=contextPath%>/delete.co?cno=<%=c.getConNo()%>";
	          }else{
	        	  alert("취소되었습니다.")
	          }
	        	  }
	        	  
           </script>
            <% } %>
        </div>  
        	

         </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
    </div>
    
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>