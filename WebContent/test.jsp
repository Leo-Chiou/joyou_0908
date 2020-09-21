<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-Type" content="text/html" charset="utf-8">
  <title>瀏覽器物件</title>
  
   <script type="text/javascript">
    var i = 5;
    var t = setInterval(function clock(){
    i--;
    time.innerHTML= i;
    if (i==1) {
      window.location.assign("http://www.sina.com");
    } 
  } ,1000);

  function goBack(){
  	varwindow.history.back();
  }

 </script>
</head>
<body>
   <h2>操作成功</h2>
   <span id="time">5</span>秒後回到主頁<a href="javascript:goBack()">返回</a>


</body>
</html>