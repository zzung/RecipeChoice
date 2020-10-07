<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
     #top{
            background:rgb(238, 237, 237);
            margin-top:auto;
            height:50px;
            
        }
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
	.seas{border-collapse: collapse;}
	.seas{
    box-sizing: border-box;
    width: 95%;
    border: 1px solid lightgray;
    height: 40px;
    margin: 5px;
    }
    .seas td:first-child{
    font-weight: bolder;
    line-height: 20px;
    padding: 5px;
    text-align: center;
    }
    .seas tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    line-height: 3px;
    text-align: center;
    }
    thead{
        background-color:rgb(204, 202, 202)
    }
   
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
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
                <div id="menu_2" onclick="location.href='<%=contextPath%>/memberList.mn?page=1'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/blackList.mn?page=1'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/seasonList.ms'" style="color:rgb(39, 174, 96);">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%=contextPath%>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/faqList.mf'">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/contactList.mc'">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/reportList.mr?currentPage=1'">&nbsp;&nbsp;&nbsp;신고 관리</div>
               
            </div>
            <div id="content_2">
	
				<br><br>
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;시즌 레시피 </h3>
                <hr>
                 <br>

                <table class="seas">
                <thead>
                     <th>NO.</th>
                    <th width=300">카테고리</th>
                    <th width="900">제목</th>
                    <th width="300">등록일</th>
                  </thead>
                <tbody>
                    <tr>
                        <td>2</td>
                        <td>가을</td>
                        <td>라라라라라라라</td>
                        <td>2020-09-06</td>
                      </tr>
                      
                      <tr>
                        <td>1</td>
                        <td>여름</td>
                        <td>라라라라라라라</td>
                        <td>2020-09-01</td>
                      </tr>
                    
                </tbody>
    		 </table>
    		  <!--글 수정,삭제 페이지 이동-->
              <script>
                $(function(){
                    $(".seas>tbody>tr").click(function(){
                   });
                });
                
            </script>
            <br>
            <div id="content_3" align="right" style="width:710px;">
            <button>글작성</button>
                <br><br>
            </div>
        </div>
        <div id="footer"></div>
    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>