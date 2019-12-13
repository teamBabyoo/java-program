<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			<li class="logout warn"><a
				href="${pageContext.request.contextPath}/front/main/main.do">Log
					Out</a></li>
		</ul>
	</header>

	<nav role="navigation">
		<ul class="main">
			<li class="member"><a
				href="${pageContext.request.contextPath}/admin/user/userlist.do">회원관리</a></li>
			<li class="store"><a
				href="${pageContext.request.contextPath}/admin/store/storelist.do">가게관리</a></li>
			<li class="stat"><a
				href="${pageContext.request.contextPath}/admin/stat/statlist.do">통계관리</a></li>
			<li class="review"><a href="#">리뷰관리</a>
				<ul>
					<li><a class="review_all"
						href="${pageContext.request.contextPath}/admin/review/reviewlist.do">전체리뷰</a></li>
					<li><a class="review_report" href="#">신고리뷰</a></li>
				</ul></li>


		</ul>
	</nav>

	<main role="main">


	<section class="panel ">
		<h2>통계 관리</h2>

		<!-- search -->
		<div class="storesearchbar">
			<table class="admssearchtable">
				<tr>
					<th class="admssearchtable-lboi">성별</th>
					<td class="admssearchtable-lboi"><select name="searchType"
						id="searchType">
							<option value="total">전체</option>
							<option value="female">여자</option>
							<option value="male">남자</option>
					</select></td>
					<th class="admssearchtable-lboi">연령대</th>
					<td class="admssearchtable-lboi"><c:forEach var="i" begin="1"
							end="6" step="1">
							<span class="cate"> <input id="age${i}"
								name="categoryCode" value="${i * 10}-${i*10+9}" type="checkbox" /> <label
								for="age${i}" class="types">  ${i * 10}대
							</label>
							</span>
						</c:forEach></td>
				</tr>
			</table>
			<div class="btndiv">
				<button class="btnSearch" name="btnSearch" id="btnSearch">검색</button>
			</div>
		</div>
		<table>
			<tr>
				<th>순위</th>
				<th>가게</th>
				<th>단골 수 (비율)</th>
			</tr>
			<c:if test="${empty slist}">
				<tr>
					<td colspan="5">가입 가게가 없습니다.</td>
				</tr>
			</c:if>
			<c:set var="count" value="1" />
			<c:forEach var="b" items="${statList}">
				<tr>
					<td id="rank">
					<%-- <c:if test="${b. eq '홍길동'}" var="nameHong" scope="session"></c:if> --%>
					</td>
					<td id="storeName">${b.storeName}</td>
					<td id="fqcnt">${b.storeName}</td>
				</tr>
			</c:forEach>
		</table>
	

		<script>
			/* 체크박스 전체선택, 전체해제 */
			function checkAll() {
				if ($("#foodtype_0").is(':checked')) {
					$("input[name=categoryCode]").prop("checked", true);
				} else {
					$("input[name=categoryCode]").prop("checked", false);
				}
			}

			function withdraw() {
				let cnt = 0;
				let chk = document.querySelectorAll("input[name='storeNo']");
				for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) {
						cnt++;
						let withdraw = $(chk[i]).parent().parent().find(
								".storetype").text("활동 정지");
					}
				}
				if (cnt == 0) {
					alert("강제 활동 정지할 가게를 선택하세요.");
					return;
				}

				// storeNoArr을 status=2&storeList=1&storeList=3 이런식으로 만들기 위해서
				var storeNoArr = new Array();
				storeNoArr.push("status=2"); // 고정된 값이어서 미리 푸쉬
				$("input[name='storeNo']:checked").each(
						function() { // each : j쿼리의 반복문
							storeNoArr.push("storeNoList="
									+ $(this).attr("data-storeNo"));
						});
				console.log(storeNoArr.join("&"));
				storeNoArr = storeNoArr.join("&");

				$
						.ajax({
							url : "${pageContext.request.contextPath}/admin/store/withdraw.do",
							type : "POST",
							data : storeNoArr,
							dataType : "json",
							success : function() {
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
					if (chk[i].checked) {
						cnt++;
						let cancel = $(chk[i]).parent().parent().find(
								".storetype").text("승인 완료");
					}
				}
				if (cnt == 0) {
					alert("활동 정지를 취소할 가게를 선택하세요.");
					return;
				}

				// storeNoArr을 status=2&storeList=1&storeList=3 이런식으로 만들기 위해서
				var storeNoArr = new Array();
				storeNoArr.push("status=1"); // 고정된 값이어서 미리 푸쉬
				$("input[name='storeNo']:checked").each(
						function() { // each : j쿼리의 반복문
							storeNoArr.push("storeNoList="
									+ $(this).attr("data-storeNo"));
						});
				console.log(storeNoArr.join("&"));
				storeNoArr = storeNoArr.join("&");

				$
						.ajax({
							url : "${pageContext.request.contextPath}/admin/store/withdraw.do",
							type : "POST",
							data : storeNoArr,
							dataType : "json",
							success : function() {
								location.href = "${pageContext.request.contextPath}/admin/store/storelist.do";
							}
						});

				for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked)
						$(chk[i]).prop('checked', false);
				}
			}
	

			// 서치
			$(document)
					.on(
							'click',
							'#btnSearch',
							function(e) {
								e.preventDefault();

								var categoryCode = "";
								$("input[name='categoryCode']:checked").each(
										function() {
											categoryCode = categoryCode
													+ $(this).val() + ",";
										});
								categoryCode = categoryCode.substring(0,
										categoryCode.lastIndexOf(",")); //맨끝 콤마 지우기

								if (categoryCode == '') {
									alert("가게 분류를 선택하세요.");
									return false;
								}

								var url = "${pageContext.request.contextPath}/admin/store/storelist.do";
								url = url
										+ "?searchType="
										+ $('#searchType option:selected')
												.val();
								url = url + "&categoryCode=" + categoryCode;
								url = url
										+ "&searchTypes="
										+ $('#searchTypes option:selected')
												.val();
								url = url + "&keyword=" + $('#keyword').val();
								location.href = url;
							});

	
		</script>
	</section>
	</main>
	<footer role="contentinfo"></footer>
</body>
</html>