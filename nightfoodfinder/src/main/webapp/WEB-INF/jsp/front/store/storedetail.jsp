<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

 #storedetail {
 	display: grid;
 	grid-template-rows: 1fr 1fr;
 	margin: 0 auto;
 	width: 960px;
 }
 #detailinfo {
 	border-bottom: 2px solid #c1c1c1;
 	padding-bottom: 20px;
 }
</style>
</head>
<body>
	<div id="storedetail"> 
		<div id="detailinfo">
			<h2>${store.storeName}</h2>
			<hr>
			<div>tell: ${store.storeTell}</div>
			<div>location: ${store.city}${store.streetLoad}</div>
			<div>time : ${store.openTime} ~ ${store.closeTime}</div>
			<div>Holiday :
				<c:forEach items="${holidaylist}" var="h" varStatus="comma">
					${h.weekName}
					<c:if test="${not comma.last}">,</c:if>
				</c:forEach>
			</div>
			<div>menu : </div>
			<c:forEach items="${menu}" var="m">
				<div>${m.menu}: ${m.price}</div>
			</c:forEach>
			<div>introduce: 
			 ${store.storeContent}
			</div>
		</div>
		<div id="comment">
		
		</div>
	</div>

</body>
</html>