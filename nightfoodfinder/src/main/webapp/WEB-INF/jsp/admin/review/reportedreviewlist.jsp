<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
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

/* 모달 내용/팝업박스  */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* 닫기 버튼 */
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

</style>
    
    <script src="js/jquery-3.3.1.min.js"></script>
</head>
<body>
    <header role="banner">
        <h1>Admin Panel</h1>
        <ul class="utilities">
          <li class="users"><a href="#">My Account</a></li>
		  <li class="logout warn"><a href="${pageContext.request.contextPath}/front/main/main.do">Log Out</a></li>
		</ul>
	</header>

	<nav role="navigation">
		<ul class="main">
			<li class="member"><a href="${pageContext.request.contextPath}/admin/user/userlist.do">회원관리</a></li>
			<li class="store"><a href="${pageContext.request.contextPath}/admin/store/storelist.do">가게관리</a></li>
			<li class="review"><a href="#">리뷰관리</a>
				<ul>
				<li><a class="review_all" href="${pageContext.request.contextPath}/admin/review/reviewlist.do">전체리뷰</a></li>
                <li><a class="review_report" href="#">신고리뷰</a></li>
            </ul>
        </li>
   
        </ul>
      </nav>
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>Table</h2>
          <table>
 			<div>전체 : ${pagination.listCnt}개</div>
			
			<li>
				<div class="allCheck">
				<input type="checkbox" id="allCheck" name="allCheck" />
				<label for="allCheck">모두 선택</label>
				</div>
			</li>

			
			<tr>
				<th>선택</th>
				<th>닉네임</th>
				<th>가게 이름</th>
				<th>리뷰</th>
				<th>리뷰 단 날짜</th>
				<th>신고 횟수</th>
				<th>차단 여부</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
			
			
			<c:forEach var="list" items="${list}">
			
				<tr>
					<td><input type="checkbox" class="checkboxid" id="checkboxid" name="reviewNo" data-reviewNo="${list.reviewNo}"/></td>
					<td>${list.nickName}</td>
					<td>${list.storeName}</td>
					<td class="myBtn"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${list.reviewContent }</td>	
					<td>${list.regDate }</td>
					<td>${list.reportCount }</td>
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

      
           
          </table>
          
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
      
      <script>
		
		/* ----------------------- 모달팝업 -------------------------- */
		// 모달 가져온다.
		var modal = document.getElementById('myModal');

		// 모달 여는 버튼을 가져온다.
		var btn = document.getElementsByClassName("myBtn");

		// 모달을 닫는 <span>을 가져온다.
		var span = document.getElementsByClassName("close")[0];

		// 버튼을 클릭했을 때, 모달을 연다.
		// 그런데, 모달팝업이 첫 리스트 줄에만 적용되고 반복되어서 나오는 리스트들에는 적용이 안되었음..
		// 이렇게 해야 모든 리스트에 적용된다.	
	

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

      
      
      </script>
      
      
      </main>
      <footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>