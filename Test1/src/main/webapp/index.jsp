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
<h2>store controller</h2>
	<p><a href="<c:url value="/store/list.do"/>">가게 목록</a></p>
	<p><a href="<c:url value="/store/detail.do"/>">가게 상세</a></p>
	<p><a href="<c:url value="/store/reviewList.do"/>">리뷰 목록</a></p>
	<!-- <p><a href="<c:url value="/store/reviewWrite.do"/>">reviewWrite</a></p> -->
	<p><a href="<c:url value="/store/reviewWriteForm.do"/>">리뷰 작성</a></p>
	<p><a href="<c:url value="/store/reviewDetail.do"/>">리뷰 상세</a></p>
	<!-- <p><a href="<c:url value="/store/reviewDelete.do"/>">reviewDelete</a></p> -->
	<p><a href="<c:url value="/store/reviewCommentWriteForm.do"/>">리뷰 답글작성</a></p>
	<!--<p><a href="<c:url value="/store/reviewCommentDelete.do"/>">reviewCommentDelete</a></p> -->
	<p><a href="<c:url value="/store/regularRegist.do"/>">단골등록</a></p>
	<p><a href="<c:url value="/store/regularCancel.do"/>">단골취소</a></p>
	
<h2>user controller</h2>
	<p><a href="<c:url value="/user/userJoinForm.do"/>">일반회원 가입</a></p>
	<p><a href="<c:url value="/user/userLoginForm.do"/>">일반회원 로그인</a></p>
	<p><a href="<c:url value="/user/userPage.do"/>">마이페이지</a></p>
	
	<p><a href="<c:url value="/user/storeJoinForm.do"/>">가게회원 가입</a></p>
	<p><a href="<c:url value="/user/storeLoginForm.do"/>">가게회원 로그인</a></p>
	<p><a href="<c:url value="/user/storePage.do"/>">가게 마이페이지</a></p>
	
</body>
</html>