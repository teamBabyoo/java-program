<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <c:import url="/WEB-INF/jsp/include/head.jsp">
    	<c:param name="msg" value="로그인"/>
    </c:import>
</head>
<body>
	<div id="kiWrapper">
		<form id="kiForm" action="kakaoinsert.do" method="post">
			<input type="hidden" name="userNo" value="" />
			<div>추가정보등록</div>
			<div>
				<select name="userGender">
					<option value="F">여성</option>
					<option value="M">남성</option>
				</select>
			</div>
			<div>
				<select name="userAge">
					<option value="10-19">10-19</option>
					<option value="20-29">20-29</option>
					<option value="30-39">30-39</option>
					<option value="40-49">40-49</option>
					<option value="50-59">50-59</option>
					<option value="60-69">60-69</option>
				</select>
			</div>
			<div>
				<input type="text" name="nickName" />
			</div>
			<div><button>제출</button></div>
		</form>
		
	</div>
	<script>
		var loginUser = `<%=session.getAttribute("loginUser") %>`;
		console.dir(loginUser);
		console.log(typeof(loginUser));
		let uNo = loginUser.split(',')[0].split('=')[1];
		$('input[name="userNo"]').attr("value", uNo);
		console.log($('input[name="userNo"]').val());
		
		
	</script>
</body>
</html>