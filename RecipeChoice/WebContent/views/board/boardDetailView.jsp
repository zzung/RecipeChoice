<%@page import="com.kh.user.reply.model.vo.Reply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.kh.user.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getAttribute("boardDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        a, a:hover {
            color: black!important;
            text-decoration: none!important;
            vertical-align: middle!important;
        }

        form>div>a {
            margin-right: 30px!important;
        }

        .profileImg {
            border-radius: 100px;
        }

        .outerForm {
            width: 1000px;
            background: none;
            color: black;
            margin: auto;
            margin-top: 160px;
            margin-bottom: 100px;
        }
        .contentTable {
            border: 2px solid gray;
            text-align: center;
        }

        .contentTable>tbody>tr {
            border-bottom: 1px solid gray!important;
            display: inline-table;
            width: 100%!important;
            height: 50px!important;
        }

        .contentTable th {
            color: rgb(94, 94, 94)!important;
        }

        .content-title {
            overflow: hidden!important;
            display: -webkit-box!important;
            -webkit-line-clamp: 1!important;
            -webkit-box-orient: vertical!important;
        }

        .contentArea {
            margin: 50px!important;
        }

        .title {
            font-size: 36px!important;
            font-weight: bold!important;
            padding-left: 100px!important;
            color: rgb(9, 175, 79)!important;
        }
		.title:hover {
       		color: rgb(9, 175, 79)!important;
       	}
       	
        .replytitle {
            font-weight: bold!important;
            color: rgb(9, 175, 79)!important;
            padding-left: 100px!important;
        }

        .replyArea>textarea {
            vertical-align: middle!important;
            resize: none!important;
            width: 670px!important;
            display: inline-block!important;
        }

        .replyBtn {
            width: 120px!important;
            height: 79px!important;
            background: rgb(39, 174, 96)!important;
            border-color: rgb(9, 175, 79)!important;
        }

        .replyBtn:hover {
            background-color:rgb(9, 175, 79)!important;
            border-color: rgb(9, 175, 79)!important;
        }

        .reChangebtn {
            background: rgb(39, 174, 96)!important;
            border-color: rgb(9, 175, 79)!important;
            margin-left: 660px!important;
        }

        input[type=radio]{
            display: none;
        }

        input[type=radio] + label{
            vertical-align: middle;
            background-image: url("<%= request.getContextPath() %>/resources/image/board/uncheckedImage.PNG");
            width: 33px;
            height: 33px;
        }

        input[type=radio]:checked + label{
            background-image: url("<%= request.getContextPath() %>/resources/image/board/checkedImage.PNG");
        }
        
        .btn-primary {
        	background-color:rgb(9, 175, 79)!important;
        }
    </style>
