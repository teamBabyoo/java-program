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
	
		<div id="storedetail" class="content clearboth">
			<div id="pictureplace"></div>
			
			<div id="detaillistjs">
				<div id="storeinfo">
					<div id="stinfo">
					    <div id="star">
					      <div>
						    <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="별" />
					      </div>
					      <div id="scopescore">
					      </div>
					    </div>
						<div id="stTitle">
							<h2>${store.storeName}</h2>
							<ul>
								<li><a href="#"><i class="fa fa-bookmark-o" aria-hidden="true"></i>단골</a></li>
								<li class="tab_share"><a href="#"><i class="fa fa-share-square-o" aria-hidden="true"></i>공유</a>
									<!-- 공유 팝업 -->
									<div class="sharePop hidden">
										<ul class="clearboth">
										<li><a href="https://twitter.com/intent/tweet?text=심야식당 서울 강동구 강동대로 205 (출처 : 심야식당)&url=http://www.naver.com" target="_blank"><img src="${pageContext.request.contextPath }/resources/images/f_twitter.png" /></a></li>
										<li><a href="http://www.facebook.com/sharer/sharer.php?u=naver.com" target="_blank"><img src="${pageContext.request.contextPath }/resources/images/icon_facebookS.png" /></a></li>
										<li><a href="#"><img src="${pageContext.request.contextPath }/resources/images/icon_kakao.png" />카카오톡</a></li>
									</ul>
									<div class="clearboth"><p class="ellipsis">https://app.slack.com/client/TPPHA763F/CPPH24F16/files/FPJQPCU4R</p><a href="#" id="copyclip">복사</a></div>
								</div>
								</li>
								<!-- 맨 아래 지도로 보내는 a링크 -->
								<li><a href="#"><i class="fa fa-car" aria-hidden="true"></i>길찾기</a></li>
							</ul>							
						</div>
						<table>
							<tbody>
								<tr>
									<th rowspan="2"><i class="fa fa-phone iicon" aria-hidden="true"></i></th>
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
									<th rowspan="2" ><i class="fa fa-map-marker iicon" aria-hidden="true"></i></th>
									<td class="tabletitlefont">Location</td>
								</tr>
								<tr>
									<td class="tabletdfont">${store.streetLoad} &nbsp<button id="showmap">지도보기</button></td>
								</tr>
							</tbody>
						</table>
						<table>
							<tbody>
								<tr>
									<th rowspan="4" id="clock"><i class="fa fa-clock-o iicon" 
										aria-hidden="true"></i></th>
									<td class="tabletitlefont">Time</td>
								</tr>
								<tr>
									<td class="tabletdfont" id="operatingtime"></td>

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
									<th><i class="fa fa-file-text-o iicon" aria-hidden="true"></i></th>
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
									<th><i class="fa fa-cutlery iicon" aria-hidden="true"></i></th>
									<td class="tabletitlefont">Introduce </td>
								</tr>
						</table>
						<div class="menulist">${storeContent.storeContent}</div>
						<div id="btdiv">
							<span id="updatebutton" onclick="location.href='${pageContext.request.contextPath}/front/store/storecontentupdateForm.do?no=${store.storeNo}'">수정하기</span>
							
						</div>



					</div>
					
					<!-- 댓글  -->

					<div id="commentplace">
						<div class="commentwrap">
							<ul class="clearboth">
								<li class="float_l">Review</li>
								<li id="btn_leave_rv" class="float_r"><i class="fa fa-plus-circle" aria-hidden="true"></i>리뷰남기기</li>
							</ul>
							
							<div class="leave_rv user_rv">
								<form name="reviewForm" id="reviewForm" onsubmit="return registReview()" method="POST" enctype="multipart/form-data">
									<ul class="clearboth">
										<li>
											<ul class="clearboth">
												<li class="float_l"><i class="fa fa-user-circle-o" aria-hidden="true"></i>${user.userEmail}</li>
												<li id="scopePannel" class="float_r">
													<a href="#" data-rscope="1">★</a>
													<a href="#" data-rscope="2">★</a>
													<a href="#" data-rscope="3">★</a>
													<a href="#" data-rscope="4">★</a>
													<a href="#" data-rscope="5">★</a>
												</li>
											</ul>
										</li>
										<li>
											<textarea name="reviewContent" placeholder="매너있는 리뷰를 남겨주세요. "></textarea>
										</li>
										<li>
											<ul class="clearboth">
												<li class="float_l"><input type="file" name="attach" multiple="multiple" /></li>
												<li class="float_r"><button type="submit">등록</button></li>
											</ul>
										</li>
									</ul> 
									<input type="hidden" id="nickName" />   
									<%-- <input type="hidden" name="storeNo" value="${store.storeNo}" /> --%>
									<!-- <input type="hidden" name="recomment" value="" /> -->
								</form>
							</div>
							<div id="targetContainer">
							
							</div>
						</div>
					</div> 
					<!-- // 댓글 끝 -->
					
				</div>
			</div>
		</div>
		
		<!-- 푸터 -->
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
	    <!-- 팝업 백그라운드  -->
    	<div class="bgbox"></div>
    	<!-- 신고팝업 -->
    	  <div id="rmyModal" class="rmodal" style="display: none"></div>
	</div>
	<script type="text/javascript">
//	console.log(${loginUser});
	 let no = ${store.storeNo};
	 let scope = ${store.scope};
	 let openTime = '${store.openTime}';  
	 let closeTime = '${store.closeTime}';
	 let context = '${pageContext.request.contextPath}';
	 let storeNo = ${store.storeNo};
	 let storeScope = "";
	 let fileGroupCode = null;
	 let recomment = null;
	 let userNo = ${user.userNo};
	</script>
	<script src="<c:url value='/resources/js/storedetail.js' />"></script>
</body>
</html>