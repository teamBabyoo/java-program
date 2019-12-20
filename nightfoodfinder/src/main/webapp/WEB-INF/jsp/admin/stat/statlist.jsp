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
	    <c:import url="/WEB-INF/jsp/include/adminsidemenu.jsp" />
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
							<button id="genderchoice" onclick="fnShow('1')">전체</button>
							<button id="genderchoice" onclick="fnShow('2')">여자</button>
							<button id="genderchoice" onclick="fnShow('3')">남자</button>
					</td>
				</tr>
			</table>
			
		</div>
	<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
<c:forEach var="i" begin="1" end="3" step="1">
<c:choose>
<c:when test="${i == 1}">
<c:set value="show_graph" var="className"/>
</c:when>
<c:otherwise>
<c:set value="hidden_graph" var="className"/>
</c:otherwise>
</c:choose>
		<%-- <span class="button"><a href="insertAward.do?genderType=${i}&userAge=${search.userAge}">award 등록</a></span> --%>
    <div id="chartcontainer-${i}" class=${className}></div>	
							</c:forEach>

</figure>

<script>
function fnShow(seq){
	for (let i = 1; i < 4; i++) {
		
	let graphs = document.querySelector("#chartcontainer-" + i);
	graphs.classList.replace("show_graph", "hidden_graph");
		
	}
	
    let graph = document.querySelector("#chartcontainer-" + seq);
    graph.classList.replace("hidden_graph", "show_graph");
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