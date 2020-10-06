<%@page import="com.kh.user.recipe.model.vo.Recipe"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	ArrayList<Recipe> todayRecommendedRecipe = new ArrayList<Recipe>();
	if(request.getAttribute("todayRecommendedRecipe") instanceof ArrayList) {
		ArrayList<?> tmpList = (ArrayList<?>)request.getAttribute("todayRecommendedRecipe");
		for(Object obj : tmpList) {
			if(obj instanceof Recipe) {
				todayRecommendedRecipe.add((Recipe)obj);
			}
		}
	}
	
	ArrayList<Recipe> bestRecipes = new ArrayList<Recipe>();
	if(request.getAttribute("bestRecipes") instanceof ArrayList) {
		ArrayList<?> tmpList = (ArrayList<?>)request.getAttribute("bestRecipes");
		for(Object obj : tmpList) {
			if(obj instanceof Recipe) {
				bestRecipes.add((Recipe)obj);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/w3.css">
<title>menubar</title>
<style>
    .contents{
     	margin-top: 160px;
        height:1300px;
    }

    #content{
        width:1100px;
        height: 100%; 
        margin:auto; 
    }

    .contents>#content>div {
        width: 100%;
    }

    .content_1 {
        height: 30%;
    }

    .content_2 {
        height: 30%;
    }

    .recommendedRecipe {
        float: left;
        margin-left: 80px;
    }
    
    .recommendedRecipe:hover {
    	cursor: pointer;
    }

    .recommendedRecipeTitleBar {
        height: 38px;
        width: 150px;
        position: absolute;
        top: 789px;
        background-color: rgba(0, 0, 0, 0.4);
        color: white;
    }
    
    .recommendedRecipeTitle {
    	margin: 0px 13px;
    	padding-top: 7px;
    	overflow: hidden;
		display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }

    .content_3 {
        height: 40%;
    }
</style>
</head>

	<%@include file="menubar.jsp" %>

    <div class="contents">
		<div id="content">
			<div class="content_1">
                <h3>오늘의 추천 레시피</h3>
                <div align="center">
                	<% if(todayRecommendedRecipe.size() < 2) { %>
                	<div><h2>조회된 데이터가 없습니다</h2></div>
                	<% } else { %>
                	<a href="<%= contextPath %>/detail.rp?rcpNo=<%= todayRecommendedRecipe.get(0).getRcpNo() %>">
	                    <img src="resources/recipe_upfiles/<%= todayRecommendedRecipe.get(0).getRcpPic() %>" width="400" height="300">
                	</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   	<a href="<%= contextPath %>/detail.rp?rcpNo=<%= todayRecommendedRecipe.get(1).getRcpNo() %>">
                    	<img src="resources/recipe_upfiles/<%= todayRecommendedRecipe.get(1).getRcpPic() %>" width="400" height="300">
                    </a>
                	<% } %>
                </div>
			</div>
			<div class="content_2">
                <h3>지금 많이 검색하는 메뉴</h3>
                <div>
                    <br><br><br><br>
                    <% if(bestRecipes.size() < 4) { %>
                	<div><h2>조회된 데이터가 없습니다</h2></div>
                	<% } else { %>
                    <div class="recommendedRecipe" style="margin-left: 130px;" onclick="location.href='<%= contextPath %>/detail.rp?rcpNo=<%= bestRecipes.get(0).getRcpNo() %>'">
    	                <img src="resources/recipe_upfiles/<%= bestRecipes.get(0).getRcpPic() %>" width="150" height="150">
                        <div class="recommendedRecipeTitleBar"><p align="center" class="recommendedRecipeTitle"><%= bestRecipes.get(0).getRcpTitle() %></p></div>
                    </div>
                    <div class="recommendedRecipe" onclick="location.href='<%= contextPath %>/detail.rp?rcpNo=<%= bestRecipes.get(1).getRcpNo() %>'">
                        <img src="resources/recipe_upfiles/<%= bestRecipes.get(1).getRcpPic() %>" width="150" height="150">
                        <div class="recommendedRecipeTitleBar"><p align="center" class="recommendedRecipeTitle"><%= bestRecipes.get(1).getRcpTitle() %></p></div>
                    </div>
                    <div class="recommendedRecipe" onclick="location.href='<%= contextPath %>/detail.rp?rcpNo=<%= bestRecipes.get(2).getRcpNo() %>'">
                        <img src="resources/recipe_upfiles/<%= bestRecipes.get(2).getRcpPic() %>" width="150" height="150">
                        <div class="recommendedRecipeTitleBar"><p align="center" class="recommendedRecipeTitle"><%= bestRecipes.get(2).getRcpTitle() %></p></div>
                    </div>
                    <div class="recommendedRecipe" onclick="location.href='<%= contextPath %>/detail.rp?rcpNo=<%= bestRecipes.get(3).getRcpNo() %>'">
                        <img src="resources/recipe_upfiles/<%= bestRecipes.get(3).getRcpPic() %>" width="150" height="150">
                        <div class="recommendedRecipeTitleBar"><p align="center" class="recommendedRecipeTitle"><%= bestRecipes.get(3).getRcpTitle() %></p></div>
                    </div>
                    <% } %>
                </div>
			</div>
			<div class="content_3">
                <h3>계절메뉴</h3>
                <div align="center">
                    <img src="resources/recipe_upfiles/2020100312222886578.jpg" width="500" height="400">
                </div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<div class="bottom">
        <div id="footer_1">
            <a href="">회사소개</a> <a href="">개인정보취급방침</a> <a href="">고객센터</a>
        </div>
        
        <div id="footer_2">
            <img src="resources/image/logo/churro.png" width="50px"
                height="50px">
        </div>
        
        <div id="footer_3">
            <span>
				<span>상호 : 주식회사 츄레 (서울시 강남구 테헤란로 14길 6 남도빌딩 3층)</span><br> 
				<span>대표자 : 츄레 개인정보관리책임자: 츄레 </span><br>
				<span>사업자번호 : 222-22-2222-222 전화 : 02-222-2222  메일: recipechoice5@gmail.com</span>
            </span>
        </div>
    </div>

	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>