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

.reComment{
	display:none
}
</style>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				
			<!-- search -->
			<li>
				<div class="form-group row justify-content-center">

					<div class="w100" style="padding-right: 10px">

						<select class="form-control form-control-sm" name="searchType"
							id="searchType">

							<option value="nickName">닉네임</option>
							<option value="storeName">가게 이름</option>
						</select>
					</div>
					<div class="w300" style="padding-right: 10px">
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword">
					</div>
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>
						<button class="back" name="backList"
							id="backList" onclick="location.href='/nightfoodfinder/admin/review/reviewlist.do'">검색취소</button>
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
			<div>전체 : ${list.size()}개</div>
			<tr>
				<th>닉네임</th>
				<th>가게 이름</th>
				<th>리뷰</th>
				<th>댓글 단 날짜</th>
				<th>좋아요 횟수</th>

			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.nickName}</td>
					<td>${list.storeName }</td>
					<td class="myBtn"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list.reviewContent }</td>
					<td>${list.regDate }
					<td>${list.likeCount }</td>
					<td class="reComment">${list.reComment}<td>
				</tr>
			</c:forEach>
		</table>

				<!-- The Modal -->
				<div id="myModal" class="modal">
					<!-- Modal content -->
					<div class="modal-content">
						<span class="close">&times;</span>
						<p></p>
						<p></p>
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
			for(let i = 0; i < btn.length; i++){				
				btn[i].onclick = function(e) {
					let reComment = $(e.target).siblings(".reComment").text();
					if(reComment.length < 1){
						reComment = "사장님 리뷰가 없습니다.";
					} else {
						reComment = "사장님 리뷰 : " + reComment;
					}
					
					modal.style.display = "block";
					$(".modal-content p:eq(0)").text("리뷰 : " + $(e.target).text())
					$(".modal-content p:eq(1)").text(reComment)
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
			
			
			
		// 서치
			$(document).on('click', '#btnSearch', function(e){
				e.preventDefault();
				var url = "${pageContext.request.contextPath}/admin/review/reviewlist.do";
				url = url + "?searchType=" + $('#searchType').val();
				url = url + "&keyword=" + $('#keyword').val();
				location.href = url;
				console.log(url);
			});	

		</script>
		

	</section>

	</main>
	<footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>