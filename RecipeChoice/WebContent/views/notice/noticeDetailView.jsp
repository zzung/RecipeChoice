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
            /* border: 1px solid red */
        }
        .wrap{
            width:1000px;
            height:800px;
            margin: auto;
        }
        #header{height:20%;} 
        #content{height:70%}
        #footer{height:10%; }
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{ width:18%;  margin-right: 40px;}
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
        #noticeTitle{
            text-align: center; 
            line-height: 50%;
            padding: 10px;
            font-size: 15px;
            font-weight: bolder;
            }
        #noticeDate{
            float: right;
            padding: 5px;
            font-size: 12px;
            font-weight: bolder;
        }
        #noticeContent{
            margin-bottom: 10%;
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
                <div id="menu_1">고객센터</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.no'">&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;1:1 문의</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;개인정보취급방침</div>
                <div id="menu_3">
                    <br>&nbsp;&nbsp;고객센터
                    <br>&nbsp;&nbsp;1234-5678
                    <br>&nbsp;&nbsp;평일 10:00 ~ 18:00
                    <br>&nbsp;&nbsp;(토,일 공휴일은 휴무)
                </div>
            </div>
            <div id="content_2">
                
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;츄레 공지사항</h4><img src="resources/image/admin/noticeEmo.png" style="width: 40px; height: 40px;">
                <hr>
                
                <div id="noticeTitle">고객센터 운영 시간 안내</div>
                <hr>
                <div id="noticeDate">2020-08-10</div>
                <br><br><br>

                <span id="noticeContent">
                   	 안녕하세요 츄레입니다. <br><br>
                    2020-07-01 부로 고객센터 운영시간이 아래와 같이 변경되었으니 참고 부탁드립니다.<br><br>
                    <b>09:00 ~ 17:00 > 10:00 ~ 18:00 </b><br><br>
              	         기타문의사항은 아래로 부탁드립니다. <br><br><br><br><br>
                    tel. 02-1234-5678 
                </span>

                <br><br><br><br><br><br><br>
                <hr>
            </div>
            <div id="content_3">
                
            </div>
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
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
    
</body>
</html>