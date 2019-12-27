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
	<c:forEach var="s" items="${sList}" varStatus="status">
<!-- <h2>${s.storeName }</h2>
	<h2>사이즈 : ${sList.size()}</h2> -->
		<div class="store store_${status.count}">
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
	                   	<c:if test="${!empty s.holidayList.size()}">
	                    <tr>
	                    	<th rowspan="s.holidayList.size()">휴무일</th>
	                    	<c:forEach var="sh" items="${s.holidayList}">
	                    	<td>${sh.weekName}</td>
	                    	</c:forEach>
	                    </tr>
                    	</c:if>
	                </table>
	            </div>
	            <p><a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${s.storeNo}">자세히 보기</a></p>
	        </div>
	    </div>
	</c:forEach> 


	<!-- 하드코딩 -->
	<section class="module main_popular_restaurant_wrap">
	  <h2 class="title">EAT딜을 판매중인 식당</h2>
	  <div class="slider-container popular_restaurant_container">
	    <ul class="list-restaurants main_popular_restaurant_list type-main">
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/qd5xOa1fKTwL" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;qd5xOa1fKTwL&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="JVL부대찌개 사진 - 서울시 강동구 천호동 425-5" data-original="https://mp-seoul-image-production-s3.mangoplate.com/397183/6sjwmehkezpuqt.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/397183/6sjwmehkezpuqt.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">JVL부대찌개</span>
	                    <strong class="point search_point expected"></strong>
	                    <p class="etc">
	                      강동구 -
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
	            <a href="/restaurants/W2QDCNQSg04W" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:1,&quot;restaurant_key&quot;:&quot;W2QDCNQSg04W&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="딜라이트 사진 - 서울시 강남구 역삼동 649" data-original="https://mp-seoul-image-production-s3.mangoplate.com/396620/9ut9b2w2uztsjx.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/396620/9ut9b2w2uztsjx.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">딜라이트</span>
	                    <strong class="point search_point expected"></strong>
	                    <p class="etc">
	                      강남역 -
	                      베이커리
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/bM06me2vkilL" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:2,&quot;restaurant_key&quot;:&quot;bM06me2vkilL&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="어반플랜트 사진 - 부산시 해운대구 중동 1153-8" data-original="https://mp-seoul-image-production-s3.mangoplate.com/1462612_1567748874340730.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/1462612_1567748874340730.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">어반플랜트</span>
	                    <strong class="point search_point expected"></strong>
	                    <p class="etc">
	                      부산 해운대구 -
	                      브런치 / 버거 / 샌드위치
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/yhlhPzPw8P" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:3,&quot;restaurant_key&quot;:&quot;yhlhPzPw8P&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="아방뮤제 사진 - 서울시 용산구 한남동 739-20" data-original="https://mp-seoul-image-production-s3.mangoplate.com/194241/pl2jo8rtsnwpm8.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/194241/pl2jo8rtsnwpm8.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">아방뮤제</span>
	                    <strong class="point search_point ">4.3</strong>
	                    <p class="etc">
	                      이태원/한남동 -
	                      스테이크 / 바베큐
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/FNkJuxSe93" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:4,&quot;restaurant_key&quot;:&quot;FNkJuxSe93&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="르지우 사진 - 서울시 서초구 반포동 91-3" data-original="https://mp-seoul-image-production-s3.mangoplate.com/78005/271468_1437922058377116709?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/78005/271468_1437922058377116709?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">르지우</span>
	                    <strong class="point search_point expected">3.7</strong>
	                    <p class="etc">
	                      서래마을 -
	                      이탈리안
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/5rrztiq1lFC6" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:5,&quot;restaurant_key&quot;:&quot;5rrztiq1lFC6&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="라뜰리에르지우 사진 - 서울시 송파구 신천동 29" data-original="https://mp-seoul-image-production-s3.mangoplate.com/405999/vg-xphnwxhbibi.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/405999/vg-xphnwxhbibi.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">라뜰리에르지우</span>
	                    <strong class="point search_point expected"></strong>
	                    <p class="etc">
	                      송파/가락 -
	                      이탈리안
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/JzzGPCu8j9AV" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:6,&quot;restaurant_key&quot;:&quot;JzzGPCu8j9AV&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="연남주막1987 사진 - 서울시 마포구 동교동 152-15" data-original="https://mp-seoul-image-production-s3.mangoplate.com/925209_1571241916051945.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/925209_1571241916051945.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">연남주막1987</span>
	                    <strong class="point search_point expected">3.3</strong>
	                    <p class="etc">
	                      연남동 -
	                      전통 주점 / 포차
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/klODPVRK3D" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot;EAT딜을 판매중인 식당&quot;,&quot;position&quot;:7,&quot;restaurant_key&quot;:&quot;klODPVRK3D&quot;})">
	              <figure class="restaurant-item">
	                <div class="thumb">
	                    <i class="featured_badge" style="background-image: url('https://mp-seoul-image-production-s3.mangoplate.com/badge_pictures/r-i0n1w_hdfo4vlf.png')"></i>
	                  <img class="center-croping lazy" alt="1984 사진 - 서울시 마포구 동교동 158-24" data-original="https://mp-seoul-image-production-s3.mangoplate.com/195109/64f3op5s5cdf-i.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" data-error="https://mp-seoul-image-production-s3.mangoplate.com/web/resources/kssf5eveeva_xlmy.jpg?fit=around|*:*&amp;crop=*:*;*,*&amp;output-format=jpg&amp;output-quality=80" src="https://mp-seoul-image-production-s3.mangoplate.com/195109/64f3op5s5cdf-i.jpg?fit=around|362:362&amp;crop=362:362;*,*&amp;output-format=jpg&amp;output-quality=80" style="display: block;">
	                </div>
	                <figcaption>
	                  <div class="info">
	                    <span class="title">1984</span>
	                    <strong class="point search_point ">4.1</strong>
	                    <p class="etc">
	                      홍대 -
	                      카페 / 디저트
	                    </p>
	                  </div>
	                </figcaption>
	              </figure>
	            </a>
	          </div>
	        </li>
	    </ul>
	  </div>
	</section>
	
	<!-- // 하드코딩 -->
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