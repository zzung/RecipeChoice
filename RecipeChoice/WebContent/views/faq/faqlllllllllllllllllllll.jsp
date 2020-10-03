<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function showId(id)
{
    obj=document.getElementById(id);
    if(obj.style.display=="none")
    obj.style.display="inline";
    else
    obj.style.display="none";
}
</script>
<script >
 $(document).ready(function(){
         $("#b").hide();
     $("#a").click(function(){
         $("#b").show(slow);
     });
 });
</script>
</head>
<body>
    <p id="a" >열어</p>
    <p id="b">show</button>
    <!--
    <div id="content_bt">
        <p onclick="showId('content');">이글을 클릭</p>
    </div>
    <div id="content" style="display:none;">
        내용
    </div>
    <div class="t1">    
        <div id="content_bt">
             <p  onclick="showId('cont');">회원 탈퇴는 어디서 하나요?</p>
            <img id="img"onclick="deleteConfirm();"src="resources/image/navbar/pencil.jpg">
            <img id="img"onclick="modifyConfirm();"src="resources/image/navbar/pencil.jpg">                                   
            <hr style="width:93%;">
        </div>
        <div id="cont" style="display:none;">
            열라숑다리
        </div>
     </div>
-->




    <!--
    <input type="button" value="내용 접기" onclick="if(document.querySelector('input').value==='내용 접기'){
        document.querySelector('#data').style.display = 'none';
        document.querySelector('input').value = '내용 펼치기';
    }
    else{
        document.getElementById('data').style.display = 'block';
        document.querySelector('input').value = '내용 접기';
    }">
    <p id="data">내용 !!</p> 
-->
</body>
</html>