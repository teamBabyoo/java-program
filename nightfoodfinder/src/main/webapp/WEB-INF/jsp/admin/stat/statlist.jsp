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
					<th class="admssearchtable-lboi">연령대</th>
					<td class="admssearchtable-lboi"><select name="userAge"
						id="userAge">
						<option value="" >전체</option>
						<c:forEach var="i" begin="1"
							end="6" step="1">
							<c:set value="${i * 10}-${i*10+9}" var="val"/>
							<option value=${val} ${search.userAge eq val ? "selected" : ""}>${i * 10}대</option>
							</c:forEach>
					</select>
				<button class="btnSearch" name="btnSearch" id="btnSearch">검색</button>
			</td>
					<th class="admssearchtable-lboi">성별</th>
					<td class="admssearchtable-lboi">
							<button id="genderchoice" onclick="fnMove('1')">전체</button>
							<button id="genderchoice" onclick="fnMove('2')">여자</button>
							<button id="genderchoice" onclick="fnMove('3')">남자</button>
					</td>
				</tr>
			</table>
			
		</div>
	<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
    <div id="chartcontainer-1"></div>
    <div id="chartcontainer-2"></div>
    <div id="chartcontainer-3"></div>
</figure>
<script>
function fnMove(seq){
    var offset = $("#chartcontainer-" + seq).offset();
    $('html, body').animate({scrollTop : offset.top - 150}, 400);
}

let statMap =  JSON.parse('${statMap}');
let allMap = statMap["0"].allMap;
let maleMap = statMap["0"].maleMap;
let femaleMap = statMap["0"].femaleMap;
console.log(statMap["0"]);
Highcharts.chart('chartcontainer-1', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '전체'
    },
    xAxis: {
        categories: allMap.storeNameList
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    legend: {
        reversed: true
    },
    plotOptions: {
        series: {
            stacking: 'normal'
        }
    },
    series: [{
        name: '단골 수',
        data: allMap.fqCountList,
        color: '#91e8e1'
    }]
});
Highcharts.chart('chartcontainer-3', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '남자'
    },
    xAxis: {
        categories: maleMap.storeNameList
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    legend: {
        reversed: true
    },
    plotOptions: {
        series: {
            stacking: 'normal'
        }
    },
    series: [{
        name: '단골 수',
        data: maleMap.fqCountList,
        color: '#8085e9'
    }]
});
Highcharts.chart('chartcontainer-2', {
    chart: {
        type: 'bar'
    },
    title: {
        text: '여자'
    },
    xAxis: {
        categories: femaleMap.storeNameList
    },
    yAxis: {
        min: 0,
        title: {
            text: ''
        }
    },
    legend: {
        reversed: true
    },
    plotOptions: {
        series: {
            stacking: 'normal'
        }
    },
    series: [{
        name: '단골 수',
        data: femaleMap.fqCountList,
        color: '#2b908f'
    }]
});

//서치
$(document)
		.on(
				'click',
				'#btnSearch',
				function(e) {
					e.preventDefault();

					var url = "${pageContext.request.contextPath}/admin/stat/statlist.do";
					url = url
							+ "?userAge="
							+ $('#userAge option:selected')
									.val();
					location.href = url;
				});

</script>
	</section>
	</main>
	<footer role="contentinfo"></footer>
</body>
</html>