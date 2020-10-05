<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
            box-sizing: border-box;
        }
        .wrap{
            width:1100px;
            height:1000px;
            margin: auto;
        }
        #header{height:20%;} 
        #content{height:70%; margin-top: 30px;}
        #footer{height:10%; margin-bottom: 30px;}
        .nav{background:rgb(39, 174, 96);}
            .menu{
                display:table-cell;
                height:30px;
                width:150px;
            }
        #navigator{height:5%}
        #content>div{
            height:100%;
            float:left;
        }
        #content_1{ width:18%; margin-right: 40px;}
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
        .tb2 {border-collapse: collapse;}
        .tb2{
        box-sizing: border-box;
        width: 100%;
        height: 40px;
        margin: 30px;
        }
	</style>
</head>
<body>
	<!-- 메뉴바추가 -->
	<%@ include file="../common/menubarTemp.jsp" %>	

	<div class="wrap">
        <div id="header">
            <div id="header_1"></div>
            <div id="header_2"></div>
            <div id="header_3"></div>
        </div>
        <div class="nav">
            <div class="menu"></div>
        </div>
        <div id="content">
            <div id="content_1">
                <div id="menu_1">관리자</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/notice.mn'">&nbsp;&nbsp;&nbsp;공지사항관리</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/memberList.mn'">&nbsp;&nbsp;&nbsp;전체 회원 조회</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/blackList.mn'">&nbsp;&nbsp;&nbsp;블랙리스트 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;시즌 메뉴</div>
                <div id="menu_2" onclick="location.href='<%= contextPath %>/tip.mn'">&nbsp;&nbsp;&nbsp;꿀팁 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;FAQ</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;1:1문의 관리</div>
                <div id="menu_2" onclick="location.href=''">&nbsp;&nbsp;&nbsp;신고 관리</div>
            </div>
            <div id="content_2">
                
                <p style="font-weight: bolder; font-size: 18px;">재료에 대한 상식 글 작성하기</p>
                <hr> 
                
				<form action="insertKnowledge.mn" method="post" enctype="multipart/form-data">
					<input type="hidden" id="tipType" name="tipType" value="1">
					
					<table class="tb2">
                    	<tbody>
	                        <tr>
	                            <th width="100px" >제목</th>
	                            <td><input type="text" id="tipTitle" name="tipTitle" style=" width: 300px; height:30px; float: left; padding-top: 5px; margin-top: 10px; margin-bottom: 10px;">&nbsp;&nbsp;&nbsp;</td>
	                        </tr>
	                        <tr>
	                            <th>간단 설명</th>
	                            <td><input type="text" id="tipInfo" name="tipInfo" style=" width: 500px; height:30px; float: left; padding-top: 5px; margin-top: 10px; margin-bottom: 10px;">&nbsp;&nbsp;&nbsp;</td>
	                        </tr>
	                        <tr>
	                            <th>연관 태그</th>
	                            <td>
	                                <select id="tipTag1" name="tipTag1" style="margin-top: 10px; margin-bottom: 10px;">
	                                 	<option value="null">선택없음</option>
	                                    <option value="beef">소고기</option>
	                                    <option value="pork">돼지고기</option>
	                                    <option value="chicken">닭고기</option>
	                                    <option value="duck">오리고기</option>
	                                    <option value="seafood">해물류</option>
	                                    <option value="driedFish">건어물류</option>
	                                    <option value="nuts">콩/견과류</option>
	                                    <option value="egg">달걀/유제품</option>
	                                    <option value="vegetables">채소류</option>
	                                    <option value="fruits">과일류</option>
	                                    <option value="mushroom">버섯류</option>
	                                    <option value="grain">곡류</option>
	                                    <option value="flour">밀가루</option>
	                                    <option value="proceseedProduct">가공식품</option>
	                                </select>
	                                <select id="tipTag2" name="tipTag2" style="margin-top: 10px; margin-bottom: 10px;">
	                                	<option value="null">선택없음</option>
	                                    <option value="beef">소고기</option>
	                                    <option value="pork">돼지고기</option>
	                                    <option value="chicken">닭고기</option>
	                                    <option value="duck">오리고기</option>
	                                    <option value="seafood">해물류</option>
	                                    <option value="driedFish">건어물류</option>
	                                    <option value="nuts">콩/견과류</option>
	                                    <option value="egg">달걀/유제품</option>
	                                    <option value="vegetables">채소류</option>
	                                    <option value="fruits">과일류</option>
	                                    <option value="mushroom">버섯류</option>
	                                    <option value="grain">곡류</option>
	                                    <option value="flour">밀가루</option>
	                                    <option value="proceseedProduct">가공식품</option>
	                                </select>
	                                <select id="tipTag3" name="tipTag3" style="margin-top: 10px; margin-bottom: 10px;">
	                                	<option value="null">선택없음</option>
	                                    <option value="beef">소고기</option>
	                                    <option value="pork">돼지고기</option>
	                                    <option value="chicken">닭고기</option>
	                                    <option value="duck">오리고기</option>
	                                    <option value="seafood">해물류</option>
	                                    <option value="driedFish">건어물류</option>
	                                    <option value="nuts">콩/견과류</option>
	                                    <option value="egg">달걀/유제품</option>
	                                    <option value="vegetables">채소류</option>
	                                    <option value="fruits">과일류</option>
	                                    <option value="mushroom">버섯류</option>
	                                    <option value="grain">곡류</option>
	                                    <option value="flour">밀가루</option>
	                                    <option value="proceseedProduct">가공식품</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>썸네일</th>
	                            <td><input type="file" id="tipPic" name="tipPic" style="margin-top: 10px; margin-bottom: 10px;"></td>
	                        </tr>
	                        
	                        <tr>
	                            <th>글쓰기</th>
	                            <td>
	                                <textarea id="summernote" name="summernote" style="margin-top: 10px; margin-bottom: 10px;"></textarea>
	                            </td>
	                        </tr>
                   	 	</tbody>
                	</table>
					
					<script>
						$('#summernote').summernote({
							  width: 700,
							  height: 300,                 
							  minHeight: 300,             // 최소 높이
							  maxHeight: null,             // 최대 높이
							  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
							  lang: "ko-KR",					// 한글 설정
							  placeholder: '내용을 입력해주세요.',
							  callbacks: {
				                onImageUpload: function(files, editor) {
				                    sendFile(files, this);
				                },
					        	onPaste: function (e) {
									var clipboardData = e.originalEvent.clipboardData;
									if (clipboardData && clipboardData.items && clipboardData.items.length) {
										var item = clipboardData.items[0];
										if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
											e.preventDefault();
										}
									}
								}
			                }
						});
						
						
						function sendFile(files, editor) {
			        		
			        		console.log("작동");
			        		data = new FormData();
			        		for (var i = 0, max = files.length; i < max; i++) {
								data.append("file" + (i + 1), files[i]);						
							}
			                $.ajax({
			                    url: "tipEditorImageUpload.mn",
			                    data: data,
			                    type: "POST",
			                    cache: false,
			                    contentType: false,
			                    processData: false,
			                    success: function(urlList) {
			                    	for (var i = 0, max = urlList.length; i < max; i++) {
			                    		$(editor).summernote('editor.insertImage', urlList[i]);
			    					}
			                    },
			                    error: function() {
			                    	console.log("통신 실패");
			                    }
			                });
			            }
						
					</script>
					
					<hr>
	                <div align="right">
	                    <button type="submit" class="btn btn-primary">등록</button>
	                    <button onclick="history.back();" class="btn btn-dark">취소</button>
	                </div>

				</form>

            </div>
            <div id="content_3"></div>
        </div>
        <div id="footer"></div>
    </div>
				
				
	<%@ include file="../common/footerTemp.jsp" %>
		
	
</body>
</html>