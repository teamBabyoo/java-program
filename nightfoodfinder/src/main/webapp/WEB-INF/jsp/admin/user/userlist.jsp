<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/admin_style.css" />">
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <header role="banner">
        <h1>Admin Panel</h1>
        <ul class="utilities">
          <li class="users"><a href="#">My Account</a></li>
          <li class="logout warn"><a href="">Log Out</a></li>
        </ul>
      </header>
      
      <nav role="navigation">
        <ul class="main">
          <li class="member"><a href="userlist.do">회원관리</a></li>
          <li class="store"><a href="storelist.do">가게관리</a></li>
          <li class="review"><a>리뷰관리</a>
            <ul>
                <li><a class="review_all" href="reviewlist.do">전체리뷰</a></li>
                <li><a class="review_report" href="reviewlist.do">신고리뷰</a></li>
            </ul>
        </li>
          <!-- <li class="comments"><a href="#">Comments</a></li>
          <li class="users"><a href="#">Manage Users</a></li> -->
        </ul>
      </nav>
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>Table</h2>
          <table>
            <tr>
              <th>아이디</th>
              <th>닉네임</th>
              <th>가입날짜</th>
              <th>리뷰수</th>
            </tr>
            <c:if test="${empty list}">
            	<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>				
			</c:if>
			<c:forEach var="b" items="${list}">
				<tr>
					<td><a href="userdetail.do?no=${b.userNo}">${b.userEmail}</a></td>
					<td><a href="userdetail.do?no=${b.userNo}">${b.nickName}</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.joinDate}"  /></td>
					<td>${b.reviewCnt}개</td>
				</tr>
				</c:forEach>
          </table>
        </section>
      
      </main>
      <footer role="contentinfo"></footer>
</body>
</html>