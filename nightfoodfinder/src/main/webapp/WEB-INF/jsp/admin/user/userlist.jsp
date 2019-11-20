<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>       
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/admin_style.css" />">
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
    <header role="banner">
        <h1>Admin Panel</h1>
        <ul class="utilities">
          <li class="users"><a href="#">My Account</a></li>
          <li class="logout warn"><a href="">Log Out</a></li>
        </ul>
      </header>
      
      <nav role="navigation">
        <ul class="main">
          <li class="member"><a href="${pageContext.request.contextPath}/admin/user/userlist.do">회원관리</a></li>
          <li class="store"><a href="${pageContext.request.contextPath}/admin/store/storelist.do">가게관리</a></li>
          <li class="review"><a>리뷰관리</a>
            <ul>
                <li><a class="review_all" href="${pageContext.request.contextPath}/admin/review/reviewlist.do">전체리뷰</a></li>
                <li><a class="review_report" href="reviewlist.do">신고리뷰</a></li>
            </ul>
        </li>
        
        	<!-- search -->
			<li>
				<div class="form-group row justify-content-center">

					<div class="w100" style="padding-right: 10px">

						<select class="form-control form-control-sm" name="searchType"
							id="searchType">
							<c:choose>
								<c:when test="${pagination.type eq 'userEmail'}">
									<option value="nickName">닉네임</option>
									<option value="userEmail" selected>아이디</option>
								</c:when>
								<c:otherwise>
									<option value="nickName" selected>닉네임</option>
									<option value="userEmail">아이디</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
					<div class="w300" style="padding-right: 10px">
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword" value="${pagination.keyword}">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>
						<button class="back" name="backList" id="backList"
							onclick="location.href='/nightfoodfinder/admin/user/userlist.do'">검색취소</button>
					</div>
				</div>
			</li>
			<!-- search -->
        
        
          <!-- <li class="comments"><a href="#">Comments</a></li>
          <li class="users"><a href="#">Manage Users</a></li> -->
        </ul>
      </nav>
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>Table</h2>
          <table>
          <div>전체 : ${pagination.listCnt}개</div>
            <tr>
              <th>아이디</th>
              <th>닉네임</th>
              <th>가입날짜</th>
              <th>리뷰수</th>
            </tr>
            <c:if test="${empty list}">
            	<tr>
					<td colspan="5">가입 회원이 없습니다.</td>
				</tr>				
			</c:if>
			<c:forEach var="b" items="${list}">
				<tr>
					<td><a>${b.userEmail}</a></td>
					<td><a>${b.nickName}</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.joinDate}"  /></td>
					<td>${b.reviewCnt}개</td>
				</tr>
				</c:forEach>
          </table>
          
          <!-- 페이징 -->

		<div id="paginationBox">
			<ul class="pagination">
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">
							Previous</a></li>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li
						class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
							${idx} </a>
					</li>

				</c:forEach>

				<c:if test="${pagination.next}">

					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', 
					'${pagination.range}', '${pagination.rangeSize}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>

		<!-- 페이징 -->
		
		<script>
          // 서치
			$(document)
					.on(
							'click',
							'#btnSearch',
							function(e) {
								e.preventDefault();
								var url = "${pageContext.request.contextPath}/admin/user/userlist.do";
								url = url + "?searchType="
										+ $('#searchType option:selected').val();
								url = url + "&keyword=" + $('#keyword').val();
								location.href = url;
							});

			// 페이징

			//이전 버튼 이벤트
			function fn_prev(page, range, rangeSize) {
				var page = ((range - 2) * rangeSize) + 1;
				var range = range - 1;
				var url = "${pageContext.request.contextPath}/admin/user/userlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				location.href = url;
			}

			//페이지 번호 클릭
			function fn_pagination(page, range, rangeSize) {
				var url = "${pageContext.request.contextPath}/admin/user/userlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&searchType="
						+ $('#searchType option:selected').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			}

			//다음 버튼 이벤트
			function fn_next(page, range, rangeSize) {
				var page = parseInt((range * rangeSize)) + 1;
				var range = parseInt(range) + 1;
				var url = "${pageContext.request.contextPath}/admin/user/userlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				location.href = url;
			}
		</script>
          
        </section>
      
      </main>
      <footer role="contentinfo"></footer>
</body>
</html>