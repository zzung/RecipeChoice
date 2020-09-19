<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/w3.css">
<link rel="stylesheet" href="resources/css/recipeMainView.css">
<link rel="stylesheet" href="resources/css/footer.css">
<title>Insert title here</title>
</head>
<body>
<%@include file="../common/menubar.jsp" %>
	<div class="contents">
		<div id="content">
			<div class="selectRecipe">
				<form action="">
					<table class="tb_list">
						<tr>
							<th width="90">종류별</th>
							<td>
								<ul>
									<li><input type="checkbox" id="rice" name="recipe"
										value="rice"> <label for="rice" id="recipe"><p>밥종류</p></label>
									</li>
									<li><input type="checkbox" id="soup" name="recipe"
										value="soup"> <label for="soup" id="recipe"><p>찌게</p></label>
									</li>
									<li><input type="checkbox" id="stew" name="recipe"
										value="stew"> <label for="stew" id="recipe"><p>탕</p></label>
									</li>
									<li><input type="checkbox" id="steamed" name="recipe"
										value="steamed"> <label for="steamed" id="recipe"><p>찜</p></label>
									</li>
									<li><input type="checkbox" id="stir" name="recipe"
										value="stir"> <label for="stir" id="recipe"><p>볶음</p></label>
									</li>
									<li><input type="checkbox" id="side" name="recipe"
										value="side"> <label for="side" id="recipe"><p>밑반찬</p></label>
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
								<input type="checkbox" id="beef" name="recipe" value="beef">
									<label for="beef" class="recipe">소고기</label>
							</li>
							<li>
								<input type="checkbox" id="pork" name="recipe" value="pork">
								<label for="pork" class="recipe">돼지고기</label>
							</li>
							<li>
								<input type="checkbox" id="chicken" name="recipe" value="chicken">
								<label for="chicken" class="recipe">닭고기</label>
							</li>
							<li>
								<input type="checkbox" id="duck" name="recipe" value="duck">
								<label for="duck" class="recipe">오리</label>
							</li>
							<li>
								<input type="checkbox" id="seafood" name="recipe" value="seafood">
								<label for="seafood" class="recipe">해물류</label>
							</li>
							<li>
								<input type="checkbox" id="driedFish" name="recipe" value="driedFish">
								<label for="driedFish" class="recipe">건어물류</label>
							</li>
							<li>
								<input type="checkbox" id="nuts" name="recipe" value="nuts">
								<label for="nuts" class="recipe">콩/견과류</label>
							</li>
							<li>
								<input type="checkbox" id="dairy" name="recipe" value="dairy">
								<label for="dairy" class="recipe">달걀/유제품</label>
							</li>
						</ul>
					</td>
				</tr>
						<tr>
						
							<td>
								<ul>
									<li><input type="checkbox" id="vegi" name="recipe"
										value="vegi"> <label for="vegi" class="recipe">체소류</label>
									</li>
									<li><input type="checkbox" id="fruit" name="recipe"
										value="fruit"> <label for="fruit" class="recipe">과일류</label>
									</li>
									<li><input type="checkbox" id="mushroom" name="recipe"
										value="mushroom"> <label for="mushroom" class="recipe">버섯류</label>
									</li>
									<li><input type="checkbox" id="grain" name="recipe"
										value="grain"> <label for="grain" class="recipe">곡류</label>
									</li>
									<li><input type="checkbox" id="flour" name="recipe"
										value="flour"> <label for="flour" class="recipe">밀가루</label>
									</li>
									<li><input type="checkbox" id="processedFood"
										name="recipe" value="processedFood"> <label
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
										name="분"></li>
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
					<b style="color: rgb(39, 174, 96)"><big>총 126개</big></b>
					의 레시피가 검색되었습니다.
				</p>
			</div>
			
			<!-- 썸네일 정렬 -->
			<div class="view_type">
				<ul>
					<li><a onclick="" href="">최신순</a></li>
					<li><a onclick="" href="">인기순</a></li>
					<li><a onclick="" href="">조회순</a></li>
				</ul>
			</div>
			<br><br>
			<!--썸네일-->
				<div class="thumbnail" align="center">
					<a href=""><img src="resources/image/log/churro.png" width="200px" height="150px" /></a>
					<br />
					<div class="w3-container w3-border-bottom w3-border-teamColor">
						레시피 제목입니다. <br /> 
						<small>간단한설명</small>
					</div>
					<p align="left">사용자닉네임</p>
				</div>
				<div class="thumbnail" align="center">
					<a href=""><img src="resources/image/log/churro.png" width="200px" height="150px" /></a>
					<br />

					<div class="w3-container w3-border-bottom w3-border-teamColor">
						레시피 제목입니다. <br /> 
						<small>간단한설명</small>
					</div>
					<p align="left">사용자닉네임</p>

				</div>
				<div class="thumbnail" align="center">
					<a href=""><img src="resources/image/log/churro.png" width="200px" height="150px" /></a>
					<br />
					<div class="w3-container w3-border-bottom w3-border-teamColor">
						레시피 제목입니다. <br /> 
						<small>간단한설명</small>
					</div>
					<p align="left">사용자닉네임</p>
				</div>
				<div class="thumbnail" align="center">
					<a href=""><img src="resources/image/log/churro.png" width="200px" height="150px" /></a>
					<br />
					<div class="w3-container w3-border-bottom w3-border-teamColor">
						레시피 제목입니다. <br /> 
						<small>간단한설명</small>
					</div>
					<p align="left">사용자닉네임</p>
				</div>
				<div class="pagination" align="center">
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
	</div>



	<!--include footer-->
	<%@include file="../common/footer.jsp" %>
	
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>