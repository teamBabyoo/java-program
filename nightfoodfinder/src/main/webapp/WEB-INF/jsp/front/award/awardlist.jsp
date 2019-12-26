<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="NFF 어워즈" />
</c:import>
</head>
<body>
	<div class="wrapper awards_wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- // 헤더 -->
		<!-- 컨텐트  -->
		<div class="content container">
		 <ul class="list-type-ls type-column02-picks">
		 <c:if test="${empty awardList}">
							게시물이 없습니다.
					</c:if>
					<c:forEach var="b" items="${awardList}">
					<c:set var="userAges" value="${b.userAge}" />
					<c:set var="userAge" value="${fn:split(userAges,'0')}" />

            <li class="top_list_item">
            <div class="imgandtitle">
              <a href="${pageContext.request.contextPath}/front/award/awarddetail.do?awardNo=${b.awardNo}&storeNoList=${b.storeNoList}" target="_blank">
                <figure class="ls-item">
                  <div class="thumb">
                    <div class="inner">
                      <img class="center-crop portrait lazy"
                           src="<c:url value='/resources/images/awardfood${userAge[0]}.jpg' />">
                  </div>
                  <figcaption class="info">
                    <div class="info_inner_wrap">
                      <span class="title">${userAge[0]}0대 ${b.userGender}의 맛집 리스트 TOP 10</span>
                    </div>
                  </figcaption>
                    </div>
                </figure>
              </a>
              </div>
            </li>
            </c:forEach>
			<%-- <h2>자유게시판</h2>
			<div>
				<div>전체 : ${awardList.size()}개</div>
				<table class="table table-bordered">
					<thead>
					<tr>
						<th>번호</th>
						<th>성별</th>
						<th>나이대</th>
						<th>top10</th>
						<th>등록일</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${empty awardList}">
						<tr>
							<td colspan="5">게시물이 없습니다.</td>
						</tr>				
					</c:if>
					<c:forEach var="b" items="${awardList}">
					<tr>
						<td>${b.awardNo}</td>
						<td>${b.userGender}</a></td>
						<td>${b.userAge}</td>
						<td>
						<span class="button"><a href="${pageContext.request.contextPath}/front/award/awarddetail.do?awardNo=${b.awardNo}&storeNoList=${b.storeNoList}" target="_blank">${b.storeNoList}</a></span>
						</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.regDate}" /></td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div> --%>
		</ul>
	</div>
		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		<!-- // 푸터 -->
	</div>
</body>
</html>