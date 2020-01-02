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
  </head>
  <body>
  <div>
  	
  </div>

  
  <script>
  var kInfo = "<%=session.getAttribute("kakaoInfo") %>"


 $(function () {
      setTimeout(function(){
    	  if(kInfo == "y"){
    		  location.href= "${pageContext.request.contextPath}/front/main/main.do"
    		 } else {
    		  alert('최초 카카오 로그인시 추가정보입력이 필요합니다. 추가정보입력 페이지로 이동합니다.');
    		  location.href= "${pageContext.request.contextPath}/front/login/kakaoinfo.do" 
    	  }
    	  },500);
    })
  </script>

  </body>
</html>