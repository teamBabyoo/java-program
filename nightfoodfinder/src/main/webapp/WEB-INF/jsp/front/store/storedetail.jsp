<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="상세페이지" />
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
					    <div id="star">
					      <div>
						    <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="별" />
					      </div>
					      <div id="scopescore">
					     	 <%-- ${store.scope} --%>
					      </div>
					    </div>
						<div id="stTitle">
							<h2>${store.storeName}</h2>
						</div>
						<table>
							<tbody>
								<tr>
									<td rowspan="2" class="iicon" id="sizeminn" ><i class="fa fa-phone" aria-hidden="true"></i></td>
									<td class="tabletitlefont">Tel</td>
								</tr>
								<tr>
									<td class="tabletdfont">${store.storeTell}</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td rowspan="2" class="iicon"><i class="fa fa-map-marker"
										aria-hidden="true"></i></td>
									<td class="tabletitlefont">Location</td>
								</tr>
								<tr>
									<td class="tabletdfont">${store.city}${store.streetLoad} &nbsp<button id="showmap">지도보기</button></td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td rowspan="4" class="iicon" id="clockicon"><i class="fa fa-clock-o"
										aria-hidden="true"></i></td>
									<td class="tabletitlefont">Time</td>
								</tr>
								<tr>
									<td class="tabletdfont">${store.openTime} ~ ${store.closeTime}</td>

								</tr>
								<tr>
									<td class="tabletitlefont">Holiday</td>
								</tr>
								<tr>
									<td class="tabletdfont">
										<c:forEach items="${holidaylist}" var="h" varStatus="comma">
											${h.weekName}
										<c:if test="${not comma.last}">,</c:if>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<td class="iicon" id="menusizemin"><i class="fa fa-file-text-o" aria-hidden="true"></i></td>
									<td class="tabletitlefont">Menu </td>
								</tr>
							</tbody>
						</table>
						<div class="menulist" class="tabletdfont">
							<c:forEach items="${menu}" var="m">
								${m.menu} : ${m.price} <br>
							</c:forEach>
						</div>
						<table>
							<tbody>
								<tr>
									<td class="iicon" style="width: 62px;"><i class="fa fa-cutlery" aria-hidden="true"></i></td>
									<td class="tabletitlefont">Introduce </td>
								</tr>
						</table>
						<div class="menulist">${store.storeContent}</div>
						<div id="btdiv">
							<button id="updatebutton">수정하기</button>
						</div>



					</div>
					<div id="commentplace"></div>



				</div>
			</div>
			<!-- 푸터 -->
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	</div>
	<script type="text/javascript">
	 let scope = ${store.scope}
	</script>
	<script src="<c:url value='/resources/js/storedetail.js' />">
	</script>
</body>
</html>