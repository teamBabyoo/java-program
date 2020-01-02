<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%
	int main_no = 0;
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/WEB-INF/jsp/include/head.jsp">
    	<c:param name="msg" value="메인"/>
    </c:import>
</head>
<body>
  <div class="wrapper main_wrap">
  	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
    <!-- 비주얼 컨텐트 -->
    <div class="v_content">
    	<div class="dot_bg">
	    	<div class="textbox">
	    		<p class="title">솔직한 리뷰, 내 주변 맛집!</p>
	    		<br />
	    		<h1 class="title">심야식당</h1>
	    	</div>
    	</div>
    	<img src="${pageContext.request.contextPath}/resources/images/0776fea76b4a824ff583128cb51dd45c.jpg">
    </div>
    <!-- // 비주얼 컨텐트 -->
    <!-- 컨텐트  -->
	<div class="content clearboth">
	
	<section class="sc sc1">
	
	<div class="inner">
			<h2 class="title">실시간 맛집 Rank 5</h2>
		<div>
		
		<c:forEach var="s" items="${sList}" varStatus="status">
			<div class="cover-center-center store store_${status.count}" style="background-image: url('${pageContext.request.contextPath}/front/store/getByteImage.do?name=${s.sysName}&path=${s.path}')">
<%-- 		<div class="cover-center-center store store_${status.count}"> --%>
		        <div class="square_box">
		            <div class="desc">
		                <dl>
		                    <dt>${s.storeName}</dt>
		                    <dd>
		                    	<fmt:formatNumber value="${s.storeScopeTotal / s.reviewCntTotal}" pattern="0.0" />
		                    </dd>
		                </dl>
		                <table>
		                    <tr>
		                        <th>주소</th>
		                        <td>${s.city}</td>
		                    </tr>
		                    <tr>
		                        <th>영업시간</th>
		                        <td>${s.openTime} ~ ${s.closeTime}</td>
		                    </tr>
		                    <c:choose>
		                    <c:when test="${!empty s.holidayList}">
		                    <tr>
		                    	<th rowspan="s.holidayList.size()">휴무일</th>
		                    	<c:forEach var="sh" items="${s.holidayList}">
		                    	<td>${sh.weekName}</td>
		                    	</c:forEach>
		                    </tr>
		                    </c:when>	
		                    <c:otherwise>
		                    	<tr>
		                    	<td>연중무휴</td>
		                    	</tr>
		                    </c:otherwise>                    
		                    </c:choose>
		                </table>
		            </div>
		            <p><a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${s.storeNo}">자세히 보기</a></p>
		        </div>
		    </div>
		</c:forEach> 
	</div>
	</div>
	</section>
	
	<section class="sc sc_yt">
		<div class="inner">
			<iframe src="https://www.youtube.com/embed/0T9_T5gq5GI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
	</section>
	<%-- 
	<!-- 하드코딩 -->
	<section class="sc sc2 module main_popular_restaurant_wrap">
	<div class="inner">
		<h2 class="title">20대 여성의 맛집 리스트 TOP 10</h2>
		<div class="popular_restaurant_container">
	    <ul class="list-restaurants main_popular_restaurant_list type-main">
	    <c:forEach var="awd" items="${aList}">
	    <c:if test="${awd.status == 1}">
			<li class="restaurant-item">
				<div class="popular_restaurant_inner_wrap">
					<a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${awd.storeNo}">
					<c:choose>
						<c:when test="${awd.sysName == null}">
						<div class="thumb cover-center-center" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80')">
		                </div>
						</c:when>
						<c:otherwise>
						<div class="thumb cover-center-center" style="background-image: url('${pageContext.request.contextPath}/front/store/getByteImage.do?name=${awd.sysName}&path=${awd.path}')">
	                	</div>
						</c:otherwise>
					</c:choose>
					<div class="info">
						<em class="category">${awd.category}</em><br />
	                    <span class="title">${awd.storeName}</span>
	                    <strong class="point search_point expected"><fmt:formatNumber value="${awd.storeScopeTotal / awd.reviewCntTotal}" pattern="0.0" /></strong>
	                    <p class="etc">
	                    	<c:choose>
	                    	<c:when test="${Integer.parseInt(awd.priceTypeNo) == 1}">
	                    	1만원 미만
	                    	</c:when>
	                    	<c:when test="${Integer.parseInt(awd.priceTypeNo) == 2}">
	                    	1만원대
	                    	</c:when>
	                    	<c:when test="${Integer.parseInt(awd.priceTypeNo) == 3}">
	                    	2만원대
	                    	</c:when>
	                    	<c:otherwise>
	                    	3만원 이상
	                    	</c:otherwise>
	                    	</c:choose>
	                    </p>
					</div>
					</a>
	          </div>
	        </li>
        </c:if>
	    </c:forEach>
	    </ul>
		</div>
	</div>
	</section>
	
	<section class="sc sc3 module main_popular_restaurant_wrap">
	<div class="inner">
	  <h2 class="title">20대 남성의 맛집 리스트 TOP 10</h2>
	  <div class="popular_restaurant_container" style="
	    color: #dbdbdb;
	">
	    <ul class="list-restaurants main_popular_restaurant_list type-main">
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/NjGScx24nD" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;NjGScx24nD&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="태평소국밥 사진 - 대전시 유성구 봉명동 676-3" data-original="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/47875_1470120449446390.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/47875_1470120449446390.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">태평소국밥</span>
	                    <strong class="point search_point ">4.4</strong>
	                    <p class="etc">
	                      대전 유성구 -
	                      탕 / 찌개 / 전골
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/PzI0ZmOKv54M" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:1,&quot;restaurant_key&quot;:&quot;PzI0ZmOKv54M&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="진미한우곱창 사진 - 서울시 강동구 길동 381-11" data-original="https://mp-seoul-image-production-s3.mangoplate.com/652296_1518003441714792.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/652296_1518003441714792.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">진미한우곱창</span>
	                    <strong class="point search_point ">4.3</strong>
	                    <p class="etc">
	                      강동구 -
	                      고기 요리
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/-G-YWwpe9D" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:2,&quot;restaurant_key&quot;:&quot;-G-YWwpe9D&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="명봉샤브샤브양꼬치 사진 - 서울시 광진구 자양동 4-1" data-original="https://mp-seoul-image-production-s3.mangoplate.com/984760_1559453236500092.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/984760_1559453236500092.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">명봉샤브샤브양꼬치</span>
	                    <strong class="point search_point ">4.4</strong>
	                    <p class="etc">
	                      건대/군자/광진 -
	                      기타 중식
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/ezYqeGHlXFi1" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:3,&quot;restaurant_key&quot;:&quot;ezYqeGHlXFi1&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="궤도에오르다 사진 - 서울시 광진구 화양동 499-1" data-original="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/453572_1451634279088.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/453572_1451634279088.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">궤도에오르다</span>
	                    <strong class="point search_point ">4.3</strong>
	                    <p class="etc">
	                      건대/군자/광진 -
	                      기타 한식
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/4DorjGbv9N96" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:4,&quot;restaurant_key&quot;:&quot;4DorjGbv9N96&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="트렌치타운 사진 - 서울시 용산구 이태원동 99-14" data-original="https://mp-seoul-image-production-s3.mangoplate.com/291522/793340_1512214826907_16926?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/291522/793340_1512214826907_16926?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">트렌치타운</span>
	                    <strong class="point search_point ">4.5</strong>
	                    <p class="etc">
	                      이태원/한남동 -
	                      다국적 퓨전
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/KV9lSGa6xNQp" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:5,&quot;restaurant_key&quot;:&quot;KV9lSGa6xNQp&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="후니도니 사진 - 서울시 종로구 종로1가 24" data-original="https://mp-seoul-image-production-s3.mangoplate.com/241997/479673_1455261864328_24445?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/241997/479673_1455261864328_24445?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">후니도니</span>
	                    <strong class="point search_point ">4.4</strong>
	                    <p class="etc">
	                      광화문 -
	                      까스 요리
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/SFSYvKg3K8eH" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:6,&quot;restaurant_key&quot;:&quot;SFSYvKg3K8eH&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="스시올로지 사진 - 서울시 마포구 연남동 228-3" data-original="https://mp-seoul-image-production-s3.mangoplate.com/741327_1503813134247707.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/741327_1503813134247707.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">스시올로지</span>
	                    <strong class="point search_point ">4.5</strong>
	                    <p class="etc">
	                      연남동 -
	                      회 / 스시
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/a31mbFg680OL" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:5,&quot;section_title&quot;:&quot;평점이 높은 인기 식당&quot;,&quot;position&quot;:7,&quot;restaurant_key&quot;:&quot;a31mbFg680OL&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                  <img class="center-croping lazy" alt="장프리고 사진 - 서울시 중구 광희동2가 296" data-original="https://mp-seoul-image-production-s3.mangoplate.com/162581_1498838485703173.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/162581_1498838485703173.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">장프리고</span>
	                    <strong class="point search_point ">4.4</strong>
	                    <p class="etc">
	                      중구 -
	                      칵테일 / 와인
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	    </ul>
	  </div>
	</div>
	</section>
	
	<!-- // 하드코딩 -->
	 --%>
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