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
    
    <!-- 컨텐트  -->
	<div class="content clearboth">
	<c:forEach var="s" items="${sList}" varStatus="status">
<%-- 	<h2>${s.storeName }</h2> --%>
	
		<%-- <h2>사이즈 : ${sList.size()}</h2> --%>
		<c:choose>
		<c:when test="${sList[status.count].storeName != null}">
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
		</c:when>
		<c:otherwise>
		<%-- <div class="store store_${status.count}">
	        <div class="desc">
	        	비어있음
	        </div>
	    </div> --%>
		</c:otherwise>
		</c:choose>
	</c:forEach> 
<!-- 	
	    <div class="store store_1st">
	        <div class="square_box">
	            <div class="desc">
	                <dl>
	                    <dt>이치에</dt>
	                    <dd>4.7</dd>
	                </dl>
	                <table>
	                    <tr>
	                        <th>주소</th>
	                        <td>서울시 강남구 신사동 656-7</td >
	                    </tr>
	                    <tr>
	                        <th rowspan="3">영업시간</th>
	                        <td>월</td>
	                        <td>10:30~00:00</td>
	                    </tr>
	                    <tr>
	                        <td>화~토</td>
	                        <td>00:00~24:00</td>
	                    </tr>
	                    <tr>
	                        <td>일</td>
	                        <td>00:00~22:00</td>
	                    </tr>
	                </table>
	            </div>
	            <p><a href="#">자세히 보기</a></p>
	        </div>
	    </div>
	
	    <div class="store store_2nd">
	        <div class="square_box">
	            <div class="desc">
	                <dl>
	                    <dt>이치에</dt>
	                    <dd>4.7</dd>
	                </dl>
	                <i>서울시 강남구 신사동 640-13</i>
	            </div>
	            <p><a href="#">자세히 보기</a></p>
	        </div>
	    </div>
	
	    <div class="store store_3rd">
	        <div class="desc">
	    
	        </div>
	    </div>
	
	    <div class="store store_4th">
	        <div class="desc">
	        </div>
	    </div>      
	
	    <div class="store store_5th">
	        <div class="desc">
	        </div>
	    </div>
-->
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