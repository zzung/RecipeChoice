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
        .tb1{border-collapse: collapse; margin: 10px; width: 700px; height: 100%;}
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
	    text-align: center;
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn?page=1'" >&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/memberList.mn?page=1'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/blackList.mn?page=1'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/tip.mn'" style="color:rgb(39, 174, 96)">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqList.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr?currentPage=1'">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">재료에 대한 상식 게시판 관리</p>
                <hr> 

                <table class="tb1">
                    <thead>
                        <tr>
                            <td width="50px">
                                &nbsp;&nbsp;
                            </td>
                            <td width="100px">글번호</td>
                            <td width="350px">&nbsp;&nbsp;제목</td>
                            <td width="100px">날짜</td>
                            <td width="100px">조회</td>
                            <td width="100px">상태</td>
                        </tr>
                    </thead>
                    <tbody>
                    	<% if(knowledgeList.isEmpty()){ %>
                    	<tr>
                    		<td colspan="6" width="850px">게시글이 없습니다.</td>
                    	</tr>
                    	<%} else{ %>
	                    	<% for (Tip t : knowledgeList) { %>
	                        <tr>
	                            <td width="50px">
	                            &nbsp;&nbsp;<input type="checkbox" id="selectTip" name="selectContent" onclick="event.stopPropagation();" style="width: 15px; height: 15px;">
	                            </td>
	                            <td width="100px" id="tipNo"><%= t.getTipNo() %></td>
	                            <td width="350px"><%= t.getTipTitle()%></td>
	                            <td width="150px"><%= t.getCreateDate() %></td>
	                            <td width="100px"><%= t.getTipCount() %></td>
	                            <td width="100px"><%= t.getStatus() %></td>
	                        </tr>
	                        <% } %>
                        <%} %>
                    </tbody>
                </table>
				
				<br><br><br>
                <div align="right" style="margin-bottom: 30px">
                	<button onclick="knowledgeDelete();" class="btn btn-dark">삭제</button>
                	<button onclick="knowledgeUpdate();" class="btn btn-primary">수정</button>
                	<a href="<%=contextPath%>/knowledgeEnrollForm.mn" class="btn btn-success">작성</a>
                	<hr>
                </div>
                
				<div class="pagination" align="center">
	                <% PagingManager pm = (PagingManager)request.getAttribute("pagingManager"); %>
	                <%if(pm.getNowBlock()>=2) { %>
	               	<a href="<%=contextPath%>/knowledgeList.mn?page=<%=pm.getStartPage()-1%>">&laquo;</a>
	                <% } %>
	            	<%for(int i=0; i<pm.getEndPage(); i++){ %>
	            	<a href="<%=contextPath%>/knowledgeList.mn?page=<%=i+1%>"><%=i+1%></a>
	            	<% } %>
	            	<%if(pm.getNowBlock()<pm.getTotalBlock()){ %>
	            	<a href="<%=contextPath%>/knowledgeList.mn?page=<%=pm.getEndPage()+1%>">&raquo;</a>
	            	<% } %>
           		</div>
           		
            	</div>
            	<div id="content_3"></div>
        	</div>
	        <div id="footer">
	        </div>
        </div>
        
	
		<script>
			const knowledgeUpdate = function(){
            var check_length = document.getElementsByName("selectContent").length;
            var check_cnt = 0;
            var tno = 0;
            for(var i=0; i<check_length; i++){
               if(document.getElementsByName("selectContent")[i].checked==true){
                  check_cnt++;
                  tno = document.getElementsByName("selectContent")[i].parentNode.nextSibling.nextSibling.textContent;
               }
            }
            if(check_cnt == 0){
               alert("수정할 게시글을 선택해 주세요 !");
            }else if(check_cnt >= 2){
               alert("한 번에 하나의 게시글만 수정 가능합니다.");
            }else{
               location.href= "<%=request.getContextPath()%>"+"/updateFormKnowledge.mn?tno="+tno;
            }
         };
         
         	const careTipDelete = function(){
         		var check_length = document.getElementsByName("selectContent").length;
                var check_cnt = 0;
                var tno = "";
                for(var i=0; i<check_length; i++){
                   if(document.getElementsByName("selectContent")[i].checked==true){
                      check_cnt++;
                      if(check_cnt==1){
                    	  tno = document.getElementsByName("selectContent")[i].parentNode.nextSibling.nextSibling.textContent;
                      }else{
                     	  tno += ","+document.getElementsByName("selectContent")[i].parentNode.nextSibling.nextSibling.textContent;
                      }
                   }
                }
                console.log(tno);
                if(check_cnt == 0){
                   alert("삭제할 게시글을 선택해 주세요 !");
                }else{
                   location.href= "<%=request.getContextPath()%>"+"/deleteKnowledge.mn?tno="+tno;
                }
         		
         	};
         
         
         
       
       		/* 체크박스까지 적용되지 않게 수정필요 */
        	$(function(){
        		$(".tb1>tbody>tr").click(function(){
        			var tno = $(this).children().eq(1).text();
        			console.log(tno);
        			location.href= "<%=contextPath%>/knowledgeDetail.mn?tno="+tno;
        		});
        	});
        	

        </script>
        
        
        
</body>
</html>