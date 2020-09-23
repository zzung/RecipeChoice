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
	#header{height:20%;} 
	#content{height:70%}
	#footer{height:10%;}
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
    .tb1{border-collapse: collapse; }
    tr{
        box-sizing: border-box;
        border-radius: 10px;
        border: 1px solid lightgray;
        float: left;
        width: 95%;
        height: 40px;
        margin: 5px;
    }
    .tb1 td:first-child{
        font-size: 12px;
        font-weight: bolder;
        line-height: 40px;
        float: left;
        margin-left: 10px;
        padding-right: 60px;
        padding-left: 10px;
    }
    .tb1 td:nth-child(2){
        line-height: 40px;
    } 
    .tb1 td:nth-child(3){
        padding-left: 270px;
        padding-right: 30px;
    }
    .tb1 a{color: black; margin-left: 10px; font-size:13px;}
    
    tr:hover{background: #f3f3f3; cursor: pointer;}

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
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<body>
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
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;공지사항</div>
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
                
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;츄레 공지사항</h4> <img src="" style="width: 50px; height: 50px;">
                <hr>
                <table class="tb1">
                    <tr>
                        <td>112</td>
                        <td> 공지사항 제목1 </td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                    <tr>
                        <td>111</td>
                        <td>공지사항 제목2 </td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                    <tr>
                        <td>110</td>
                        <td> 공지사항 제목3</td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                    <tr>
                        <td>109</td>
                        <td> 공지사항 제목4</td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                    <tr>
                        <td>108</td>
                        <td> 공지사항 제목5</td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                    <tr>
                        <td>99</td>
                        <td> 공지사항 제목5</td>
                        <td> 2020-09-01</td>
                        <td><a href="#" onclick="noticeUpdate();">수정</a></td>
                        <td><a href="#" onclick="noticeDelete();">삭제</a></td>
                    </tr>
                </table>
                
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
    <script>
            function noticeUpdate(){
                var answer = confirm("수정하시겠습니까 ?");
                if(answer){
                    // 수정페이지로 이동
                     <%-- locaion.href="<%=contextPath%>/noticeUpdate.no?bno="; --%>
                	alert("수정 완료 !");
                }else{
                    return;
                }
            };

            function noticeDelete(){
                var answer = confirm("삭제하시겠습니까 ?");
                if(answer){
                    // 삭제
                    alert("삭제 완료 !");
                }else{
                    return;
                }
            };

    </script>
</body>
</html>