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
	margin: 5% auto; /* 15% from the top and centered */
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

.ahide {
	display: none;
	width: 0%;
}
.tg {
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #ccc;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #fff;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 10px 5px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-color: #ccc;
	color: #333;
	background-color: #f0f0f0;
}

.tg .tg-cly1 {
	text-align: left;
	vertical-align: middle
}

.tg .tg-0lax {
	text-align: left;
	vertical-align: top
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
			<!-- <li class="comments"><a href="#">Comments</a></li>
          <li class="users"><a href="#">Manage Users</a></li> -->
		</ul>
	</nav>

	<main role="main">


	<section class="panel ">
		<h2>Table</h2>
		<table>
			<tr>
				<th>가게이름</th>
				<th>가게분류</th>
				<th>대표자이름</th>
				<th>사업자번호</th>
				<th>상태</th>
			</tr>
			<c:if test="${empty slist}">
				<tr>
					<td colspan="5">게시물이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="b" items="${slist}">
				<tr>
					<td class="myBtn">${b.storeName}</a></td>
					<td id="categoryName">${b.categoryName}</a></td>
					<td id="storeOwner">${b.storeOwner}</a></td>
					<td id="businessNum">${b.businessNum}</a></td>
					<td><c:choose>
							<c:when test="${b.status == 0}">
								<span class="statusbutton"><a
									href="storestatus.do?no=${b.storeNo}">승인 대기</a></span>
							</c:when>
							<c:when test="${b.status == 1}">
								<span class="statusbutton"><a href="">승인 완료</a></span>
							</c:when>
							<c:otherwise>
								<span class="statusbutton"><a href="">활동 정지</a></span>
							</c:otherwise>
						</c:choose></td>
					<td class="ahide" id="storeEmail">${b.storeEmail}
					<td>
					<td class="ahide" id="storeTell">${b.storeTell}
					<td>
					<td class="ahide" id="streetLoad">${b.streetLoad}
					<td>
					<td class="ahide" id="time">${b.openTime}~${b.closeTime}
					<td>
					<td class="ahide" id="storeOwnerPh">${b.storeOwnerPh}
					<td>
				</tr>
			</c:forEach>
		</table>
		<!-- The Modal -->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
		
				<table class="tg">
					<tr>
						<th class="tg-cly1">가게 이름</th>
						<td class="tg-cly1"></td>
					</tr>
					<tr>
						<th class="tg-cly1">가게 이메일</th>
						<td class="tg-cly1"></td>
					</tr>
					<tr>
						<th class="tg-cly1">가게 전화번호</th>
						<td class="tg-cly1"></td>
					</tr>
					<tr>
						<th class="tg-cly1">가게 주소</th>
						<td class="tg-cly1"></td>
					</tr>
					<tr>
						<th class="tg-0lax">영업 시간</th>
						<td class="tg-0lax"></td>
					</tr>
					<tr>
						<th class="tg-0lax">분류</th>
						<td class="tg-0lax"></td>
					</tr>
					<tr>
						<th class="tg-0lax">사업자 등록번호</th>
						<td class="tg-0lax"></td>
					</tr>
					<tr>
						<th class="tg-0lax">대표자 이름</th>
						<td class="tg-0lax"></td>
					</tr>
					<tr>
						<th class="tg-0lax">대표자 연락처</th>
						<td class="tg-0lax"></td>
					</tr>
				</table>
			</div>

		</div>

		<script>
			// 모달팝업
			// Get the modal
			var modal = document.getElementById('myModal');
			// Get the button that opens the modal
			var btn = document.getElementsByClassName("myBtn");
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			// When the user clicks on the button, open the modal 
			for (let i = 0; i < btn.length; i++) {
				btn[i].onclick = function(e) {
					let storeEmail = $(e.target).siblings("#storeEmail").text();
					let storeTell = $(e.target).siblings("#storeTell").text();
					let streetLoad = $(e.target).siblings("#streetLoad").text();
					let time = $(e.target).siblings("#time").text();
					let categoryName = $(e.target).siblings("#categoryName").text();
					let businessNum = $(e.target).siblings("#businessNum").text();
					let storeOwner = $(e.target).siblings("#storeOwner").text();
					let storeOwnerPh = $(e.target).siblings("#storeOwnerPh").text();

					modal.style.display = "block";
					$(".tg td:eq(0)").text(
							$(e.target).text())
					$(".tg td:eq(1)").text(storeEmail)
					$(".tg td:eq(2)").text(storeTell)
					$(".tg td:eq(3)").text(streetLoad)
					$(".tg td:eq(4)").text(time)
					$(".tg td:eq(5)").text(categoryName)
					$(".tg td:eq(6)").text(businessNum)
					$(".tg td:eq(7)").text(storeOwner)
					$(".tg td:eq(8)").text(storeOwnerPh)
				}
			}
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}
		</script>
	</section>
	</main>
	<footer role="contentinfo"></footer>
</body>
</html>