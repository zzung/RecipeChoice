<%@page import="com.kh.admin.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Notice n = (Notice)request.getAttribute("n");
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
        #content{height:70%; margin-top: 30px;}
        #footer{height:10%; margin-bottom: 30px;}
      
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
        .tb1 {border-collapse: collapse;}
        .tb1{
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        margin: 30px;
        margin-bottom: 100px;
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
       
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn?page=1'" style="color: rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/memberList.mn?page=1'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/blackList.mn?page=1'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqlist.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr?currentPage=1'">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                <br><br>
                <p style="font-weight: bolder; font-size: 18px;">공지사항 수정하기</p>
                <hr>
                 
                <form id="updateForm" action="<%=contextPath%>/update.mn" method="post">
                	<input type="hidden" id="noticeNo" name="noticeNo" value="<%=n.getNoticeNo() %>">
	                <table class="tb1">
		                <tr>
		                    <th width="70" >제목</th>
		                    <td>
		                        <input name="noticeTitle" id="noticeTitle" type="text" value="<%=n.getNoticeTitle()%>"style=" width: 300px; height:30px; float: left; padding-top: 5px; margin-top: 10px; margin-bottom: 10px;">&nbsp;&nbsp;&nbsp;
		                        <input name="noticeImportant" id="noticeImportant" onclick="doOpenCheck(this);" value="Y" type="checkbox" style="margin-top: 15px;"> 중요공지 &nbsp;
		                        <input name="noticeImportant" id="noticeImportant" onclick="doOpenCheck(this);" value="N" type="checkbox"> 일반공지
		                    </td>
		                </tr>
		                <tr>
		                    <th>글쓰기</th>
		                    <td>
		                        <textarea id="noticeContent" name="noticeContent" style="resize: none; width: 550px; height: 300px; float: left; padding-top: 5px; margin-top:10px; margin-bottom: 20px; font-size: 15px;"><%= n.getNoticeContent()%></textarea>
		                    </td>
		                </tr>
	                </table>
	                <script>
		                function doOpenCheck(chk){
		                    var obj = document.getElementsByName("noticeImportant");
		                    for(var i=0; i<obj.length; i++){
		                        if(obj[i] != chk){
		                            obj[i].checked = false;
		                        }
		                    }
		                }
	                <%--  
	                	if ($("#noticeImportant").prop("checked")){
	                		$("#noticeImportant").val('Y');
	                	}else{
	                		$("#noticeImportant").val('N');
	                	}
	                --%>
	                <%--
	                	var chk = document.getElementsByName("noticeImportant");
	                	if(chk[0].checked) {
	                		chk[0].value = "Y";
	                	}else{
	                		chk[0].value="N";
	                	}
	                	console.log(chk[0].value);
	                --%>	
	                	
	                </script>
	                
	                <script>
	                	// 줄바꿈 처리
		                var str = document.getElementById("noticeContent").value;
	                	str = str.replace("\n","<br>");
	                	document.getElementById("text").innerHTML = str;
	                </script>
	                
	                <hr>
	                <div align="right">
	                	<input type="submit" class="btn btn-success" value="등록">
	                	<input type="button" onclick="history.back();" class="btn btn-secondary" value="뒤로">
	                </div>
	        	</form>
	        	
            </div>
            
            <div id="content_3"></div>
        
    	</div>    
    </div>
</body>
</html>