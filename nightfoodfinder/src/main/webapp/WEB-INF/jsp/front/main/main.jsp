<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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