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
	
    .EnrollArea {border-collapse: collapse;}
	.EnrollArea{
    box-sizing: border-box;
    width: 90%;
    height: 40px;
    }
    .EnrollArea td:first-child{
    font-weight: bolder;
     text-align: center;
    }
    .EnrollArea tr {
    border-bottom: 1px solid gray;
    width: 100%;
    height: 30px;
    }
    .EnrollArea td{
		line-height: 30px;
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
                <h1>1:1 문의
                    &nbsp;<img src="resources/image/admin/inquiry.jpg" >
				 </h1>
                <h3>&nbsp;1:1 문의하기
                </h3>
                <hr>

                <form action="<%=contextPath %>/insert.co" method="post"> 
                <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
                 <table class="EnrollArea">
                    <tr>
                        <th ><h2>제목&nbsp;</h2></th>
                        <td colspan="4" ><input type="text" name="title" placeholder="내용을 입력하세요"required style="height:22px;"></td>
                    </tr>
                    <tr>
                        <th><h2>분야 &nbsp;</h2></th>
                        <td >
                            <select name="category"style="height:25px; width:110px;"  >
                                <option value="10" float="">레시피 문의</option>
                                <option value="20">신고 문의</option>
                                <option value="30">기타 문의</option>
                             </select>
                        </td>
                    </tr>
                    <tr>
                        <td><h2>내용&nbsp;</h2></td>
                        <td>
                           <textarea name="content" cols="70" rows="13" style="resize:none; margin-top:10px; margin-bottom:10px; "></textarea>
                        </td>
                    </tr>
            </table> 
            <br> 
            <hr>     
             <div align="right">
                <button type="submit" class="btn" onclick="EnrollConfirm();">문의등록</button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" onclick="history.back();">취소</button>
            </div>
        </div>  
    </form>
        <script>
        function EnrollConfirm(){
            if(confirm("등록하시겠습니까?")){
                location.href='./inquiryEnroll.no';
            }else{
                return false;
             } 
            }
     </script>
         </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
    </div>
    
    <!-- 푸터 추가-->
    <%@include file="../common/footer.jsp" %>
</body>
</html>