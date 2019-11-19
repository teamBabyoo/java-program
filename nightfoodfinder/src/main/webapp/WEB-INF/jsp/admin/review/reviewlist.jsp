<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/resources/css/admin/admin_style.css" />">


<style type="text/css">
/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.reComment {
	display: none
}
</style>


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
			<li class="member"><a href="#">회원관리</a></li>
			<li class="store"><a href="#">가게관리</a></li>
			<li class="review"><a href="#">리뷰관리</a>
				<ul>
					<li><a class="review_all" href="#">전체리뷰</a></li>
					<li><a class="review_report" href="#">신고리뷰</a></li>
				</ul></li>

			<!---------- 서치 ---------->
			<li>
				<div class="form-group row justify-content-center">
					<div class="w100" style="padding-right: 10px">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType">
							<c:choose>
								<c:when test="${pagination.type eq 'storeName'}">
									<option value="nickName">닉네임</option>
									<option value="storeName" selected>가게 이름</option>
								</c:when>
								<c:otherwise>
									<option value="nickName" selected>닉네임</option>
									<option value="storeName">가게 이름</option>
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
							onclick="location.href='/nightfoodfinder/admin/review/reviewlist.do'">검색취소</button>
					</div>
				</div>
			</li>
			<!---------- 서치 끝 --------->



			<!-- <li class="comments"><a href="#">Comments</a></li>
          <li class="users"><a href="#">Manage Users</a></li> -->
		</ul>
	</nav>

	<main role="main">

	<section class="panel ">
		<h2>Table</h2>
		<form id="chkblock">
		<table>
			<div>전체 : ${pagination.listCnt}개</div>
			<tr>
				<th>선택</th>
				<th>닉네임</th>
				<th>가게 이름</th>
				<th>리뷰</th>
				<th>댓글 단 날짜</th>
				<th>좋아요 횟수</th>
				<th>차단 여부</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
			
			<c:forEach var="list" items="${list}">
				<tr>
					<td><input type="checkbox" name="reviewNo" value="${list.reviewNo}"/></td>
					<td>${list.nickName}</td>
					<td>${list.storeName }</td>
					<td class="myBtn"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list.reviewContent }</td>
					<td>${list.regDate }</td>
					<td>${list.likeCount }</td>
					<td class="reComment">${list.reComment}</td>
					<td class="block">
						<c:choose>
						<c:when test="${list.status eq 0 }">
						정상
						</c:when>
						<c:otherwise>
						차단
						</c:otherwise>
					</c:choose>
					</td>
				</tr>
			</c:forEach>
		<div>
		<button type="button" onclick="block()">차단하기</button>
 		<button type="button" onclick="bk()">차단 풀기</button>  
		</div>
		</table>
	</form>

		<!------------ 페이징 ---------------->

		<div id="paginationBox">
			<ul class="pagination">
			<!-- 이전 버튼 -->
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
					</li>
				</c:if>
				
			<!-- 페이지 버튼 -->
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}')">${idx}</a>
					</li>
				</c:forEach>

			<!-- 다음 버튼 -->
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>

		<!------------ 페이징 끝----------------->


		<!----------- 모달팝업 ----------------->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<p></p>
				<p></p>
			</div>

		</div>
		<!----------- 모달팝업 끝 ---------------->


	</section>

	</main>
	
			<script>
		
			// -------------- 모달팝업 ---------------------
			// 모달 가져온다.
			var modal = document.getElementById('myModal');

			// 모달 여는 버튼을 가져온다.
			var btn = document.getElementsByClassName("myBtn");

			// 모달을 닫는 <span>을 가져온다.
			var span = document.getElementsByClassName("close")[0];

			// 버튼을 클릭했을 때, 모달을 연다.
			// 그런데, 모달팝업이 첫 리스트 줄에만 적용되고 반복되어서 나오는 리스트들에는 적용이 안되었음..
			// 이렇게 해야 모든 리스트에 적용된다.	(reComment의 css 수정함)
			for (let i = 0; i < btn.length; i++) {
				btn[i].onclick = function(e) {
					let reComment = $(e.target).siblings(".reComment").text();
					if (reComment.length < 1) {
						reComment = "사장님 리뷰가 없습니다.";
					} else {
						reComment = "사장님 리뷰 : " + reComment;
					}

					modal.style.display = "block";
					$(".modal-content p:eq(0)").text(
							"리뷰 : " + $(e.target).text())
					$(".modal-content p:eq(1)").text(reComment)
				}
			}

			// <span>의 x를 클릭했을 때, 모달을 닫는다.
			span.onclick = function() {
				modal.style.display = "none";
			}
			// 모달 밖의 아무 곳을 클릭했을 때, 모달을 닫는다.
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}

			//-------------- 서치 ----------------
			$(document)
					.on(
						'click',
						'#btnSearch',
						function(e) {
							e.preventDefault();
							var url = "${pageContext.request.contextPath}/admin/review/reviewlist.do";
							url = url + "?searchType=" + $('#searchType option:selected').val();
							url = url + "&keyword=" + $('#keyword').val();
							location.href = url;
						});

			
			
			//------------ 페이징 -------------

			//이전 버튼 이벤트
			function fn_prev(page, range, rangeSize) {
				var page = ((range - 2) * rangeSize) + 1;
				var range = range - 1;
				var url = "${pageContext.request.contextPath}/admin/review/reviewlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&searchType=" + $('#searchType option:selected').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			}

			//페이지 번호 클릭
			function fn_pagination(page, range) {
				var url = "${pageContext.request.contextPath}/admin/review/reviewlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&searchType=" + $('#searchType option:selected').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			}

			//다음 버튼 이벤트
			function fn_next(page, range, rangeSize) {
				var page = parseInt((range * rangeSize)) + 1;
				var range = parseInt(range) + 1;
				var url = "${pageContext.request.contextPath}/admin/review/reviewlist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&searchType=" + $('#searchType option:selected').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
			}
			
			// ------------------- 체크박스 차단(업데이트) -----------------
			
			function block() {
				let cnt = 0;
				let chk = document.querySelectorAll("input[name='reviewNo']");
				for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) cnt++
				}
				if (cnt == 0) {
					alert("차단할 리뷰를 선택하세요.");
					return;
				}
				// ?????????????????????????
				let c = document.getElementById("chkblock");			
				c.action = "${pageContext.request.contextPath}/admin/review/block.do";
				c.submit();
			}
			
			
			function bk() {
				let cnt = 0;
				let chk = document.querySelectorAll("input[name='reviewNo']");
				for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) cnt++
				}
				if (cnt == 0) {
					alert("차단할 리뷰를 선택하세요.");
					return;
				}
				
				//????????????????????????????
				let c = document.getElementById("chkblock");
				var url = "${pageContext.request.contextPath}/admin/review/block.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				url = url + "&status=" + 0;
				url = url + "&searchType=" + $('#searchType option:selected').val();
				c.action = url + "&keyword=" + $('#keyword').val();
				c.submit();
			}
			
		</script>
	<footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>