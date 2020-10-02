<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
  <style>
  	.wrap{
  	
  	width:1000px;
  	height:1000px;
  	padding: 0px 200px 30px 500px;
  	
  	}
  	
    .enroll{
    
       width:600px;
       height:700px;
       margin: auto;
       margin-top: 50px;
        
    }
    .clickLink a, a:hover {
    color: black;
    text-decoration: none;
    vertical-align: middle;
    font-size: 15px;

    }
    .block{
            color:white;
            border: solid 1px;
            background-color:rgb(39, 174, 96) ;
            height:100px;
            box-sizing:border-box;
            float:left;
            margin-top: 20px;
            margin-bottom: 40px;
            text-align: center;
            padding-top: 40px;
    }
    .area1{
        width:33.3%;
        background-color: rgb(60, 223, 128);
    }
    .area2{width:33.3%}
    .area3{width:33.3%}
    
    .content1, .content2{
     text-align: center;
     font-size: 14px;
    }
    
    textarea{
        background-color: rgb(247, 24);
        border-radius: 5px;
        padding: 10px;
    }
  
    .agree{
       padding: 10px 40px 0 0;
       font-weight: 550;
       font-size: 14px;
    }
    
    #agree_btn{
        margin: 20px 200px 20px 250px;
        border-radius: 20px;
        font-size: 14px;
        padding: 8px 17px 8px 17px;
       
	 }
      .clickLink{
        width:200px;
        margin: 200px 170px 10px 650px;
     }
    </style> 
</head>
<body>
    <!-- 메뉴바 추가 -->
<%@include file="../common/menubar.jsp" %>  

    <div class="wrap">
		
	    <div class="clickLink">
	
	        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
	            <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
	        </svg>
	
	        <a href="">츄레</a>
	        &lt;
	        <a href="">회원가입</a>
             &lt;
       	    <a href="">개인정보수정</a>
	    </div>
     
        <br><br>
		<div class="enroll">
	        <div class="title" align="center">
	            <h2><b>츄레 회원가입</b></h2>
	        </div>
	
	        <div class="enrollbar">
	            <div class="block area1">1.약관동의</div>
	            <div class="block area2">2.정보입력</div>
	            <div class="block area3">3.가입완료</div>
	        </div>
	        
	        <div class="content1">
	            <textarea resize:none; style="width: 560px; height:200px;">츄레 이용약관은 다음과 같은 내용을 담고 있습니다. (2019년 3월 7일 시행)
	제1조(목적)
	이 약관은 전기통신사업법령 및 정보통신망이용촉진, 전자상거래 등에 관한 법령에 의하여 (주)이지에이치엘디(이하 "회사"라 합니다)가 제공하는 만개의레시피의 서비스(이하 “서비스"라 한다) 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
	 제2조(약관의 효력 및 변경)이 약관은 전기통신사업법령 및 정보통신망이용촉진, 전자상거래 등에 관한 법령에 의하여 (주)이지에이치엘디(이하 "회사"라 합니다)가 제공하는 만개의레시피의 서비스(이하 “서비스"라 한다) 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
	            </textarea>
	        </div>
	        <p class="agree" align="right"><input type="checkbox" id="contractCheck" value="1" > 동의합니다</p>
	        <div class="content2" >
	            <textarea resize:none; style="width: 560px; height:200px;">츄레 이용약관은 다음과 같은 내용을 담고 있습니다. (2019년 3월 7일 시행)
	제1조(목적)
	이 약관은 전기통신사업법령 및 정보통신망이용촉진, 전자상거래 등에 관한 법령에 의하여 (주)이지에이치엘디(이하 "회사"라 합니다)가 제공하는 만개의레시피의 서비스(이하 “서비스"라 한다) 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
	 제2조(약관의 효력 및 변경)이 약관은 전기통신사업법령 및 정보통신망이용촉진, 전자상거래 등에 관한 법령에 의하여 (주)이지에이치엘디(이하 "회사"라 합니다)가 제공하는 만개의레시피의 서비스(이하 “서비스"라 한다) 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
	            </textarea>
	        </div>
	        <p class="agree" align="right"><input type="checkbox" id="contractCheck2" value="2" > 동의합니다</p>
	    
	        <a href="<%=contextPath%>/enrollForm2.me" type="button" id="agree_btn" class="btn btn-success">다음</a>
    </div>
   <script>
 
		// 약관 동의 부분 
	   $("#agree_btn").click(function(){
	       if($("#contractCheck").is(':checked') && $("#contractCheck2").is(':checked')){
	           location.href="<%=contextPath%>/enrollForm2.me";
	       }else{
	           alert("약관을 읽어보시고 동의하셔야 합니다!");
	           return false;
	       }
	   
	   });
	

   
   
   </script>
</body>
</html>