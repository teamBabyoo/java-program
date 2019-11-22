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



<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				</ul></li>
			
			
		</ul>
	</nav>

	<main role="main">


	<section class="panel ">
		<h2>가게 관리</h2>
		
		<!-- search -->
			
				<div class="form-group row justify-content-center">
						<select class="form-control form-control-sm" name="searchType"
							id="searchType">						
									<option value="total" ${pagination.type eq "total" ? "selected" :""}>전체</option>
									<option value="permit" ${pagination.type eq "permit" ? "selected" :""}>승인 완료</option>
									<option value="nopermit" ${pagination.type eq "nopermit" ? "selected" :""}>승인 대기</option>
									<option value="withdraw" ${pagination.type eq "withdraw" ? "selected" :""}>활동 정지</option>								
						</select>
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword" value="${pagination.keyword}">
						<button class="btn btn-sm btn-primary" name="btnSearch"
							id="btnSearch">검색</button>
					</div>
			
			<!-- search -->
		<div class="searchcnt">전체 : ${pagination.listCnt}개</div>
		<table>
			<tr>
				<th class="choicee">선택</th>
				<th>가게이름</th>
				<th>가게분류</th>
				<th>대표자이름</th>
				<th>사업자번호</th>
				<th>상태</th>
			</tr>
			<c:if test="${empty slist}">
				<tr>
					<td colspan="5">가입 가게가 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="b" items="${slist}">
				<tr>
				<td><input type="checkbox" id="myCheckboxid" name="storeNo" data-storeNo="${b.storeNo}"/></td>
					<td class="myBtn" id="storeName">${b.storeName}</td>
					<td id="categoryName">${b.categoryName}</td>
					<td id="storeOwner">${b.storeOwner}</td>
					<td id="businessNum">${b.businessNum}</td>
					<td class="storetype"><c:choose>
							<c:when test="${b.status == 0}">
								<span class="statusbutton"><a
									href="storestatus.do?no=${b.storeNo}">승인 대기</a></span>
							</c:when>
							<c:when test="${b.status == 1}">
								승인 완료
							</c:when>
							<c:otherwise>
								활동 정지
							</c:otherwise>
						</c:choose></td>
					<td class="ahide" id="status">${b.status}</td>
					<td class="ahide" id="storeEmail">${b.storeEmail}</td>
					<td class="ahide" id="storeTell">${b.storeTell}</td>
					<td class="ahide" id="streetLoad">${b.streetLoad}</td>
					<td class="ahide" id="time">${b.openTime}~${b.closeTime}</td>
					<td class="ahide" id="storeOwnerPh">${b.storeOwnerPh}</td>
				</tr>
			</c:forEach>
		</table>
		  <div>
		<button type="button" id="withdraw" onclick="withdraw()">강제 활동 정지</button>
 		<button type="button" id="cancel" onclick="cancel()">활동 정지 취소</button>  
		</div>
		
			<script>
		function withdraw() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='storeNo']");
			for (let i = 0; i < chk.length; i++) {
				if (chk[i].checked) {cnt++;
				let withdraw = $(chk[i]).parent().parent().find(".storetype").text("활동 정지");}
			}
			if (cnt == 0) {
				alert("강제 활동 정지할 가게를 선택하세요.");
				return;
			}
			
		
			// storeNoArr을 status=2&storeList=1&storeList=3 이런식으로 만들기 위해서
			var storeNoArr = new Array();
			storeNoArr.push("status=2");	// 고정된 값이어서 미리 푸쉬
			$("input[name='storeNo']:checked").each(function(){	// each : j쿼리의 반복문
				storeNoArr.push("storeNoList=" + $(this).attr("data-storeNo"));
			});
			console.log(storeNoArr.join("&"));
			storeNoArr = storeNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/store/withdraw.do",
				type: "POST",
				data: storeNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/store/storelist.do";
				}
			});

			 for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) 
					$(chk[i]).prop('checked', false);
				}	
		}
		function cancel() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='storeNo']");
			for (let i = 0; i < chk.length; i++) {
				if (chk[i].checked) {cnt++;
				let cancel = $(chk[i]).parent().parent().find(".storetype").text("승인 완료");}
			}
			if (cnt == 0) {
				alert("활동 정지를 취소할 가게를 선택하세요.");
				return;
			}
			
		
			// storeNoArr을 status=2&storeList=1&storeList=3 이런식으로 만들기 위해서
			var storeNoArr = new Array();
			storeNoArr.push("status=1");	// 고정된 값이어서 미리 푸쉬
			$("input[name='storeNo']:checked").each(function(){	// each : j쿼리의 반복문
				storeNoArr.push("storeNoList=" + $(this).attr("data-storeNo"));
			});
			console.log(storeNoArr.join("&"));
			storeNoArr = storeNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/store/withdraw.do",
				type: "POST",
				data: storeNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/store/storelist.do";
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
		
		<!-- The admsmodal -->
		<div id="myadmsmodal" class="admsmodal">
			<!-- admsmodal content -->
			<div class="admsmodal-content">
				<span class="close">&times;</span>
		
				<table class="admsmodalpp">
					<tr>
						<th class="admsmodalpp-cly1">가게 이름</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">가게 이메일</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">가게 전화번호</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">가게 주소</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">영업 시간</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">분류</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">사업자 등록번호</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">대표자 이름</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>
					<tr>
						<th class="admsmodalpp-cly1">대표자 연락처</th>
						<td class="admsmodalpp-cly1"></td>
					</tr>									
				</table>
			</div>

		</div>
		<script>
			// 모달팝업
			// Get the admsmodal
			var admsmodal = document.getElementById('myadmsmodal');
			// Get the button that opens the admsmodal
			var btn = document.getElementsByClassName("myBtn");
			// Get the <span> element that closes the admsmodal
			var span = document.getElementsByClassName("close")[0];
			// When the store clicks on the button, open the admsmodal 
			for (let i = 0; i < btn.length; i++) {
				btn[i].onclick = function(e) {
					let storeName = $(e.target).text();
					let storeEmail = $(e.target).siblings("#storeEmail").text();
					let storeTell = $(e.target).siblings("#storeTell").text();
					let streetLoad = $(e.target).siblings("#streetLoad").text();
					let time = $(e.target).siblings("#time").text();
					let categoryName = $(e.target).siblings("#categoryName").text();
					let businessNum = $(e.target).siblings("#businessNum").text();
					let storeOwner = $(e.target).siblings("#storeOwner").text();
					let storeOwnerPh = $(e.target).siblings("#storeOwnerPh").text();
					admsmodal.style.display = "block";
					$(".admsmodalpp td:eq(0)").text(storeName)
					$(".admsmodalpp td:eq(1)").text(storeEmail)
					$(".admsmodalpp td:eq(2)").text(storeTell)
					$(".admsmodalpp td:eq(3)").text(streetLoad)
					$(".admsmodalpp td:eq(4)").text(time)
					$(".admsmodalpp td:eq(5)").text(categoryName)
					$(".admsmodalpp td:eq(6)").text(businessNum)
					$(".admsmodalpp td:eq(7)").text(storeOwner)
					$(".admsmodalpp td:eq(8)").text(storeOwnerPh)
					
				}
			}
			// When the user clicks on <span> (x), close the admsmodal
			span.onclick = function() {
				admsmodal.style.display = "none";
			}
			// When the user clicks anywhere outside of the admsmodal, close it
			window.onclick = function(event) {
				if (event.target == admsmodal) {
					admsmodal.style.display = "none";
				}
			}
			
			 // 서치
			$(document)
					.on(
							'click',
							'#btnSearch',
							function(e) {
								e.preventDefault();
								var url = "${pageContext.request.contextPath}/admin/store/storelist.do";
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
				var url = "${pageContext.request.contextPath}/admin/store/storelist.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				location.href = url;
			}

			//페이지 번호 클릭
			function fn_pagination(page, range, rangeSize) {
				var url = "${pageContext.request.contextPath}/admin/store/storelist.do";
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
				var url = "${pageContext.request.contextPath}/admin/store/storelist.do";
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