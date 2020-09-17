<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<title>Insert title here</title>
    <style>
        a, a:hover {
            color: black;
            text-decoration: none;
            vertical-align: middle
        }

        form>div>a {
            margin-right: 30px!important;
        }

        img {
            border-radius: 100px;
        }

        .outer {
            width: 1000px;
            height: 550px;
            background: none;
            color: black;
            margin: auto;
            margin-top: 50px;
        }
        .listArea {
            border: 2px solid gray;
            text-align: center;
        }

        .listArea>tbody>tr:hover {
            cursor: pointer;
            background: gray;
        }

        .listArea>tbody>tr:hover div {
            color: black!important;
        }

        .bar:hover {
            cursor: auto!important;
            background: none!important;
        }

        .custom-select {
            color: black;
            width: 100px;
            font-size: 13px;
        }

        .title {
            font-size: 36px;
            font-weight: bold;
            padding-left: 100px;
            color: rgb(9, 175, 79);
        }

        .content{
            width: 620px;
            height: 45px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .content * {
            display: inline;
            font-size: 16px;
            font-weight: normal;
            color: black;
        }

        .content>img {
            display: none;
        }

        .content-title {
            height: 25px;
            width: 300px;
            -webkit-line-clamp: 1;
        }

        .btnWrite {
            font-size: 12px;
            color: rgb(255, 255, 255);
            background-color: rgb(94, 94, 94);
            line-height: 10px;
        }

        .btnSearch {
            border: none;
            background: none;
            vertical-align: middle;
        }

        .btnSearch:hover {
            cursor: pointer;
        }
    </style>
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

        <form action="/search.bo" method="GET" style="margin-bottom: 10px;">
            <div align="right" style="width: 900px;">
                
                <a href="">일상</a>

                <a href="">후기</a>

                <select class="custom-select" name="searchType">
                    <option value="title" selected>제목</option>
                    <option value="createDate">등록일</option>
                    <option value="writer">작성자</option>
                </select>
    
                <input type="text" name="keyword" class="form-control" placeholder="검색어를 입력해주세요" style="display: inline-block; width: 200px; vertical-align: middle;">

                <button type="submit" class="btnSearch"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="32.24800109863281" height="32.24800109863281" viewBox="0 0 32.24800109863281 32.24800109863281" fill="rgb(46, 204, 113)" data-svg-content="true"><g><path d="M 19,0C 11.82,0, 6,5.82, 6,13c0,3.090, 1.084,5.926, 2.884,8.158l-8.592,8.592c-0.54,0.54-0.54,1.418,0,1.958 c 0.54,0.54, 1.418,0.54, 1.958,0l 8.592-8.592C 13.074,24.916, 15.91,26, 19,26c 7.18,0, 13-5.82, 13-13S 26.18,0, 19,0z M 19,24 C 12.934,24, 8,19.066, 8,13S 12.934,2, 19,2S 30,6.934, 30,13S 25.066,24, 19,24z"></path></g></svg></button>

                <!-- AJAX로 정렬 -->
                <select class="custom-select" name="orderType">
                    <option value="dateDESC" selected>최신순</option>
                    <option value="writerName">작성자</option>
                </select>
            </div>
        </form>

        <table class="listArea" style="margin: 0px auto; width: 800px;">
            <!-- hover시 여백용 tr -->
            <tr style="height: 10px;"><td></td><td></td><td></td></tr>
            <tr>
                <td width="10%"><img src="<%= request.getContextPath() %>resources/image/board/defaultprofile.png" width="40px" height="40px"></td>
                <td width="10%">일상</td>
                <td width="80%">
                    <div align="left" class="content content-title">이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 사막이다.</div>
                    <div class="content">
                        예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이, 봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다.
                        장식하는 듣기만 심장의 때까지 없으면, 있으랴? 이상의 낙원을 광야에서 듣기만 이성은 위하여, 그들의 같이 그리하였는가? 꽃이 생명을 그것을 되려니와, 몸이 있으랴? 있는 대고, 반짝이는 위하여 꽃 설레는
                        속잎나고, 철환하였는가? 청춘 보이는 바이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 무엇을 사막이다.
                    
                        충분히 많이 이것이야말로 몸이 같이, 속잎나고, 사랑의 그들에게 뿐이다. 사는가 꽃이 뜨고, 꽃이 말이다. 설레는 피가 위하여 것은 끓는다. 없는 바이며, 커다란 꾸며 노년에게서 구하지 공자는 영락과 인류의
                        위하여서. 것은 청춘의 방황하였으며, 운다. 꽃이 같은 것은 것이다. 싸인 가는 피가 없으면, 이상은 것이다. 싶이 설산에서 능히 보는 청춘의 품으며, 할지니, 힘있다. 소금이라 이상의 없는 예수는 영원히
                        귀는 위하여, 것이다.
                    
                        예수는 이상의 거선의 눈이 없는 어디 청춘의 별과 더운지라 부패뿐이다. 실로 끓는 청춘은 그와 청춘의 설레는 위하여, 못할 그리하였는가? 그들은 봄바람을 가장 수 두손을 그것을 커다란 그림자는 지혜는
                        아름다우냐? 우리 뭇 구하지 얼마나 것이다.보라, 과실이 뿐이다. 그들의 기쁘며, 간에 갑 살 것이다.보라, 청춘의 끝에 봄바람을 것이다. 기관과 그것은 용기가 그리하였는가? 이상 현저하게 붙잡아 긴지라
                        따뜻한 청춘 들어 무엇이 사막이다. 타오르고 간에 같이, 같이 아니한 뜨거운지라, 따뜻한 못하다 운다. 그들은 속잎나고, 있는 아니다.
                    </div>
                    <div align="right" style="padding-right: 20px; color: gray;">2020.08.03 18:36</div>
                </td>
            </tr>
            <tr class="bar">
                <td colspan="3" align="center">
                    <!-- 실제 서버에 이미지 올리고 업로드한 주소로 교체 -->
                    <div style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 750px; height: 20px;"></div>
                </td>
            </tr>
            <tr>
                <td width="10%"><img src="<%= request.getContextPath() %>resources/image/board/defaultprofile.png" width="40px" height="40px"></td>
                <td width="10%">일상</td>
                <td width="80%">
                    <div align="left" class="content content-title">이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 사막이다.</div>
                    <div class="content">
                        예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이, 봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다.
                        장식하는 듣기만 심장의 때까지 없으면, 있으랴? 이상의 낙원을 광야에서 듣기만 이성은 위하여, 그들의 같이 그리하였는가? 꽃이 생명을 그것을 되려니와, 몸이 있으랴? 있는 대고, 반짝이는 위하여 꽃 설레는
                        속잎나고, 철환하였는가? 청춘 보이는 바이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 무엇을 사막이다.
                    
                        충분히 많이 이것이야말로 몸이 같이, 속잎나고, 사랑의 그들에게 뿐이다. 사는가 꽃이 뜨고, 꽃이 말이다. 설레는 피가 위하여 것은 끓는다. 없는 바이며, 커다란 꾸며 노년에게서 구하지 공자는 영락과 인류의
                        위하여서. 것은 청춘의 방황하였으며, 운다. 꽃이 같은 것은 것이다. 싸인 가는 피가 없으면, 이상은 것이다. 싶이 설산에서 능히 보는 청춘의 품으며, 할지니, 힘있다. 소금이라 이상의 없는 예수는 영원히
                        귀는 위하여, 것이다.
                    
                        예수는 이상의 거선의 눈이 없는 어디 청춘의 별과 더운지라 부패뿐이다. 실로 끓는 청춘은 그와 청춘의 설레는 위하여, 못할 그리하였는가? 그들은 봄바람을 가장 수 두손을 그것을 커다란 그림자는 지혜는
                        아름다우냐? 우리 뭇 구하지 얼마나 것이다.보라, 과실이 뿐이다. 그들의 기쁘며, 간에 갑 살 것이다.보라, 청춘의 끝에 봄바람을 것이다. 기관과 그것은 용기가 그리하였는가? 이상 현저하게 붙잡아 긴지라
                        따뜻한 청춘 들어 무엇이 사막이다. 타오르고 간에 같이, 같이 아니한 뜨거운지라, 따뜻한 못하다 운다. 그들은 속잎나고, 있는 아니다.
                    </div>
                    <div align="right" style="padding-right: 20px; color: gray;">2020.08.03 18:36</div>
                </td>
            </tr>
            <tr class="bar">
                <td colspan="3" align="center">
                    <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 750px; height: 20px;"></div>
                </td>
            </tr>
            <tr>
                <td width="10%"><img src="<%= request.getContextPath() %>resources/image/board/defaultprofile.png" width="40px" height="40px"></td>
                <td width="10%">일상</td>
                <td width="80%">
                    <div align="left" class="content content-title">이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 사막이다.</div>
                    <div class="content">
                        예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이, 봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다.
                        장식하는 듣기만 심장의 때까지 없으면, 있으랴? 이상의 낙원을 광야에서 듣기만 이성은 위하여, 그들의 같이 그리하였는가? 꽃이 생명을 그것을 되려니와, 몸이 있으랴? 있는 대고, 반짝이는 위하여 꽃 설레는
                        속잎나고, 철환하였는가? 청춘 보이는 바이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 무엇을 사막이다.
                    
                        충분히 많이 이것이야말로 몸이 같이, 속잎나고, 사랑의 그들에게 뿐이다. 사는가 꽃이 뜨고, 꽃이 말이다. 설레는 피가 위하여 것은 끓는다. 없는 바이며, 커다란 꾸며 노년에게서 구하지 공자는 영락과 인류의
                        위하여서. 것은 청춘의 방황하였으며, 운다. 꽃이 같은 것은 것이다. 싸인 가는 피가 없으면, 이상은 것이다. 싶이 설산에서 능히 보는 청춘의 품으며, 할지니, 힘있다. 소금이라 이상의 없는 예수는 영원히
                        귀는 위하여, 것이다.
                    
                        예수는 이상의 거선의 눈이 없는 어디 청춘의 별과 더운지라 부패뿐이다. 실로 끓는 청춘은 그와 청춘의 설레는 위하여, 못할 그리하였는가? 그들은 봄바람을 가장 수 두손을 그것을 커다란 그림자는 지혜는
                        아름다우냐? 우리 뭇 구하지 얼마나 것이다.보라, 과실이 뿐이다. 그들의 기쁘며, 간에 갑 살 것이다.보라, 청춘의 끝에 봄바람을 것이다. 기관과 그것은 용기가 그리하였는가? 이상 현저하게 붙잡아 긴지라
                        따뜻한 청춘 들어 무엇이 사막이다. 타오르고 간에 같이, 같이 아니한 뜨거운지라, 따뜻한 못하다 운다. 그들은 속잎나고, 있는 아니다.
                    </div>
                    <div align="right" style="padding-right: 20px; color: gray;">2020.08.03 18:36</div>
                </td>
            </tr>
            <tr class="bar">
                <td colspan="3" align="center">
                    <div data-image-content="false" style="background-image: url(https://ovenapp.io/static/images/shape/line-horizontal.svg); width: 750px; height: 20px;"></div>
                </td>
            </tr>
            <tr>
                <td width="10%"><img src="<%= request.getContextPath() %>resources/image/board/defaultprofile.png" width="40px" height="40px"></td>
                <td width="10%">일상</td>
                <td width="80%">
                    <div align="left" class="content content-title">이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 사막이다.</div>
                    <div class="content">
                        예수는 맺어, 산야에 무엇이 미인을 것은 약동하다. 거선의 넣는 하였으며, 그림자는 같이, 봄바람이다. 소금이라 이상 이것이야말로 얼마나 소담스러운 미인을 사람은 이것이다.
                        장식하는 듣기만 심장의 때까지 없으면, 있으랴? 이상의 낙원을 광야에서 듣기만 이성은 위하여, 그들의 같이 그리하였는가? 꽃이 생명을 그것을 되려니와, 몸이 있으랴? 있는 대고, 반짝이는 위하여 꽃 설레는
                        속잎나고, 철환하였는가? 청춘 보이는 바이며, 심장은 광야에서 풍부하게 두손을 위하여서. 설레는 원대하고, 무엇을 무엇을 사막이다.
                    
                        충분히 많이 이것이야말로 몸이 같이, 속잎나고, 사랑의 그들에게 뿐이다. 사는가 꽃이 뜨고, 꽃이 말이다. 설레는 피가 위하여 것은 끓는다. 없는 바이며, 커다란 꾸며 노년에게서 구하지 공자는 영락과 인류의
                        위하여서. 것은 청춘의 방황하였으며, 운다. 꽃이 같은 것은 것이다. 싸인 가는 피가 없으면, 이상은 것이다. 싶이 설산에서 능히 보는 청춘의 품으며, 할지니, 힘있다. 소금이라 이상의 없는 예수는 영원히
                        귀는 위하여, 것이다.
                    
                        예수는 이상의 거선의 눈이 없는 어디 청춘의 별과 더운지라 부패뿐이다. 실로 끓는 청춘은 그와 청춘의 설레는 위하여, 못할 그리하였는가? 그들은 봄바람을 가장 수 두손을 그것을 커다란 그림자는 지혜는
                        아름다우냐? 우리 뭇 구하지 얼마나 것이다.보라, 과실이 뿐이다. 그들의 기쁘며, 간에 갑 살 것이다.보라, 청춘의 끝에 봄바람을 것이다. 기관과 그것은 용기가 그리하였는가? 이상 현저하게 붙잡아 긴지라
                        따뜻한 청춘 들어 무엇이 사막이다. 타오르고 간에 같이, 같이 아니한 뜨거운지라, 따뜻한 못하다 운다. 그들은 속잎나고, 있는 아니다.
                    </div>
                    <div align="right" style="padding-right: 20px; color: gray;">2020.08.03 18:36</div>
                </td>
            </tr>
            <!-- hover시 여백용 tr -->
            <tr style="height: 10px;"><td></td><td></td><td></td></tr>
        </table>
        
        <!-- 로그인했을때만 -->
        <div align="right" style="width: 900px;">
            <button class="btn btn-secondry btnWrite">글쓰기</button>
        </div>
        
        <br>

        <div class="pagingArea" align="center">
            
            <!-- 맨 처음으로 (<<) -->
            <button class="btn btn-secondry"> &lt;&lt; </button>
            <!-- 이전페이지로 (<) -->
            <button class="btn btn-secondry"> &lt; </button>
            
            <!-- button{$}*10 -->
            <button class="btn btn-primary" disabled>1</button>
            <button class="btn btn-secondry">2</button>
            <button class="btn btn-secondry">3</button>
            <button class="btn btn-secondry">4</button>
            <button class="btn btn-secondry">5</button>
            <button class="btn btn-secondry">6</button>
            <button class="btn btn-secondry">7</button>
            <button class="btn btn-secondry">8</button>
            <button class="btn btn-secondry">9</button>
            <button class="btn btn-secondry">10</button>
            
            <!-- 다음페이지로 (>) -->
            <button class="btn btn-secondry"> &gt; </button>
            <!-- 맨 끝으로 (>>) -->
            <button class="btn btn-secondry"> &gt;&gt; </button>
        </div>
    </div>
    
    <!-- footer 추가 -->
    
</body>
</html>