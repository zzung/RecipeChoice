<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    height: 8%;
	    margin-top: 10px;
	    line-height: 40px;
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
	#content_2>table td{ text-align: center;}
	table{ border-spacing: 10px; border-collapse: separate;}
	#content_2>img { width: 100%}
</style>
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
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.no'">&nbsp;&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqDetail.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.co?currentPage=1'">&nbsp;&nbsp;&nbsp;1:1 문의</div>
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
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;고객센터 이렇게 이용하세요 !</h4>
                <hr><br><br>
                <img src="resources/image/admin/serviceCenter.jpg" align="center">
				
				<br>
                <table>
                    <tr>
                        <td style="width: 350px">
	                                                     궁금한 사항을 자주 묻는  <br> 질문에서 먼저 확인 하세요 <br><br>
	                        <a href="<%= contextPath %>/faqDetail.mf" class="btn btn-secondary">&nbsp;GO&nbsp;</a>
                        </td>
                        <td style="width: 500px">
	                                                     원하는 답변이 없을 경우 <br> 운영자에게 1:1 문의를 남겨주세요 <br><br>
	                        <a href="<%= contextPath %>/contactList.co?currentPage=1" class="btn btn-secondary">&nbsp;GO&nbsp;</a>
                        </td>
                        <td style="width: 300px">
                                                              접수하신 문의내용을 <br> 확인해주세요 <br><br>
                            <a href="" class="btn btn-secondary">&nbsp;GO&nbsp;</a>
                        </td>
                    </tr>
                </table>

                <br><br><br>
                <hr>
            </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>

    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>