<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.recipe.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
	Count ct = (Count)request.getAttribute("ct");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/recipeMainView.css">
<link rel="stylesheet" href="resources/css/footer.css">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
	<div class="contents">
		<div class="content">
			<div class="selectRecipe">
				<form action="<%=contextPath%>/searchBar.rp">
					<table class="tb_list">
						<tr>
							<th width="90">종류별</th>
							<td>
								<ul>
									<li><input type="checkbox" id="rice" name="dishType"
										value="밥종류"> <label for="rice" id="recipe"><p>밥종류</p></label>
									</li>
									<li><input type="checkbox" id="soup" name="dishType"
										value="찌게"> <label for="soup" id="recipe"><p>찌게</p></label>
									</li>
									<li><input type="checkbox" id="stew" name="dishType"
										value="탕"> <label for="stew" id="recipe"><p>탕</p></label>
									</li>
									<li><input type="checkbox" id="steamed" name="dishType"
										value="찜"> <label for="steamed" id="recipe"><p>찜</p></label>
									</li>
									<li><input type="checkbox" id="stir" name="dishType"
										value="볶음"> <label for="stir" id="recipe"><p>볶음</p></label>
									</li>
									<li><input type="checkbox" id="side" name="dishType"
										value="밑반찬"> <label for="side" id="recipe"><p>밑반찬</p></label>
									</li>
								</ul>
							</td>
							<td rowspan="2">
								<div align="right">
									<button type="reset" id="resetbt">초기화</button>
								</div>
							</td>
						</tr>
						<tr>
							<th rowspan="2">재료별</th>
					<td> 
						<ul>
							<li>
								<input type="checkbox" id="beef" name="tag" value="소고기">
									<label for="beef" class="recipe">소고기</label>
							</li>
							<li>
								<input type="checkbox" id="pork" name="tag" value="돼지고기">
								<label for="pork" class="recipe">돼지고기</label>
							</li>
							<li>
								<input type="checkbox" id="chicken" name="tag" value="닭고기">
								<label for="chicken" class="recipe">닭고기</label>
							</li>
							<li>
								<input type="checkbox" id="duck" name="tag" value="오리">
								<label for="duck" class="recipe">오리</label>
							</li>
							<li>
								<input type="checkbox" id="seafood" name="tag" value="해물류">
								<label for="seafood" class="recipe">해물류</label>
							</li>
							<li>
								<input type="checkbox" id="driedFish" name="tag" value="건어물류">
								<label for="driedFish" class="recipe">건어물류</label>
							</li>
							<li>
								<input type="checkbox" id="nuts" name="tag" value="콩/견과류">
								<label for="nuts" class="recipe">콩/견과류</label>
							</li>
							<li>
								<input type="checkbox" id="dairy" name="tag" value="달걀/유제품">
								<label for="dairy" class="recipe">달걀/유제품</label>
							</li>
						</ul>
					</td>
				</tr>
						<tr>
						
							<td>
								<ul>
									<li><input type="checkbox" id="vegi" name="tag"
										value="체소류"> <label for="vegi" class="recipe">체소류</label>
									</li>
									<li><input type="checkbox" id="fruit" name="tag"
										value="과일류"> <label for="fruit" class="recipe">과일류</label>
									</li>
									<li><input type="checkbox" id="mushroom" name="tag"
										value="버섯류"> <label for="mushroom" class="recipe">버섯류</label>
									</li>
									<li><input type="checkbox" id="grain" name="tag"
										value="곡류"> <label for="grain" class="recipe">곡류</label>
									</li>
									<li><input type="checkbox" id="flour" name="tag"
										value="밀가루"> <label for="flour" class="recipe">밀가루</label>
									</li>
									<li><input type="checkbox" id="processedFood"
										name="tag" value="가공식품"> <label
										for="processedFood" class="recipe">가공식품</label></li>
								</ul>
							</td>
							<td >
								<div align="right">
									<button type="submit" id="searchbt">검색</button>
								</div>
							</td>
						</tr>

						<tr>
							<th>소요시간별</th>
							<td>
								<ul>
									<li><input type="range" min="10" max="60" step="10"
										name="time" value="분"></li>
								</ul>
							</td>
						</tr>
					</table>
				</form>
				
				<!--칸 나누기-->
				<div class="w3-container w3-border-bottom w3-border-teamColor"></div>
			</div>

			<!--테마닫고/오픈하기-->
				<button class="theme_tag tag_btn">레시피테마</button>
			<br>
			<script>
				$(function() {
					$(".tag_btn").click(function() {
						var $p = $(this).prev();

						if ($p.css("display") == "none") {
							$(this).prevAll().slideUp();
							$p.slideDown();
						} else {
							$p.slideUp();
						}
					});
				});
			</script>
			
			<div class="listArea">
			<!--검색후 보여질 결과(if문처리)-->
			<div align="center">
				<p>
					<b style="color: rgb(39, 174, 96)"><big>총 <%=ct.getTotalCount() %>개</big></b>
					의 레시피가 검색되었습니다.
				</p>
			</div>
			
			<!-- 썸네일 정렬 -->
			<div class="view_type">
				<ul>
					<li><a href="<%=contextPath %>/pageList.rp?currentPage=1">최신순</a></li>
					<li><a onclick="" href="">인기순</a></li>
					<li><a onclick="" href="">조회순</a></li>
				</ul>
			</div>
			<br><br>
			<!--썸네일-->
				<!-- 반복문 -->
				<%for(Recipe r : list){ %>
				<div class="thumbnail" align="center" style="width:200px;">
					<input type="hidden" name="rcpNo" value="<%=r.getRcpNo()%>">
						<img src="<%=contextPath %>/resources/recipe_upfiles/<%=r.getRcpPic() %>" width="200px" height="150px" />
					<br />
					<div class="w3-container w3-border-bottom w3-border-teamColor">
						"<%=r.getRcpContent() %>" <br /> <br>
						<small><p style="font-style:italic"><%=r.getRcpTitle() %></p></small>
					</div>
					<p align="left"><%=r.getMemName() %></p>
				</div>
				<%} %>
				<script>
					$(function(){
						$(".thumbnail").click(function(){
							location.href="<%=contextPath%>/detail.rp?rcpNo="+$(this).children().eq(0).val();
						});
					});
					
				</script>
				<div class="pagination">
				<%if(currentPage != 1){ %>
					<a href="<%=contextPath %>/pageList.rp?currentPage=<%=currentPage-1%>">&laquo;</a> 
				<%} %>
				
				<%for(int p=startPage; p<=endPage; p++) {%>
					<%if(p != currentPage){ %>
						<a href="<%=contextPath%>/pageList.rp?currentPage=<%=p%>"><%=p %></a> 
					<%}else { %>
						<a class="pagination"><%=p %></a>
					<%} %>
				<%} %>
				
				<%if(currentPage != maxPage) {%>
					<a href="<%=contextPath%>/pageList.rp?currentPage=<%=currentPage+1%>">&raquo;</a>
				<%} %>
				</div>
			</div>


		</div>
	</div>



	<!--include footer-->
	<%@include file="../common/footer.jsp" %>
	
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>