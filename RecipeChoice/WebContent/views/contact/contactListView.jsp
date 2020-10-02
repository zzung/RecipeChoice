<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.admin.contact.model.vo.*" %>    
<%
	ArrayList<Contact> listView = (ArrayList<Contact>)request.getAttribute("listView");

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
	#menu_2:hover{color: rgb(39, 174, 96);}
    .inq_s {border-collapse: collapse;}
	.inq_s{
    box-sizing: border-box;
     width: 95%;
    height: 40px;
    margin: 5px;
    }
    .inq_s td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .inq_s tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    .inq_s td{
		line-height: 30px;
        padding-left: 0px;
    }

    a:hover {
        color: black;
        text-decoration: none;
        vertical-align: middle
        
    }
    tbody>tr {cursor: pointer;}
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr'">&nbsp;&nbsp;&nbsp;신고 관리</div>
               
            </div>
            <div id="content_2">
	
				<br><br>
                <h1>1:1 문의 조회
                    &nbsp;<img src="resources/image/admin/inquiry.jpg" align="center">
				</h1>
             
                <table class="inq_s">
                <thead>
                    <th width="80">NO.</th>
                    <th>   </th>
                    <th width="300">Content</th>
                    <th width="400">Title</th>
                    <th width=200">NickName</th>
                    <th width="200">Date</th>
                    <th width="200">Status</th>
                </thead>
                <tbody>
                <!-- 리스트가 비어있을 경우 -->
                <% if(listView.isEmpty()) {%>
                <tr>
                	<td colspan="5">존재하는 1:1문의가 없습니다.</td>
                </tr>
                <% }else { %>
                <!--  리스트가 비어있지 않을 경우 -->
                <% for(Contact c : listView){ %>
                
                    <tr>
                        <td>1004</td>
                        <td>🔒</td>
                        <td><%= c.getConTitle() %></td>
                        <td><%= c.getUserNo() %></td>
                        <td><%= c.getConDate() %></td>
                        <td><%= c.getAnswer() %></td>
                    </tr>
                      <%} %>
                    <% }  %>
                 
                    <tr>
                        <td>1002</td>
                        <td>🔒</td>
                        <td>re:기타 문의</td>
                        <td>관리자</td>
                        <td>2020-08-24</td>
                        <td><a onclick="modifyConfirm();">수정</a>&nbsp;&nbsp;<a onclick="deleteConfirm();">삭제</a></td>
                    </tr>
                
                    
                 </tbody>
    
                </table>
                <!-- 상세조회요청url 이동 -->
                <script>
                	$(function(){
                		$(".inq_s>tbody>tr").click(function(){
                			location.href="<%=contextPath%>/detail.mc?bno=" + $(this).children().eq(0).text();	
                		});
                	});
                
                </script>
                <script>
                    function modifyConfirm(){
                         location.href='./inquirymodify.no';
 
                         } 
              
                </script>
                <script>
                    function deleteConfirm(){
                        if(confirm("삭제하시겠습니까?")){
                            location.href='./inquirydelete.no';
                        }else{
                            return false;
                         } 
                        }
                    
                </script>

                <!--상세페이지용-->
                <script>
                    $(function(){
                        $(".inq_s>tbody>tr").click(function(){
                       });
                    });
                    
                </script>
                

            </div>
            
        
        <div id="footer"></div>
    </div>
    
    
     <!-- footer 추가-->
     <%@include file="../common/footer.jsp" %>
</body>
</html>