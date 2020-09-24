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
	.inq {border-collapse: collapse;}
	.inq{
    box-sizing: border-box;
     width: 95%;
    height: 40px;
    margin: 5px;
    }
    .inq td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .inq tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    .inq td{
		line-height: 30px;
        padding-left: 0px;
    }
    
    #img{
        cursor:pointer;
    }
     
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
    tbody>tr{cursor: pointer;}
    tbody>tr:hover{background: rgb(243, 243, 243)}

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
                <div id="menu_1">고객센터</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/noticeList.no'">&nbsp;&nbsp;&nbsp;공지사항</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1 문의</div>
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
                <h1>1:1 문의 조회
                    &nbsp;<img src="resources/image/admin/inquiry.jpg" >
				</h1>
            
                <hr>
                <table class="inq">
                <thead>
                    <th width="80">NO.</th>
                    <th>   </th>
                    <th width="400">content</th>
                    <th width=300">Name</th>
                    <th width="200">Date</th>
                    <th width="200">  </th>
                </thead>
                <tbody>
                   <!--자기꺼만 삭제할 수 있도록 보여지기 삭제아이콘-->
                    <tr>
                        <td>1002</td>
                        <td>🔒</td>
                        <td>re:기타 문의</td>
                        <td>홍길동</td>
                        <td>2020-08-26</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>1001</td>
                        <td>🔒</td>
                        <td>기타 문의</td>
                        <td>관리자</td>
                        <td>2020-08-24</td>
                        <td><img id="img"onclick="deleteConfirm();"src="resources/image/admin/recyclebin.jpg" align="center">
                            <img id="img"onclick="modifyConfirm();"src="resources/image/navbar/recyclebin.jpg" align="center"></td>                      
                        </tr>
                    
                 </tbody>
                </table>
                <script>
                    function deleteConfirm(){
                       if(confirm("삭제하시겠습니까?")){
                           location.href="";
                       }else{
                           return false;
                        } 
                       }
             
               </script>
                 <!--1:1문의 답변조회 페이지용-->
                 <script>
                    $(function(){
                        $(".inq>tbody>tr").click(function(){
                       });
                    });
                    
                </script>
               
           
                <br>
                <div id="content_3" align="right" style="width:710px;">
                <button>글작성</button>
                    <br><br>
               
        </div>
        <div id="footer">
            <div class="pagination">
                <a href="#">&laquo;</a> 
                <a href="#">1</a> 
                <a href="#">2</a> 
                <a href="#">3</a> 
                <a href="#">4</a> 
                <a href="#">&raquo;</a>
            </div>
        </div>
    </div>
    
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>