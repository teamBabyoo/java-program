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
	<h2>회원 상세페이지(마이페이지)</h2>
	<a href="<c:url value="/user/userUpdateForm.do"/>">회원정보수정</a>
	<a href="<c:url value="/user/userDelete.do"/>">탈퇴</a>
	<a href="<c:url value="/index.jsp"/>">인덱스페이지로 이동</a>
</body>
</html>