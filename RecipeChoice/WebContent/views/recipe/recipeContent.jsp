<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.recipe.model.vo.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	Recipe r = (Recipe)request.getAttribute("r");
	String[] tagList = (String[])r.getRcpTag().split(",");
	
	ArrayList<IngredientList> ing = (ArrayList<IngredientList>)request.getAttribute("ingredient");
	ArrayList<Cook> cook = (ArrayList<Cook>)request.getAttribute("cook"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/recipeContent.css">
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<title>Insert title here</title>

</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div class="contents">
		<div class="content">
			<div class="w3-container w3-border-bottom w3-border-grey">
				<p id="pageTitle">
					<!-- 레시피제목자져오기 -->
					<b><big><%= r.getRcpTitle() %></big></b>
				</p>
			</div>
			
			<!-- 화면 왼쪽에 보여지는 컨텐츠 -->
			<table class="tb_Content">
				<tr>
					<td class="leftContent" align="center">
					<img src="<%=contextPath %>/resources/recipe_upfiles/<%=r.getRcpPic() %>" id="titleImg" />
					<br />
						<div class="userImg">
							<img src="resources/image/mypage/cat.jpg" id="userPic" style="width: 90px" /> 
							<br /><br /> 
							<span><%=r.getMemName() %></span>
							<p id="recipeTitle"><%=r.getRcpTitle() %></p>
							<div id="recipeSubTitle">
								<span><%=r.getRcpContent() %></span>
							</div>
							<br />
							<br />
							<div align="center">
								<span style="color: rgb(39, 174, 96); font-size: 14px; font-weight: bold;">
									스크랩수 <%=r.getScrapCount() %>
								</span>
							</div>
							
							<!-- 칸 나누는 보더 -->
							<div class="w3-container w3-border-bottom w3-border-grey"></div>
							<div>
								<table id="recipeScrap_Report">
									<tr>
										<td><%=r.getRcpTime() %>분</td>
										<td><button>스크랩</button></td>
										<td><button>신고하기</button></td>
									</tr>
								</table>
							</div>
						</div>
					</td>
					
					<!-- 오른쪽 컨텐츠 -->
					<td class="rightContent">
						<p style="font-size: 20px">
							<b>재료 리스트</b>
						</p>
						<div id="recipeList">
							<ul>
							<%for(IngredientList i : ing){ %>
								<li><%=i.getIngDish() %> <%=i.getIngMetering() %></li>
							<%} %>
							</ul>
						</div> <br />
					<br />
						<p style="font-size: 20px">
							<b>태그 정보</b>
						</p>
						<div class="tagList">
							<table>
								<tr>
									<td>
									<%for(int i=0; i<tagList.length; i++){ %>
										<li><%=tagList[i] %></li>
									<%} %>
									</td>
								</tr>
							</table>
						</div> <br />
					<br />
						<p style="font-size: 20px">
							<b>관련 꿀팁</b>
						</p>
						<div class="tipRelation">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#"><img src=" " width="125px" height="90px" /></a></li>
               			 	<li><a href="#"><img src=" " width="125px" height="90px" /></a></li>
							<li><a href="#">&raquo;</a></li>
						</div>
					</td>
				</tr>
				
				<!-- 중간 컨테츠 조리 순서 -->
				<tr class="bottomContent">
					<td colspan="2">
						<!-- 칸 나누기 보더 -->
						<div class="w3-container w3-border-bottom w3-border-grey"></div> 
						<p id="pagebottomTitle">
							<b><big>조리 순서 </big></b>
						</p> <br />
					</td>
				</tr>
				
				<!-- 반복문 돌릴 예정 -->
				<%for(Cook c : cook){ %>
				<tr class="cookOrder">
					<td>
						<span class="dot" align="center"><%=c.getCookOrder() %></span>&nbsp;&nbsp; 
						<img src="<%=contextPath %>/resources/recipe_upfiles/<%=c.getCookPic() %>" id="detailImg" width="200" height="150" />
					</td>
					<td>
						<p class="cookContent">
							<%=c.getCookContent() %>
						</p>
					</td>
				</tr>
				<%} %>
			
				
				<!-- 관련 레시피 썸네일 -->
				<tr class="bottomContent">
					<td colspan="2">
					<br><br><br>
						<div class="w3-container w3-border-bottom w3-border-grey"></div>
						<p id="pagebottomTitle">
							<b><big>관련 레시피 </big></b>
						</p> <br />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="bottom_tipRelation">
			                <li><a href="#">&laquo;</a></li>
			                <li><a href="#"><img src=" " width="180px" height="150px" /></a></li>
			                <li><a href="#"><img src=" " width="180px" height="150px" /></a></li>
			                <li><a href="#"><img src=" " width="180px" height="150px" /></a></li>
			                <li><a href="#"><img src=" " width="180px" height="150px" /></a></li>
			                <li><a href="#">&raquo;</a></li>
              			</div> 
					</td>
				</tr>

				<tr class="bottomContent">
					<td colspan="2"><br>
					<br>
					<br>
						<div class="w3-container w3-border-bottom w3-border-grey"></div> <br />
					</td>
				</tr>

			</table>
			<!--댓글-->
			<div class="replyArea" align="center">

				<textarea class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>

				<input type="button" class="btn btn-success replyBtn" value="등록">

				<br>
				<br>

				<!-- 숫자에 실제로 가져온 댓글의 숫자값으로 대체 -->
				<h4 class="replytitle" align="left">댓글 15</h4>

				<table class="replylistArea" style="margin: 0px auto; width: 800px;">
					<tr>
						<td colspan="2">
							<div data-image-content="false"
								style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
						</td>
					</tr>
					<tr>
						<td width="10%" align="center"><img
							src="<%=request.getContextPath()%>/resources/image/board/defaultprofile.png"
							class="profileImg" width="50px" height="50px"></td>
						<td width="90%" style="padding-right: 30px;">
							<div align="left" style="color: gray;">
								<b style="color: rgb(9, 175, 79); margin-right: 20px;"
									id="writerNickName">왕십리대마왕</b>
								<!-- 뿌릴때 서브스트링으로 4자 이후는 ***로 표시 -->
								<input type="hidden" id="writerId" value="Wang***">
								20200827 08:31
								<!-- 작성자일경우에만 표시 -->
								| <a onclick="callChangeForm(this)"
									style="color: gray; cursor: pointer;">수정</a> | <a
									href="#replyDeleteModal" data-toggle="modal"
									data-target="#replyDeleteModal" data-no="3"
									onclick="modalGetEl(this)" style="color: gray">삭제</a>
								<!-- 항상표시 -->
								| <a href="#reportModal" data-toggle="modal"
									data-target="#reportModal" data-no="3"
									onclick="reportContent(this)" style="color: gray">신고</a>
							</div>
							<div id="replyConent">ㅇㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
								ㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴㄴ
								ㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇ ㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇㄹ</div>
						</td>
					</tr>
					<!-- 여기서 부터는 테이블 스타일 테스트용 더미 지울예정 -->
					<tr>
						<td colspan="2">
							<div data-image-content="false"
								style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
						</td>
					</tr>
					<tr>
						<td width="10%" align="center"><img
							src="<%=request.getContextPath()%>/resources/image/board/defaultprofile.png"
							class="profileImg" width="50px" height="50px"></td>
						<td width="90%" style="padding-right: 30px;">
							<div align="left" style="color: gray;">
								<b style="color: rgb(9, 175, 79); margin-right: 20px;"
									id="writerNickName">왕십리대마왕</b>
								<!-- 뿌릴때 서브스트링으로 4자 이후는 ***로 표시 -->
								<input type="hidden" id="writerId" value="Wang***">
								20200827 08:31
								<!-- 작성자일경우에만 표시 -->
								| <a style="color: gray">수정</a> | <a style="color: gray">삭제</a>
								<!-- 항상표시 -->
								| <a style="color: gray">신고</a>
							</div>
							<div>예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이,
								봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다. 장식하는 듣기만 심장의 때까지
								없으면,</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div data-image-content="false"
								style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
						</td>
					</tr>
					<tr>
						<td width="10%" align="center"><img
							src="<%=request.getContextPath()%>/resources/image/board/defaultprofile.png"
							class="profileImg" width="50px" height="50px"></td>
						<td width="90%" style="padding-right: 30px;">
							<div align="left" style="color: gray;">
								<b style="color: rgb(9, 175, 79); margin-right: 20px;">닉네임</b>
								20200827 08:31
								<!-- 작성자일경우에만 표시 -->
								| <a style="color: gray">수정</a> | <a style="color: gray">삭제</a>
								<!-- 항상표시 -->
								| <a style="color: gray">신고</a>
							</div>
							<div>예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이,
								봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다. 장식하는 듣기만 심장의 때까지
								없으면,</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div data-image-content="false"
								style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
						</td>
					</tr>
				</table>
				 <br><br>
				 <%if(loginUser != null && loginUser.getUserNo()== r.getUserNo()) { %>
		          <div align="right">
		            <button type="submit" id="editRecipe">수정하기</button>
          		</div>
          		<%} %>
          		<br><br>
			</div>
		</div>
	</div>
	</div>


	<%@include file="../common/footer.jsp"%>
	<script src="resources/js/bootstrap.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>