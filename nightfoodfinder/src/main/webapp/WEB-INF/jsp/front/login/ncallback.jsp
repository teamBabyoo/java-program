<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="네이버로그인"/>
</c:import>
    <script type="text/javascript"
  src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
  charset="utf-8"></script>
<!-- <script type="text/javascript"
  src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
<!-- ↙ include head 동일한 내용 -->  
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->

</head>
<body>

  <script>
    $(function () {
     
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/front/main/main.do"},500);
// 2초 뒤에 메인 화면 으로 가자  
    
    })
  </script>

</body>
</html>