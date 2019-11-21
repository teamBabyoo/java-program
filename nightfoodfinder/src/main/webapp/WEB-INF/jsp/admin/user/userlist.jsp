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
              <th>선택</th>
              <th>아이디</th>
              <th>닉네임</th>
              <th>가입날짜</th>
              <th>리뷰수</th>
              <th>유저 타입</th>
            </tr>
            <c:if test="${empty list}">
            	<tr>
					<td colspan="6">가입 회원이 없습니다.</td>
				</tr>				
			</c:if>
			<c:forEach var="b" items="${list}">
				<tr>
					<td><input type="checkbox" id="myCheckboxid" name="userNo" data-userNo="${b.userNo}"/></td>
					<td><a>${b.userEmail}</a></td>
					<td><a>${b.nickName}</a></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${b.joinDate}"  /></td>
					<td>${b.reviewCnt}개</td>
					<td class="usertype"><c:choose>
							<c:when test="${b.userType == 0}">
								관리자
							</c:when>
							<c:when test="${b.userType == 1}">
								유저
							</c:when>
							<c:otherwise>
								탈퇴
							</c:otherwise>
						</c:choose></td>
				</tr>
				</c:forEach>
         <div>
		<button type="button" id="withdraw" onclick="withdraw()">강제 탈퇴</button>
 		<button type="button" id="cancel" onclick="cancel()">탈퇴 취소</button>  
		</div>
		</table>
		
		<script>
		function withdraw() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='userNo']");
			for (let i = 0; i < chk.length; i++) {
				if (chk[i].checked) {cnt++;
				let withdraw = $(chk[i]).parent().parent().find(".usertype").text("탈퇴");}
			}
			if (cnt == 0) {
				alert("강제 탈퇴할 유저를 선택하세요.");
				return;
			}
			
		
			// userNoArr을 userType=2&userList=1&userList=3 이런식으로 만들기 위해서
			var userNoArr = new Array();
			userNoArr.push("userType=2");	// 고정된 값이어서 미리 푸쉬
			$("input[name='userNo']:checked").each(function(){	// each : j쿼리의 반복문
				userNoArr.push("userNoList=" + $(this).attr("data-userNo"));
			});
			console.log(userNoArr.join("&"));
			userNoArr = userNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/user/withdraw.do",
				type: "POST",
				data: userNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/user/userlist.do";
				}
			});

			 for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) 
					$(chk[i]).prop('checked', false);
				}	
		}
		function cancel() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='userNo']");
			for (let i = 0; i < chk.length; i++) {
				if (chk[i].checked) {cnt++;
				let cancel = $(chk[i]).parent().parent().find(".usertype").text("유저");}
			}
			if (cnt == 0) {
				alert("강제 탈퇴할 유저를 선택하세요.");
				return;
			}
			
		
			// userNoArr을 userType=2&userList=1&userList=3 이런식으로 만들기 위해서
			var userNoArr = new Array();
			userNoArr.push("userType=1");	// 고정된 값이어서 미리 푸쉬
			$("input[name='userNo']:checked").each(function(){	// each : j쿼리의 반복문
				userNoArr.push("userNoList=" + $(this).attr("data-userNo"));
			});
			console.log(userNoArr.join("&"));
			userNoArr = userNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/user/withdraw.do",
				type: "POST",
				data: userNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/user/userlist.do";
				}
			});

			 for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) 
					$(chk[i]).prop('checked', false);
				}	
		}
		
		</script>
          
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