<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="어워즈 스토어" />
</c:import>
</head>
<body>
	<div class="wrapper awards_store_wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- // 헤더 -->
		<!-- 컨텐트  -->
		<div class="content container">
			<h2>자유게시판</h2>
			<div>
				<div>전체 : ${awardDetail.size()}개</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>가게명</th>
						<th>전화번호</th>
						<th>카테고리</th>
						<th>여는시간</th>
						<th>닫는시간</th>
						<th>주소</th>
						<th>평점</th>
						<th>파일 sysname</th>
						<th>파일 path</th>
						<th>파일 extension</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty awardDetail}">
						<tr>
							<td colspan="5">게시물이 없습니다.</td>
						</tr>				
					</c:if>
					<c:forEach var="b" items="${awardDetail}">
					<tr>
						<td>${b.storeName}</td>
						<td>${b.storeTell}</a></td>
						<td>${b.category}</td>
						<td>${b.openTime}</td>
						<td>${b.closeTime}</td>
						<td>${b.streetLoad} ${b.addrDetail}</td>
						<td>${b.scope}</td>
						<td>${b.sysName}</td>
						<td>${b.path}</td>
						<td>${b.extension}</td>
						
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>