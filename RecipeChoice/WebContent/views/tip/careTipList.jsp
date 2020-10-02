<%@page import="com.kh.admin.tip.model.vo.Tip"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Tip> careTipList = (ArrayList<Tip>)request.getAttribute("careTipList");

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
		#header{height:20%;} 
		#content{/* height:70%; */ margin-top: 30px;}
		#footer{height:10%; margin-bottom: 30px;}
	    .nav{background:rgb(39, 174, 96);}
	        .menu{
	            display:table-cell;
	            height:30px;
	            width:150px;
	        }
		#navigator{height:5%}
		#content>div{
		    height:100%;
		    float:left;
		}
		#content_1{ width:18%; margin-right: 40px;}
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
        .tb1{border-collapse: collapse; margin: 10px; width: 700px; }
        tr{
            border: 1px solid lightgray;
            border-radius: 10px;
            line-height: 30px;
            margin-top: 8px;
            float: left;
            height: 40px;
        }
        .tb1 td{
            font-size: 12px;
            /* padding: 5px; */
            line-height: 40px;
        }
        .tb1>tbody>tr:hover{background: rgb(243, 243, 243); cursor: pointer;}
        .tb1>thead {font-weight: bolder; font-size: 15px;}

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
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<!-- 메뉴바추가 -->
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/memberList.mn'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/blackList.mn'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">재료 손질법 게시판 관리</p>
                <hr> 

                <table class="tb1">
                    <thead>
                        <tr>
                            <td width="50px">
                                &nbsp;&nbsp;<input type="checkbox" id="selectContent" name="selectContent" style="width: 15px; height: 15px;">
                            </td>
                            <td width="100px">글번호</td>
                            <td width="500px">&nbsp;&nbsp;제목</td>
                            <td width="100px">날짜</td>
                            <td width="100px">조회</td>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(careTipList.isEmpty()){ %>
                    	<tr>
                    		<td colspan="5" width="850px">게시글이 없습니다.</td>
                    	</tr>
                    	<%} else{ %>
	                    	<% for (Tip t : careTipList) { %>
	                        <tr>
	                            <td width="50px">
	                            &nbsp;&nbsp;<input type="checkbox" id="selectTip" name="selectContent" style="width: 15px; height: 15px;">
	                            </td>
	                            <td width="100px" id="tipNo"><%= t.getTipNo() %></td>
	                            <td width="500px" onclick="detailView();"><%= t.getTipTitle()%></td>
	                            <td width="100px"><%= t.getCreateDate() %></td>
	                            <td width="100px"><%= t.getTipCount() %></td>
	                        </tr>
	                        <% } %>
                        <%} %>
                    </tbody>
                </table>

                <br><br><br><br><br>
                <div align="right" >
                	<a href="" class="btn btn-dark">삭제</a>
                	<button onclick="careTipUpdate();" class="btn btn-primary">수정</button>
                	<a href="<%=contextPath%>/careTipEnrollForm.mn" class="btn btn-success">작성</a>
                </div>

            	</div>
            	<div id="content_3"></div>
        	</div>
	        <div id="footer">
	            <div class="pagination">
	                <a href="#">&laquo;</a> 
	                <a href="#">1</a> 
	                <a href="#">2</a> 
	                <a href="#">3</a> 
	                <a href="#">4</a> 
	                <a href="#">5</a> 
	                <a href="#">6</a>
	                <a href="#">&raquo;</a>
	            </div>
	        </div>
        </div>
        
        <script>
        	function careTipUpdate(){
        		if($("input:checkbox[id='selectTip']").is(":checked") == true) {
    				var tno = $(this).parent().children().eq(1).text();
    				console.log(tno);
    				location.href = <%=contextPath%>+"/updateFormCareTip.mn?tno="+tno;
    			}else{
    				alert("수정할 게시글을 선택해주세요 !");
    			}
        	};
			
		</script>
		
       	<script>
       
       		<%--체크박스까지 적용되지 않게 수정필요
        	$(function(){
        		$(".tb1>tbody>tr").click(function(){
        			var tno = $(this).children().eq(1).text();
        			console.log(tno);
        			location.href= "<%=contextPath%>/careTipDetail.mn?tno="+tno;
        		});
        	});
        	--%>
        	
        	<%-- function detailView(){
        		/* var tno = $(this).parent().children().eq(1).text(); */
        		var tno = $("#tipNo").val();
        		console.log(tno);
        		location.href= "<%=contextPath%>/careTipDetail.mn?tno="+tno;
        	} --%>
        </script>
        
        
        
</body>
</html>