<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.admin.faq.model.vo.*" %>    
<%
	Faq f = (Faq)request.getAttribute("f"); //제목이랑 내용 번호
	
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
	.faq {border-collapse: collapse;}
	.faq{
    box-sizing: border-box;
    width: 90%;
    height: 40px;
    }
    .faq td:first-child{
    font-weight: bolder;
     text-align: center;
    }
    .faq tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
     }
    .faq td{
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
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/seasonList.ms'">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/faqList.mf'"style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/reportList.mc'">&nbsp;&nbsp;&nbsp;신고 관리</div>
                </div>
            
            	<div id="content_2">
	
				<br>
                <h4>자주 묻는 질문
                    &nbsp;<img src="resources/image/admin/faq.jpg">
                </h4>
                <h5>FAQ</h5>
                <hr>
                <form id="updateForm" action="<%=contextPath %>/update.mf" method="post"> 
                <input type="hidden" name="fno" value="<%= f.getFaqNo() %>">
        		 <table class="faq">
                       <tr>
                           <th ><h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목 &nbsp;&nbsp;&nbsp;</h5></th>
                           <td colspan="4" ><input type="text" name="title" style="width:78%;" placeholder="내용을 입력하세요" value="<%=f.getFaqTitle() %>" required style="height:22px;"></td>
                       </tr>
                       <tr>
                           <td><h5>내용</h5></td>
                           <td>
                              <textarea name="content" cols="60" rows="6" style="resize:none; margin-top:10px; margin-bottom:10px;"required><%=f.getFaqContent() %></textarea>
                           </td>
                       </tr>
                 </table>   
                 <br>    
               <br>
               <div align="center">
                   <button type="submit">수정하기</button>
               </div>
           </div>  
       </form>
          </div>
          
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>