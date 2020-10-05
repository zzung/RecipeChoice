<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <script language="JavaScript">
       
             // 쿠키 생성
             function setCookie(cName, cValue, cDay){
                  var expire = new Date();
                  expire.setDate(expire.getDate() + cDay);
                  cookies = cName + '=' + escape(cValue) + '; path=/ ';
                  if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
                  document.cookie = cookies;
             }
        
             // 쿠키 가져오기
             function getCookie(cName) {
                  cName = cName + '=';
                  var cookieData = document.cookie;
                  var start = cookieData.indexOf(cName);
                  var cValue = '';
                  if(start != -1){
                       start += cName.length;
                       var end = cookieData.indexOf(';', start);
                       if(end == -1)end = cookieData.length;
                       cValue = cookieData.substring(start, end);
                  }
                  return unescape(cValue);
             }
      
        </script>
        
        쿠키 생성 버튼을 누른 후 쿠키 보기를 눌러 보세요.<br>
        쿠키 삭제 버튼을 누른 후 쿠키 보기도 눌러 보세요.<br>
        <br>
        쿠키 생성 버튼을 누른 후 이 페이지를 닫고 다시 들어와서 쿠키 보기를 눌러보세요.<br>
        <br>
        
        <input type="button" value="쿠키 생성" onclick="setCookie('test', 'cookie test, 쿠키 테스트', 1)">
        <input type="button" value="쿠키 보기" onclick="alert(getCookie('test'))">
        <input type="button" value="쿠키 삭제" onclick="setCookie('test', '', -1)">
        
       
</body>
</html>