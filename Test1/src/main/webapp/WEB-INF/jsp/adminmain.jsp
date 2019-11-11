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

<h2>admin main page</h2>
	<a href="<c:url value="/admin/userlist.do"/>">사용자리스트페이지로 이동</a><br/>
	<a href="<c:url value="/admin/storelist.do"/>">가게리스트페이지로 이동</a><br/>
	<a href="<c:url value="/admin/reviewlist.do"/>">리뷰리스트페이지로 이동</a>
</body>
</html>