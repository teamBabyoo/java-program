<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>    
<!DOCTYPE html>
<html>
<head>
	 <c:import url="/WEB-INF/jsp/include/head.jsp">
	 	<c:param name="msg" value="상세페이지"/>
	 </c:import>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <div class="wrapper detail_wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<div id="storedetail">
		<div id="pictureplace"></div>
		<div id="detaillistjs">
			<div id="storeinfo">
				<div id="stinfo">
					<div id="stTitle">
						<h2>${store.storeName}</h2>
					</div>
					<i class="fa fa-phone" aria-hidden="true"></i>
					<div>tell: ${store.storeTell}</div>
					<i class="fa fa-map-marker" aria-hidden="true"></i>
					<div>location: ${store.city}${store.streetLoad}</div>
					<i class="fa fa-calendar-minus-o" aria-hidden="true"></i>
					<div>time : ${store.openTime} ~ ${store.closeTime}</div>


					<i class="fa fa-clock-o" aria-hidden="true"></i>
					<div>
						Holiday :
						<c:forEach items="${holidaylist}" var="h" varStatus="comma">
					${h.weekName}
					<c:if test="${not comma.last}">,</c:if>
						</c:forEach>
					</div>
					<div>menu :</div>
					<c:forEach items="${menu}" var="m">
						<div>${m.menu}: ${m.price}</div>
					</c:forEach>
					<div>introduce: ${store.storeContent}</div>


				</div>
				<div id="commentplace"></div>



			</div>
		</div>
		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</div> 
</body>
</html>