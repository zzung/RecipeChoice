<%@page import="com.kh.user.board.model.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Board b = (Board)request.getServletContext().getAttribute("boardInfo");

	String servletPath = "boardWrite.bo";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 메뉴바 포함하고 빼줄것 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- include summernote css/js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <title>Document</title>
    <style>
        a, a:hover {
            color: black;
            text-decoration: none;
            vertical-align: middle
        }

        th {
            text-align: center;
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            padding-left: 100px;
            color: rgb(9, 175, 79);
        }

        .outer {
            width: 1000px;
            height: 550px;
            background: none;
            color: black;
            margin: auto;
            margin-top: 50px;
        }

        .custom-select {
            width: 100px;
        }

        #checkModal div{
            width: 300px;
        }

        #checkModal button {
            width: 100px;
        }

    </style>
    <script>
    	$(function () {
    		<% if(b != null) { %>
    			<% servletPath = "boardUpdate.bo"; %>
	   			$("#categorySelect").children().each(function () {
	   				var category = "<%= b.getCategory() %>";
	   				if($(this).val() == category) {
	   					$(this).prop("selected", true);
	   				}
	   			});
   			<% } %>
    	});
    </script>
</head>
<body>
    <!-- 메뉴바 추가 -->
    
    <div class="outer">

        <div align="right" style="width: 900px;">

            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48" data-svg-content="true" fill="#000000" style="vertical-align: middle;">
                <path d="M20 40V28h8v12h10V24h6L24 6 4 24h6v16z"></path>
            </svg>

            <a href="">츄레</a>
            
            &lt;

            <a href="">자유게시판</a>

        </div>

        <br>
        <div class="title">자유게시판</div>
        <br><br><br>


        <form action="<%= servletPath %>" id="insertForm" method="post">
			
			<!-- 2는 테스트용 로그인과 세션 구현시 실제 로그인한 유저의 번호 -->			
			<input type="hidden" name="userNo" value="2">
			
            <table style="margin: 0px auto;">
            
                <tr>
                    <th width="70px">카테고리</th>
                    <td width="500">
                        <select id="categorySelect" class="custom-select" name="category">
                            <option value="일상" selected>일상</option>
                            <option value="후기">후기</option>
                        </select>
                    </td>
                </tr>
                
                <% if(b == null) { %>
                <tr>
                    <th>제목</th>
                    <td><input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요" required></td>
                </tr>
        
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea id="summernote" name="content"></textarea>
                        <script>
                        $('#summernote').summernote({
                            placeholder: '내용을 입력해주세요.',
                            tabsize: 2,
                            height: 400
                        });
                        </script>
                    </td>
                </tr>
                <% } else { %>
        		<tr>
                    <th>제목</th>
                    <td>
                    	<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
                    	<input class="form-control" type="text" name="title" placeholder="제목을 입력해주세요" value="<%= b.getBoardTitle() %>" required>
                    </td>
                    
                </tr>
        
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea id="summernote" name="content"></textarea>
                        <script>
                        
                        $('#summernote').summernote({
                            tabsize: 2,
                            height: 400
                        });
                        
						$("#summernote").summernote('code', '<%= b.getBoardContent() %>');
                        
                        </script>
                    </td>
                </tr>
        		<% } %>
            </table>
        
            <br>

            <div align="right" style="width: 890px;">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkModal">등록하기</button>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-content">
                            <!-- Modal body -->
                            <div class="modal-body" align="center">
                                
                                <p>등록하시겠습니까?</p>

                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-primary">등록</button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    


    <!-- footer 추가 -->
    
</body>
</html>