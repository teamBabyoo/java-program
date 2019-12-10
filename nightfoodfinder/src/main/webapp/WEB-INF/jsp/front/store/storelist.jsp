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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
</head>
<body>
	<div class="wrapper list_wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- // 헤더 -->
		<c:set var="sList" value="${result.sList}" />
		<!-- 컨텐트  -->
		<div class="content">

			<div class="leftarea">
				<div class="listnotice">
					<div>
						<i class="far fa-moon">${sList.size()} 개의 가게가 검색 되었습니다.</i>
					</div>
				</div>
				<div class="storelist">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>번호</th>
								<th></th>
								<th>글쓴이</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tbody id="storetListTbody">
							<c:if test="${empty sList}">
								<tr>
									<td colspan="5">검색 결과가 없습니다.</td>
								</tr>
							</c:if>

							<c:forEach var="s" items="${sList}" varStatus="status">
								<tr class="store store_${status.count}st">
									<td>${s.storeNo}</td>
									<td><a href="storedetail.do?no=${s.storeNo}">${s.storeName}</a></td>
									<td>${s.storeTell}</td>
									<td>${s.openTime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<%-- paging 영역 --%>
					<div id="storePageDiv">
						<ul class="pagination">
						<c:if test="${result.pi.prev}">
						<li class="page-item">
							<a class="page-link" href="#${result.pi.startPage- 1}" data-page="${result.pi.startPage- 1}"> Previous</a>
						</li>
						</c:if>
						<c:forEach var="i" begin="${result.pi.startPage}" end="${result.pi.endPage}">
						<li class="page-item active">
							<a class="page-link" href="#${i}" data-page="${i}">${i}</a>
						</li>
						</c:forEach>
						<c:if test="${result.pi.next}">
						<li class="page-item">
							<a class="page-link" href="#${result.pi.endPage + 1}" data-page="${result.pi.endPage + 1}"> Next</a>
						</li>
						</c:if>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!-- // 컨텐트  -->

		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		<!-- // 푸터 -->

		<!-- 팝업 백그라운드  -->
		<div class="bgbox"></div>
	</div>
	<form id="searchStoreForm" method="post">
		<c:forEach var="city" items="${search.cities}">
			<input name="cities" type="hidden"  value="${city}" />
		</c:forEach>
		<c:forEach var="price" items="${search.priceType}">
			<input name="priceType" type="hidden"  value="${price}" />
		</c:forEach>
		
		<c:forEach var="category" items="${search.categoryCode}">
			<input name="categoryCode" type="hidden"  value="${category}" />
		</c:forEach>
		<input name="keyword" type="hidden"  value="${search.keyword}" />
	</form>	
	<script src="<c:url value='/resources/js/storelist.js' />"></script>
</body>
</html>