</head>
<body>

	<%@ include file="../common/menubarTemp.jsp" %>
	
	<% 
		int loginUserNo = 0;
	
		String loginMemName = "";
	
		if(loginUser != null) {
			loginUserNo = loginUser.getUserNo();
			loginMemName = loginUser.getMemName();
		}
	%>
	
    <script>
        var preHtml = "";
		var maxReply = 0;
		var replyCount = 0;
		var topReplyNo = 0;
		var type = 1;
		
		var loginUserNo = 0;
    	
    	<% if(loginUser != null) { %>
    	loginUserNo = <%= loginUserNo %>;
    	<% } %>
		
		var contextPath = "<%= request.getContextPath() %>";
		
        $(function () {
        	
        	selectReply();
        	
        	$(document).scroll(function() {
	        	if(maxReply < replyCount) {
	        	    var maxHeight = $(document).height();
	        	    var currentScroll = $(window).scrollTop() + $(window).height();
	
	        	    if (maxHeight <= currentScroll + 100) {
	        	    	selectReply();
	        	    }
	        	}
       	  	});
        	
        	
            $('#report3').on('change', function(e){
                if(e.target.checked){
                    $('#etcReportModal').modal();
                }
            }); 
        });

        function isEmptyObject(e) {
        	return Object.keys(e).length() === 0 && e.constructor === Object;
        }
        
        function deleteReplyNoSet(e) {
            $("#deleteReplyNo").val($(e).data("no"));
        }
        
        function callChangeForm(e) {

            preHtml = $(e).parents('tr').html();
            var writer = $(e).siblings("#writerNickName").text();
            var text = $(e).parent().siblings("#replyContent").text().trim();
            var replyNo = $(e).data("no");

            var trimText = text.replace(/\s{2,}/gm,""); 

            var $changeFormSearch = $("#replyChangeForm");
            
            if($changeFormSearch.length > 0) {
            	changeCancel($changeFormSearch);
            }
            
            $(e).parents('tr').html(
                '<td id="replyChangeForm" colspan="2" width="90%" style="padding: 20px 40px; border: 1px solid gray">' +
                    '<div align="left" style="color: gray;">' +
                        '<b style="color: rgb(9, 175, 79); margin-right: 20px;">' +  writer + '</b>' +
                        '<a style="color: gray; padding-left: 550px; cursor: pointer;" onclick="changeCancel(this)">취소</a>' +
                    '</div>' +
                    '<br>' +
                    '<textarea class="form-control" id="reChangeArea" rows="4" style="resize: none;">' +
                    trimText +
                    '</textarea>' +
                    '<div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>' +
                    '<input id="changeReplyNo" type="hidden" value="' + replyNo + '">' +
                    '<input type="button" class="btn btn-primary reChangebtn" value="등록" onclick="replyChange()">' +
                '</td>'
            );

        }

        function changeCancel(e) {
            $(e).parents('tr').html(preHtml);
        }

        function reportContent(e) {
            var title = $("#contentTitle").text();
            var replyNum = $(e).data('no');

            var writer = "";
            var writerNo = "";

            if(replyNum != null) {
                writer = $(e).siblings("#writerNickName").text();
                writerNo = $(e).siblings("#replyUserNo").val();
                
                $("#reportedMemNo").val(writerNo);
                
            } else {
                writer = $("#contentWriter").text();
            }

            $("#reportWriter").text("작성자 : " + writer);
            $("#reportContentTitle").text("제목 : " + title);
            $("#reportReplyNo").val(replyNum);

        }

        function getReason() {
            var reason = $("#reportReasonArea").val();

            $("#report3").val(reason);
            $("#reportReason").text(reason);

        }
        
        // 댓글조회 ajax
        function selectReply() {
			$.ajax({
				url: 'replyAppend.re',
				data: {
					bno:<%= b.getBoardNo() %>,
					topReplyNo:topReplyNo,
					replyCount:replyCount,
					maxReply:maxReply,
					boardType:type
				},
				type: 'post',
				async: false,
				success: function (json) {
				
					var replyList = JSON.parse(json[0]);
					
					if(replyList.length > 10 || maxReply == 0) {
						$("#replylistArea>tbody").html(
							'<tr>' +
			                    '<td colspan="2">' +
			                        '<div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>' +
			                    '</td>' +
			                '</tr>'
						);
					}
					
					for (var i = 0, max = replyList.length; i < max; i++) {
						
						var login
						
						var picPath = contextPath + "/resources/image/board/defaultprofile.png";
						
						if(replyList[i].memPic != null) {
							picPath = contextPath + "/resources/member_upfiles/" + replyList[i].memPic;
						}
						
						var appendHtml = "";
						
						appendHtml += '<tr>' +
			                    '	<td width="10%" align="center">' +
			                    '		<img src=' + '"' + picPath + '"' + ' class="profileImg" width="50px" height="50px">' +
			                    '	</td>' +
				                '	<td width="90%" style="padding-right: 30px!important;">' +
			                    '   	<div align="left" style="color: gray!important; width: 100%;">' +
			                    '   		<b style="color: rgb(9, 175, 79)!important; margin-right: 20px!important;" id="writerNickName">' + replyList[i].memName + '</b>' +
			                  	replyList[i].createDate;
						
						if(loginUserNo != 0) {
	
							if(replyList[i].userNo == loginUserNo || replyList[i].userNo == 1) {
								
								if(replyList[i].userNo == loginUserNo) {
									appendHtml += '        	| <a onclick="callChangeForm(this)" data-no="' + replyList[i].boardReplyNo + '" style="color: gray!important; cursor: pointer;">수정</a>';
								}
								
								appendHtml += '        	| <a href="#replyDeleteModal" data-toggle="modal" data-target="#replyDeleteModal" data-no="' + replyList[i].boardReplyNo + '" onclick="deleteReplyNoSet(this)" style="color: gray!important">삭제</a>';
								
							} else {
								appendHtml += '        	| <a href="#reportModal" data-toggle="modal" data-target="#reportModal" data-no="' + replyList[i].boardReplyNo + '" onclick="reportContent(this)" style="color: gray!important">신고</a>';
							}
										
							appendHtml += '             <input type="hidden" id="replyUserNo" value="' + replyList[i].userNo + '">';
							
						}
						
						appendHtml += '   	</div>' +
				                      '    		<div id="replyContent">' +
				                    				replyList[i].replyContent +
				                      '    		</div>' +
				                      '		</td>' +
					            	  '</tr>' +
					            	  '<tr>' +
				                      '		<td colspan="2">' +
				                      '			<div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>' +
				                      '		</td>' +
				                	  '</tr>';
						
						$("#replylistArea>tbody").append(appendHtml);
					}
				
					topReplyNo = json[1];
					
					
					replyCount = json[2];
					
					$("#replyCount").html("댓글 " + replyCount);
					
					maxReply += 10;
				
				},
				error: function () {
					console.log("통신 실패");	
				}
			});
        }
        
        // 댓글 수정
        function replyChange() {
        	
        	var changeContent = $("#reChangeArea").val();
        	
        	$.ajax({
				url: 'replyChange.re',
				data: {
					replyNo:$("#changeReplyNo").val(),
					replyContent:changeContent,
				},
				type: 'post',
				success: function (result) {
					
					var $tr = $("#replyChangeForm").parents('tr');

					$tr.html(preHtml);
					
					if(result > 0) {
						$tr.find("#replyContent").html(changeContent);
					} else {
						alert("수정에 실패했습니다.");
					}
					
				},
				error: function () {
					console.log("통신 실패");	
				}
			});
		}
        
        // 댓글 삭제
        function deleteReply() {
        	
        	$.ajax({
				url: 'replyDelete.re',
				data: {
					replyNo:$("#deleteReplyNo").val()
				},
				type: 'post',
				success: function (result) {
					
					if(result > 0) {
						alert("댓글이 삭제되었습니다.");
					} else {
						alert("댓글 삭제에 실패했습니다.");
					}
					
					maxReply -= 10;
					selectReply();
					
				},
				error: function () {
					console.log("통신 실패");	
				}
			});
        	
		}
        
        // 댓글 작성
        function replyWrite() {
        	
        	$.ajax({
				url: 'replyWrite.re',
				data: {
					userNo:loginUserNo,
					bno:<%= b.getBoardNo() %>,
					memName:'<%= loginMemName %>',
					replyContent:$("#replyEnrollForm").val(),
					boardType:1
				},
				type: 'post',
				success: function (result) {
					
					if(result <= 0) {
						alert("댓글 작성에 실패했습니다.");
					}
					
					$("#replyEnrollForm").val("");
					
					maxReply -= 10;
					selectReply();
					
				},
				error: function () {
					console.log("통신 실패");	
				}
			});
        	
		}
        
        function reportRequest() {
			
        	$.ajax({
				url: 'reportContent.re',
				data: {
					reporterNo:loginUserNo,
					reportedMemNo:$("#reportedMemNo").val(),
					reason:$("input:radio[name=reportType]:checked").val(),
					boardType:1,
					bno:<%= b.getBoardNo() %>,
					replyNo:$("#reportReplyNo").val()
				},
				type: 'post',
				success: function (result) {
					
					if(result > 0) {
						alert("신고되었습니다.");
					} else {
						alert("신고에 실패했습니다. 잠시후 다시 시도해주세요.");
					}
					
				},
				error: function () {
					console.log("통신 실패");	
				}
			});
        	
		}
        
    </script>
	
    <div class="outerForm">

        <div align="right" style="width: 900px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
            </svg>

            <a href="">츄레</a>
            
            &lt;

            <a href="board.bo">자유게시판</a>

        </div>

        <br>
        <a href="board.bo" class="title">자유게시판</a>
        <br><br><br>


        <table class="contentTable" style="margin: 0px auto; width: 800px;">
            
            <tr>
                <th width="15%" style="padding-left: 30px;">카테고리</th>
                <td width="10%"><%= b.getCategory() %></td>
                <th width="10%">제목</th>
                <td width="40%" align="left">
                    <div id="contentTitle" class="content-title">
                    	<%= b.getBoardTitle() %>
                    </div>
                </td>
                <td width="15%" align="right" style="padding-right: 30px;"><%= b.getCreateDate() %></td>
            </tr>
            <tr>
                <th width="15%" style="padding-left: 40px;">작성자</th>
                <td width="30%" align="left" style="padding-left: 40px;" id="contentWriter"><%= b.getMemName() %></td>
                <td width="45%" align="right">조회수</td>
                <td width="10%" style="padding-right: 30px;"><%= b.getBoardCount() %></td>
            </tr>
            <tr style="border: none!important;">

				<% if(loginUserNo != 0) { %>
					
					<% if(loginUserNo == b.getUserNo() || loginUserNo == 1) {%>
					
							<% if(loginUserNo == b.getUserNo()) { %>
					                <td width="93%" align="right">
					                    <a href="<%= request.getContextPath() %>/boardWriteForm.bo?bno=<%= b.getBoardNo() %>">
					                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32.24800109863281" height="32.24800109863281" viewBox="0 0 32.24800109863281 32.24800109863281" fill="#000000" data-svg-content="true"><g><path d="M 21.172,21.172L 19.39,15.792L 9.11,5.512L 5.512,9.11L 15.792,19.39 zM 0.746,0.746c-0.994,0.994-0.994,2.604,0,3.598l 2.648,2.648l 3.598-3.598L 4.344,0.746 C 3.35-0.248, 1.74-0.248, 0.746,0.746zM 30,6L 15.822,6 l 2,2L 30,8 l0,22 L 8,30 L 8,17.822 l-2-2L 6,30 c0,1.104, 0.896,2, 2,2l 22,0 c 1.104,0, 2-0.896, 2-2L 32,8 C 32,6.896, 31.104,6, 30,6z"></path></g></svg>
					                    </a>
					                </td>	
							<% } %>
							
			                <td width="7%" align="right">
			                    <a href="#deleteCheckModal" data-toggle="modal" data-target="#deleteCheckModal" style="padding-right: 20px">
			                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32" height="32" viewBox="0 0 32 32" fill="#000000" data-svg-content="true"><g><path d="M 26,2l-4,0 c0-1.104-0.896-2-2-2L 14,0 C 12.896,0, 12,0.896, 12,2L 8,2 C 6.896,2, 6,2.896, 6,4l 22,0 C 28,2.896, 27.104,2, 26,2zM 6,30c0,1.104, 0.896,2, 2,2l 18,0 c 1.104,0, 2-0.896, 2-2L 28,6 L 6,6 L 6,30 z M 8,8l 18,0 l0,22 L 8,30 L 8,8 zM 11,10C 10.448,10, 10,10.448, 10,11l0,16 C 10,27.552, 10.448,28, 11,28S 12,27.552, 12,27l0-16 C 12,10.448, 11.552,10, 11,10zM 17,10C 16.448,10, 16,10.448, 16,11l0,16 C 16,27.552, 16.448,28, 17,28S 18,27.552, 18,27l0-16 C 18,10.448, 17.552,10, 17,10zM 23,10C 22.448,10, 22,10.448, 22,11l0,16 c0,0.552, 0.448,1, 1,1s 1-0.448, 1-1l0-16 C 24,10.448, 23.552,10, 23,10z"></path></g></svg>
			                    </a>
			                </td>
					<% } else {%>
			                <td align="right">
			                    <a href="#reportModal" data-toggle="modal" data-target="#reportModal" style="color: gray!important; padding-right: 20px;" onclick="reportContent(this)">신고</a>
			                </td>
					<% } %>             
					
                <% } %>

            </tr>
            <tr>
                <td width="100%">
                    <div class="contentArea">
                        <%= b.getBoardContent() %>
                    </div>
                </td>
            </tr>

        </table>
        
        <br>

		<!-- 댓글 -->
        <div class="replyArea" align="center">

			<% if(loginUser != null) { %>
            <textarea id="replyEnrollForm" class="form-control" rows="3" placeholder="댓글을 입력해주세요"></textarea>

            <input type="button" class="btn btn-primary replyBtn" value="등록" onclick="replyWrite()">

            <br><br>
			<% } %>

            <h4 id="replyCount" class="replytitle" align="left"></h4>

            <table id="replylistArea" class="replylistArea" style="margin: 0px auto; width: 800px;">
                <tr>
                    <td colspan="2">
                        <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
                    </td>
                </tr>
                <!-- 조회된 댓글 출력 -->
            </table>

       	</div>
       </div>

        <!-- 작성글 삭제 모달 -->
        <form action="boardDelete.bo">
            <div class="modal fade" id="deleteCheckModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-content">
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                                
                                <p>삭제하시겠습니까?</p>
                                <input id="deleteNo" type="hidden" name="bno" value="<%= b.getBoardNo() %>">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">삭제</button>
    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <!-- 댓글삭제모달 -->
        <div class="modal fade" id="replyDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-content">
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                            
                            <p>삭제하시겠습니까?</p>
                            <input id="deleteReplyNo" type="hidden" name="no" value="">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="deleteReply()">삭제</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 신고모달 -->
        <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-content">
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                            

                                <table>

                                    <tr>
                                        <td style="background: gray;" id="reportWriter"></td>
                                    </tr>
                                    <tr>
                                        <td style="background: gray;" id="reportContentTitle">제목 : </td>
                                    </tr>
                                    <tr>

                                    </tr>
                                    <tr>
                                        <td>
                                            <br>
                                            <label for="report1" style="width: 90%;">부적절한 게시물</label>
                                            <input type="radio" name="reportType" id="report1" value="부적절한 게시물">
                                            <label for="report1"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="report2" style="width: 90%;">음란 또는 청소년에게 부적합한 내용</label>
                                            <input type="radio" name="reportType" id="report2" value="음란 또는 청소년에게 부적합한 내용">
                                            <label for="report2"></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label for="report3" style="width: 90%;">기타</label>
                                            <input type="radio" name="reportType" id="report3" value="">
                                            <label for="report3"></label>
                                            <div id="reportReason"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>신고하기전에 잠깐?</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div style="color: gray;">게시물로 인해 개인(단체)이 명예훼손 피해를 입었거나 저작권을 침해 당한
                                                경우에는 게시중단 서비스를 통해 신고해 주시기 바랍니다.</div>
                                        </td>
                                    </tr>
                                </table>

                            <input id="reportReplyNo" type="hidden" name="no" value="">
                            <input id="reportedMemNo" type="hidden" name="no" value="<%= b.getUserNo() %>">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="reportRequest()">신고하기</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 신고 기타 사유 작성 모달 -->
        <div class="modal fade" id="etcReportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-content">
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                            
                            <table>
                                <tr>
                                    <td>기타사유</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 100%; height: 20px;"></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><textarea id="reportReasonArea" cols="50" rows="4" style="resize: none;"></textarea></td>
                                </tr>
                            </table>

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="getReason()">확인</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>

	<%@ include file="../common/footerTemp.jsp" %>
    
</body>
</html>