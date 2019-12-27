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
	
	<h2 class="title">실시간 맛집 Rank 5</h2>
	<div>
	
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
	                    <!-- 
	                   	<c:if test="${!empty s.holidayList.size()}">
	                    <tr>
	                    	<th rowspan="s.holidayList.size()">휴무일</th>
	                    	<c:forEach var="sh" items="${s.holidayList}">
	                    	<td>${sh.weekName}</td>
	                    	</c:forEach>
	                    </tr>
                    	</c:if>
                    	 -->
	                </table>
	            </div>
	            <p><a href="${pageContext.request.contextPath}/front/store/storedetail.do?no=${s.storeNo}">자세히 보기</a></p>
	        </div>
	    </div>
	</c:forEach> 
</div>
	</section>
	<!-- 하드코딩 -->
	<section class="sc sc2 module main_popular_restaurant_wrap">
	  <h2 class="title">20대 여성의 맛집 리스트 TOP 10</h2>
	  <div class="slider-container popular_restaurant_container">
	    <ul class="list-restaurants main_popular_restaurant_list type-main">
	        <li class="restaurant-item">
	          <div class="popular_restaurant_inner_wrap">
	            <a href="/restaurants/qd5xOa1fKTwL" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:0,&quot;restaurant_key&quot;:&quot;qd5xOa1fKTwL&quot;})">
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
	            <a href="/restaurants/W2QDCNQSg04W" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:1,&quot;restaurant_key&quot;:&quot;W2QDCNQSg04W&quot;})">
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
	            <a href="/restaurants/bM06me2vkilL" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:2,&quot;restaurant_key&quot;:&quot;bM06me2vkilL&quot;})">
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
	            <a href="/restaurants/yhlhPzPw8P" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:3,&quot;restaurant_key&quot;:&quot;yhlhPzPw8P&quot;})">
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
	            <a href="/restaurants/FNkJuxSe93" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:4,&quot;restaurant_key&quot;:&quot;FNkJuxSe93&quot;})">
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
	            <a href="/restaurants/5rrztiq1lFC6" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:5,&quot;restaurant_key&quot;:&quot;5rrztiq1lFC6&quot;})">
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
	            <a href="/restaurants/JzzGPCu8j9AV" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:6,&quot;restaurant_key&quot;:&quot;JzzGPCu8j9AV&quot;})">
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
	            <a href="/restaurants/klODPVRK3D" onclick="trackEvent('CLICK_RESTAURANT', {&quot;section_position&quot;:2,&quot;section_title&quot;:&quot; &quot;,&quot;position&quot;:7,&quot;restaurant_key&quot;:&quot;klODPVRK3D&quot;})">
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
	
	<section class="sc sc3module main_popular_restaurant_wrap">
	  <h2 class="title">20대 남성의 맛집 리스트 TOP 10</h2>
	  <div class="slider-container popular_restaurant_container" style="
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