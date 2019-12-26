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
		<div class="pg-toplist">
			<!-- 컨텐트  -->
			<header class="basic-info-list">
		      <div class="inner">
		        <p class="status">
		          <time datetime="${award.regDate}">
		            ${award.regDate}
		          </time>
		        </p>
		
		        <h1 class="title">${award.userAge} ${award.userGender}의 맛집 리스트 TOP 10 </h1>
		      </div>
		    </header>
	    </div>
		<div class="content container contents">
			 
			<div>
			
				<div class="storelist">
      				<ul>
			<!-- store list 부분 -->
					<c:forEach var="s" items="${awardDetail}" varStatus="status">
				       	<li id="li_${status.count}" class="storeLn sto_li clearboth" data-store="${s.storeName}">
				        <a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${s.storeNo}" ></a> 
				<div>
					       		<div>
					       		<c:choose>
			<c:when test="${empty s.sysName}">
				<img src="<c:url value='/resources/images/basicfood.jpg' />" width="250px" height="180px" />
			</c:when>
			<c:otherwise>
					<img src="${pageContext.request.contextPath}/front/store/getByteImage.do?name=${s.sysName}&path=${s.path}" width="250px" height="180px" />
			</c:otherwise>
		</c:choose>
							
							</div>
							</div> 
							<!-- 가게 리스트의 내용 부분 -->
				       		<div class="sto_li_content" >
								<div>
									<span>${s.category}</span>
									<span class="sto_scope">
										<span class="scope_star">★</span>${s.scope}
									</span>		
								</div>
								<div class="store_name">${s.storeName}</div>
								<div class="store_info">
									<div>전화번호 : ${s.storeTell}</div>
									<div>영업 시간 : ${s.openTime} ~ ${s.closeTime}</div>
									<div>주소 : ${s.streetLoad} ${s.addrDetail}</div>
								</div>		
				       		</div>
				       	</li>
				    </c:forEach>
				    </ul>
				</div>
			
	<%-- 		
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
				</table> --%>
			</div>
		</div>
		    
	    <!-- 푸터 -->
	    <c:import url="/WEB-INF/jsp/include/footer.jsp" />
	    <!-- // 푸터 -->
	</div>
</body>
</html>