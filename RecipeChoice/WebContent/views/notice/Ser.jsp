<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content_2>table td{ text-align: center;}
	table{ border-spacing: 10px; border-collapse: separate;}
	#content_2>img { width: 100%}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<%@include file="../common/serviceCenter_navbar.jsp" %>
	
	<div id="content_2">
	
				<br><br>
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;고객센터 이렇게 이용하세요 !</h4>
                <hr><br><br>
                <img src="resources/image/navbar/serviceCenter.jpg" align="center">
				
				<br>
                <table>
                    <tr>
                        <td style="width: 350px">
                            궁금한 사항을 자주 묻는  <br> 질문에서 먼저 확인 하세요 <br><br>
                            <a href="" class="btn btn-secondary">&nbsp;GO&nbsp;</a>
                        </td>
                        <td style="width: 500px">
                            원하는 답변이 없을 경우 <br> 운영자에게 1:1 문의를 남겨주세요 <br><br>
                            <a href="" class="btn btn-secondary">&nbsp;GO&nbsp;</a>
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
	
</body>
</html>