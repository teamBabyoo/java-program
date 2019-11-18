<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="clearboth">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/resources/images/mangoplate-logo-horizontal.svg" alt="anff 로고" />
    </div>
    <div class="search">
      <form action="">
        <input type="text" id="keyword"/>
        <div class="icon_w"><i class="fa fa-search" aria-hidden="true"></i></div>
        <div class="optionBox hidden">
          <ul class="optionTab clearboth">
            <li class="on">분류</li>
            <li>위치</li>
            <li>가격대</li>
          </ul>
          <div class="select clearboth tab_1">
         	<c:forEach items="${cateList}" var="t">
         		<c:out value="cc" /> ${t.no}
         	</c:forEach>
            <div>
              <label for="foodtype_1">한식</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">분식</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">양식</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">알식</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">중식</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>
          </div>
          <!-- tab_1 -->
          <div class="select clearboth tab_2 hidden">
            <div>
              <label for="foodtype_1">마포구</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">영등포구</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">용산구</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">성동구</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">서초구</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>

          </div>
          <!-- tab_2 -->
          <div class="select clearboth tab_3 hidden">
            <div>
              <label for="foodtype_1">1만원 미만</label>
              <input id="foodtype_1" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_2">1만원대</label>
              <input id="foodtype_2" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_3">2만원대</label>
              <input id="foodtype_3" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="foodtype_4">3만원대</label>
              <input id="foodtype_4" type="checkbox" class="hidden" />
            </div>

            <div>
              <label for="checkedtype_1">4만원 이상</label>
              <input id="checkedtype_1" type="checkbox" class="hidden" />
            </div>

          </div>
          <!-- tab_3 -->

          <div class="userselect">
              <div>
                <label for="checkedtype_2">중식<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="checkedtype_2" type="checkbox" checked class="hidden" />
              </div>
  
              <div>
                <label for="foodtype_5">서초구<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="foodtype_5" type="checkbox" checked class="hidden" />
                
              </div>
              <div>
                <label for="checkedtype_3">3만원대<i class="fa fa-times" aria-hidden="true"></i></label>
                <input id="checkedtype_3" type="checkbox" checked class="hidden" />
              </div>
            </div>
            <!-- userselect-->
        </div>
      </form>
    </div>
    <div class="float_r">
      <ul>
        <li><a href="#">내주변맛집</a></li>
        <li><a href="#">NFF Awards</a></li>
        <li><i class="fa fa-bell-o" aria-hidden="true"></i></li>
        <li><i class="fa fa-user-o" aria-hidden="true"></i></li>

      </ul>
    </div>
  </header>