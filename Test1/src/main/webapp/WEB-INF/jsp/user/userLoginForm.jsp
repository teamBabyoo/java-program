<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>일반회원 로그인페이지</h2>
		<a href="<c:url value="/user/userLogin.do" />">로그인</a>
		<%-- <a href="<c:url value="/index.jsp"/>">로그인.. 컨트롤러에서 인덱스페이지 못부르겠음 </a> --%>
</body>
</html>