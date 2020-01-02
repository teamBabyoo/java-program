<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<header role="banner">
		<h1>Admin Panel</h1>
		<ul class="utilities">
			<li class="logout warn"><a
				href="${pageContext.request.contextPath}/front/login/logout.do">Log
					Out</a></li>
		</ul>
	</header>
	<nav role="navigation">
		<ul class="main">
			<li class="member"><a
				href="${pageContext.request.contextPath}/admin/user/userlist.do">회원관리</a></li>
			<li class="store"><a
				href="${pageContext.request.contextPath}/admin/store/storelist.do">가게관리</a></li>
			<li class="stat"><a href="#">통계관리</a>
				<ul>
					<li><a class="stat_visitor"
						href="${pageContext.request.contextPath}/admin/stat/visitorcount.do">방문자</a></li>
					<li><a class="stat_all" href="${pageContext.request.contextPath}/admin/stat/statlist.do">단골 통계</a></li>
				</ul>
				</li>
			
			<li class="review"><a href="#">리뷰관리</a>
				<ul>
					<li><a class="review_all"
						href="${pageContext.request.contextPath}/admin/review/reviewlist.do">전체리뷰</a></li>
					<li><a class="review_report" href="${pageContext.request.contextPath}/admin/review/reportedreviewlist.do">신고리뷰</a></li>
				</ul></li>


		</ul>
	</nav>
</body>
</html>