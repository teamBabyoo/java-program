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
	<h2>가게 상세페이지</h2>
	<p><a href="<c:url value="/user/storeUpdateForm.do"/>">가게정보 수정</a></p>
	<p><a href="<c:url value="/user/storeContentWriteForm.do"/>">가게소개글 등록</a> </p>
	<p><a href="<c:url value="/user/storeContentUpdateForm.do"/>">가게소개글 수정</a></p>
	<p><a href="<c:url value="/user/storeDelete.do"/>">가게 탈퇴</a></p>
	<p><a href="<c:url value="/index.jsp"/>">인덱스페이지로 이동</a></p>
</body>
</html>