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
	
    .detailArea {border-collapse: collapse;}
	.detailArea{
    box-sizing: border-box;
    width: 100%;
    height: 40px;
    }
    .detailArea td:first-child{
    font-weight: bolder;
    text-align: center;
    }
    .detailArea tr {
    border-bottom: 1px solid gray;
    }
    .detailArea td{
		line-height: 30px;
     }

    a:hover {
        color: black;
        text-decoration: none;
        vertical-align: middle
     }
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
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
               
            </div>
            
            <div id="content_2">
	
				<br><br>
                <h1>1:1 문의
                    &nbsp;<img src="resources/image/admin/inquiry.jpg" >
				 </h1>
                <h3>&nbsp;1:1 상세보기</h3>
                <hr>

                <table class="detailArea" >
                    <tr>
                        <th >제목 | </th>
                        <td colspan="4" ><%= c.getConTitle() %></td>
                    </tr>
                    <tr>
                        <th>작성자 |</th>
                        <td><%= c.getUserNo() %></td>
                        <th>작성일 |</th>
                        <td><%= c.getConDate() %></td>
                    </tr>
                    <tr>
                        <th><h3>분야 |&nbsp;</h3></th>
                        <td >
                            <%= c.getConType() %>
                        </td>
                    </tr>
                    <tr>
                        <td><h3>내용&nbsp;</h3></td>
                        <td>
                           <textarea name="content" cols="70" rows="13" style="resize:none; margin-top:10px;"><%= c.getConContent() %></textarea>
                        </td>
                    </tr>
            </table> 
              <br> 
              <hr>    
            <br>
            <!-- 로그인한 회원 중 관리자 -->
            <% if(loginUser != null && loginUser.getMemId().equals("admin")){ %>
            <div align="right">
                <button type="submit" class="btn" onclick="answerConfirm();"> 답변하기</button>
                &nbsp;&nbsp;&nbsp;
                <button type="button" onclick="history.back();">취소</button>
            </div>
            <% } %>
        </div>  
        </form>
        <script>
        function answerConfirm(){
           location.href="<%= contextPath%>/answer.mc";
            }
     </script>
        </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>