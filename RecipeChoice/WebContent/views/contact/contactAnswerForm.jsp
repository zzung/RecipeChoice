<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
    
    .answer {border-collapse: collapse;}
	.answer{
    box-sizing: border-box;
    width: 90%;
    height: 40px;
    }
    .answer td:first-child{
    font-weight: bolder;
     text-align: center;
    }
    .answer tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
     }
    .answer td{
		line-height: 30px;
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
                <h1>1:1 문의 조회
                    &nbsp;<img src="resources/image/admin/inquiry.jpg" align="center">
				</h1>
                <hr>
                <form action="" method=""> 
                    <table class="answer">
                       <tr>
                           <th ><h2>제목</h2></th>
                           <td colspan="4" ><input type="text" name="title" value="re:" style="width:80%;"required style="height:22px;"></td>
                       </tr>
                       <tr>
                           <td><h2>내용</h2></td>
                           <td>
                              <textarea cols="70" rows="13" style="resize:none; margin-top:10px; margin-bottom:10px;" required></textarea>
                           </td>
                       </tr>
                 </table>  
                 <br>    
               <br>
               <div align="center">
                   <button type="submit" class="btn" onclick="answerConfirm();"> 답변하기</button>
                   &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                   <button type="button" onclick="history.back();">뒤로가기</button>
               </div>
           </div>  
       </form>
       <script>
        function answerConfirm(){
            if(confirm("등록하시겠습니까?")){
                location.href='./inquiryEnroll.no';
            }else{
                return false;
             } 
            }
       </script>
           </div>
        <div id="footer"></div>
    </div>
    
    
     <!-- footer 추가-->
     <%@include file="../common/footer.jsp" %>
</body>
</html>
</body>
</html>