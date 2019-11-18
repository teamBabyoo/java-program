<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="store list" />
</c:import>
</head>
<body>
	<div class="wrapper main_wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- // 헤더 -->

		<!-- 컨텐트  -->
		<div class="content">
			<div>
				<div>전체 : ${sList.size()}개</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>번호</th>
							<th></th>
							<th>글쓴이</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty sList}">
							<tr>
								<td colspan="5">검색 결과가 없습니다.</td>
							</tr>
						</c:if>
						
						<c:forEach var="s" items="${sList}" varStatus="status">
							<tr class="store store_${status.count}st">
								<td>${s.storeNo}</td>
								<td><a href="storedetail.do?storeno=${s.storeNo}">${s.storeName}</a></td>
								<td>${s.storeTell}</td>
								<td>${s.openTime}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<!-- // 컨텐트  -->

		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		<!-- // 푸터 -->

		<!-- 팝업 백그라운드  -->
		<div class="bgbox"></div>
	</div>
	<script>
		
	</script>
</body>
</html>