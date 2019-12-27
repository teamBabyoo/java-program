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

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>  -->


<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript">
let arr = new Array();
function abs(value1, value2, value3) {
	let store = {
		storeName : value3,
		latitude : value1,
		longitude : value2
	}
	arr.push(store);
}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
</head>
<body>
	<div class="wrapper list_wrap">
		<!-- 헤더 -->
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<!-- // 헤더 -->
		
		<c:set var="sList" value="${result.sList}" />
		<!-- 컨텐트  -->
		<div class="content list_content">
			<div class="search_conditions">
				<span>
					<c:forEach items="${search.categoryCode}" var="cate">
						카테고리 ${cate}
					</c:forEach>
				</span>
				<span>
					<c:forEach items="${search.cities}" var="city">
						지역 ${city}
					</c:forEach>
				</span>
				<span>가격대</span>
				<span>${search.keyword}란 단어로 검색</span>
				<span>열려있는지 유무</span>
			</div>
			<div class="leftarea">
				<div id="map"></div>
			</div>
			<div class="rightarea">
				<div class="listnotice">
					<div>
						<i class="far fa-moon"></i>
						<span>${result.pi.listCnt} 개의 가게가 검색 되었습니다.</span>
					</div>
				</div>
				<div class="storelist">
					<div class="ajaxstolist">
	      				<ul>
		      				<c:if test="${empty sList}">
								<li class="storeLn sto_li clearboth">검색 결과가 없습니다.</li>
							</c:if>
					<!-- store list 부분 -->
							<c:forEach var="s" items="${sList}" varStatus="status">
								<c:set value="${s.fileVoList}" var="files" />
					       		<li id="li_${status.count}" class="storeLn sto_li clearboth" data-store="${s.storeName}">
						        	<a href="storedetail.do?no=${s.storeNo}" ></a>
									<div>
						       			<!-- 썸네일 사진 들어갈 div -->
						       			<div class="home__slider">
											<div class="bxslider">
												<!-- 사진이 없을때 default 이미지 보여준다. -->  
												<c:if test="${empty files}">
													<img src="https://i.pinimg.com/originals/33/6a/ea/336aea314c68c0bc3eb8f6b5cd799de4.jpg" />
												</c:if>
											
												<!--  사진이 있을 때 이미지 슬라이더 -->
												<c:if test="${not empty files}">
	 						    					<c:forEach items="${files}" var="img">
			   											<img src="${pageContext.request.contextPath}/front/store/getByteImage.do?name=${img.sysName}&path=${img.path}" />
													</c:forEach>
												</c:if> 
											</div>
										</div>
									</div>
									<!-- 가게 리스트의 내용 부분 -->
					       			<div class="sto_li_content" >
										<div>
											<span>${s.categoryName}</span>
											<span class="sto_scope">
												<span class="scope_star">★</span>${s.scope}(${s.reviewCntTotal})
											</span>		
										</div>
										<div class="store_name">${s.storeName}</div>
										<div class="store_info">
											<div>가격대 : ${s.priceType}</div>
											<div>영업 시간 : ${s.openTime} ~ ${s.closeTime}</div>
											<div></div>
										</div>		
					       			</div>
									<input name="latitude" type="hidden" value="${s.latitude}" />
									<input name="longitude" type="hidden" value="${s.longitude}" />
					       		</li>
					       		<script>
					       				abs("${s.latitude}", "${s.longitude}", "${s.storeName}")
					       		</script>
					    	 </c:forEach>
					    </ul>
					</div>
					<%-- paging 영역 --%>
					<div id="storePageDiv">
						<ul class="stolist_pagination">
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
		<%-- <c:import url="/WEB-INF/jsp/include/footer.jsp" /> --%>
		<!-- // 푸터 -->

		<!-- 팝업 백그라운드  -->
		<div class="bgbox"></div>
	</div>
	<form id="searchStoreForm" method="post">
		<c:forEach var="city" items="${search.cities}">
			<input name="cities" type="hidden" value="${city}" />
		</c:forEach>
		<c:forEach var="price" items="${search.priceTypeNo}">
			<input name="priceTypeNo" type="hidden" value="${price}" />
		</c:forEach>

		<c:forEach var="category" items="${search.categoryCode}">
			<input name="categoryCode" type="hidden" value="${category}" />
		</c:forEach>
		<input name="keyword" type="hidden" value="${search.keyword}" />
		<input name="includeClosed" type="hidden" value="${search.includeClosed}" />
	</form>
 
	
 	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="<c:url value='/resources/js/storelist.js' />"></script>
	<script src="<c:url value='/resources/js/map_in_storelist.js' />"></script>
</body>
</html>





