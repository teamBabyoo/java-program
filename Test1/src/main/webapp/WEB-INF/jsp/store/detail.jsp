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
	<h2>가게 상세 페이지</h2>
	<a href="<c:url value="/store/regularRegist.do"/>">단골등록</a>
	<a href="<c:url value="/store/regularCancel.do"/>">단골취소</a>
	<a href="<c:url value="/index.jsp"/>">인덱스페이지로 이동</a>
</body>
</html>