<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>
	$(function(){
		$("#updateForm option").each(funtion(){
			if($(this).text() == "<%=c.getConType()%>"){
				$(this).attr("selected",true);
			}
		});
	});
</script>
</body>
</html>