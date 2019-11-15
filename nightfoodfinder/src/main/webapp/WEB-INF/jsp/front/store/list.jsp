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
	<%-- <c:import url="/WEB-INF/jsp/include/leftmenu.jsp" /> --%>
	<div class="container">
		<h2>자유게시판</h2>
		<div>
			<div>전체 : ${sList.size()}개</div>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${empty sList}">
					<tr>
						<td colspan="5">게시물이 없습니다.</td>
					</tr>				
				</c:if>
				<c:forEach var="s" items="${sList}">
				<tr>
					<td>${s.storeNo}</td>
					<td><a href="detail.do?no=${s.storeNo}">${s.storeName}</a></td>
					<td>${s.storeTell}</td>
					<td>${s.openTime}</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>








