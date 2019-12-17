<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
html, div, body, h3 {
  margin: 0;
  padding: 0;
}

h3 {
  display: inline-block;
  padding: 0.6em;
}
</style>
<script type="text/javascript">
  $(document).ready(function() {
    var storeName = ${result}.response.storeName;
    //var email = ${result}.response.email;
    $("#name").html("환영합니다. "+storeName+"님");
    //$("#email").html(email);
    });
  //location.href = "${pageContext.request.contextPath}/";
</script>
</head>
<body>
  <div
    style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
  
  </div>
  <br>
  <h2 style="text-align: center" id="name"></h2>
  <h4 style="text-align: center" id="email"></h4>
  <script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(500);  // 1초 뒤에 사라 지자 
     
      setTimeout(function(){$("body").fadeOut(500);},500);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/front/main/main.do"},500);
// 2초 뒤에 메인 화면 으로 가자  
    
    })
  </script>

  </body>
</html>