<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>카카오로그인</title>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
  </head>
  <body>
  <div>
  	
  </div>

  
  <script>
  var kInfo = "<%=session.getAttribute("kakaoInfo") %>"


 $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){
    	  console.log(kInfo);
    	  if(kInfo == "y"){
    		  //console.log("기존"+kInfo.value());
    	  	location.href= "${pageContext.request.contextPath}/front/main/main.do"    		  
    	  } else {
    		  //console.log("최초"+kInfo.value());
    		  alert('최초 카카오 로그인 추가정보입력 페이지 이동');
    		  location.href= "${pageContext.request.contextPath}/front/login/kakaoinfo.do" 
    	  }
    	  },2000);
    })
  </script>

  </body>
</html>