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
    .t1{
		width:45%;
		height:auto;;
	    margin-top: 8px;
	    line-height: 30px;
		border:1px solid lightslategrey;
		border-radius: 5px;
	}
	p#a1{
        cursor:pointer;
        font-weight:bold;
    }
    p#a2{
        cursor:pointer;
        font-weight:bold;
    }
    .t1>#img{
        float:right;
    }
    .t2>#img{
    float:right;
    }
    #img{
    cursor:pointer;
    }
    .tt1{
        width:800px;
        height:400px;
        border:1px solid black;
        
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $('p#a1').click(function(){
            $('p#b1').toggle('slow');
        });
    });
     </script>
     <script>
        $(document).ready(function(){
            $('p#a2').click(function(){
                $('p#b2').toggle('slow');
            });
        });
         </script>
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
	            <br>
                <h1>자주 묻는 질문
                    &nbsp;<img src="resources/image/admin/faq.jpg">
                </h1>
                <h2>FAQ</h2>
                <hr>
				<br>
				<div class="tt1">
				<div class="t1">
                    <p id="a1">&nbsp;ID찾기와 비밀번호 찾기는 어디서 하나요?&nbsp; &nbsp;⌄</p>
                     <img id="img"onclick="deleteConfirm();"src="resources/image/navbar/pencil.jpg">
                     <img id="img"onclick="modifyConfirm();"src="resources/image/navbar/pencil.jpg">                                 
                    <hr style="width:93%;">
                    <p id="b1">&nbsp; 아이디와 비밀번호 찾기는 로그인 창 옆에</p>
				</div>
				<br>
				<div class="t1">
					<p id="a1">&nbsp;ID찾기와 비밀번호 찾기는 어디서 하나요?&nbsp; &nbsp;⌄</p>
                    <hr style="width:93%;">
                    <p id="b1"></p>
				</div>
				<br>
				<div class="t1">
					<p id="a1">&nbsp;ID찾기와 비밀번호 찾기는 어디서 하나요?&nbsp; &nbsp;⌄</p>
                    <hr style="width:93%;">
                    <p id="b1"></p>
                </div>
                <div class="t2" align="right">
					<p id="a2">&nbsp;ID찾기와 비밀번호 찾기는 어디서 하나요?&nbsp; &nbsp;⌄</p>
                    <hr style="width:93%;">
                    <p id="b2"></p>
                </div>
                <div class="t2" lign="right">
					<p id="a2">&nbsp;ID찾기와 비밀번호 찾기는 어디서 하나요?&nbsp; &nbsp;⌄</p>
                    <hr style="width:93%;">
                    <p id="b2"></p>
				</div>
            </div>
				<br><hr><br>
				<div align="center">
					<button type="submit" class="btn" onclick="answerConfirm();"> 답변하기</button>
				</div>
			</div>
				  <script>
                function deleteConfirm(){
                   if(confirm("삭제하시겠습니까?")){
                       location.href="";
                   }else{
                       return false;
                    } 
                   }
         
           </script>
           <script>
            function modifyConfirm(){
                 location.href="";
              
               }
               </script>
            <div id="content_3"></div>
            
        
        <div id="footer"></div>
    </div>
    <br><br><br>
    
     <!-- footer 추가-->
     <%@include file="../common/footer.jsp" %>
</body>
</html>