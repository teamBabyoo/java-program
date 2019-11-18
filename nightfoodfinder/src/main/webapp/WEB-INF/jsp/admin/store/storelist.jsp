<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
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
          <li class="member"><a href="#">회원관리</a></li>
          <li class="store"><a href="#">가게관리</a></li>
          <li class="review"><a href="#">리뷰관리</a>
            <ul>
                <li><a class="review_all" href="#">전체리뷰</a></li>
                <li><a class="review_report" href="#">신고리뷰</a></li>
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
              <th>가게이름</th>
              <th>가게분류</th>
              <th>대표자이름</th>
              <th>사업자번호</th>
              <th>상태</th>
            </tr>
            <c:if test="${empty slist}">
            	<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>				
			</c:if>
			<c:forEach var="b" items="${slist}">
				<tr>				
					<td><a href="storedetail.do?no=${b.storeNo}">${b.storeName}</a></td>
					<td><a href="storedetail.do?no=${b.storeNo}">${b.storeCategory}</a></td>
					<td><a href="storedetail.do?no=${b.storeNo}">${b.storeOwner}</a></td>
					<td><a href="storedetail.do?no=${b.storeNo}">${b.businessNum}</a></td>
					<td>
					<c:choose>
					 <c:when test="${b.status == 0}">
					<span class="statusbutton"><a href="storestatus.do?no=${b.storeNo}">승인 대기</a></span>
					 </c:when>
					 <c:when test="${b.status == 1}">
	 				<span class="statusbutton"><a href="">승인 완료</a></span>
					 </c:when>
					 <c:otherwise>
					 <span class="statusbutton"><a href="">활동 정지</a></span>
					 </c:otherwise>
					 </c:choose>
	 				</td>
					</tr>
				</c:forEach>
          </table>
        </section>    
      </main>
      <footer role="contentinfo"></footer>
</body>
</html>