<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>admin</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/style.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/admin_style.css" />">

    
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>

</head>
<body>
    <c:import url="/WEB-INF/jsp/include/adminsidemenu.jsp" />
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>방문자</h2>
          <table>
            <tr>
              <th>총 방문자 수</th>
              <th>오늘 방문자 수</th>
              <th>총 일반 가입자 수 / 오늘 일반 가입자 수</th>
              <th>총 가게 가입자 수 / 오늘 가게 가입자 수</th>

            </tr>
            <c:if test="${empty visitorList}">
            <tr>
            <td colspan="2">방문자가 없습니다.</td>
            </tr>
            </c:if>
            

            <tr>
              <td>${visitorList.totalVisit}</td>
              <td>${visitorList.todayVisit}</td>
              <td>${countJoinUser.todayUser} / ${countJoinUser.totalUser }</td>
              <td>${countJoinStore.todayStore } / ${countJoinStore.totalStore }</td>
      	</tr>

      	<script>
      	let dateTime = [];
      	</script>
      	<div id="hide" style="display: none;">
     	<c:forEach var="c" items="${ countByDate}">
     	<div class="dateTime">${c.dateTime} 
     		<!-- 데이트로 넘겨줘도 스트링으로 나오기 때문에 그래프에 필요한 데이트로 다시 바꿔준다. -->
     		<script>
     		dateTime.push(
     		new Date(${c.dateTime.year} + 1900, ${c.dateTime.month}, ${c.dateTime.date}, ${c.dateTime.hours} - 9))</script>
     	</div>
     	<div class="byDate">${c.byDate }</div>
     </c:forEach>
     </div>
          </table>
          
      <div id="Line_Controls_Chart">
      <h3>한달 동안의 방문수</h3>
      <!-- 라인 차트 생성할 영역 -->
      <div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
      <!-- 컨트롤바를 생성할 영역 -->
      <div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        </div>

        </section>
      
      </main>

   
     <script>
     var chartDrowFun = {
    		    chartDrow : function(){
    		        var chartData = '';
    		        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
    		        var chartDateformat 	= 'yyyy년MM월dd일';
    		        //라인차트의 라인 수
    		        var chartLineCount    = 10;
    		        //컨트롤러 바 차트의 라인 수
    		        var controlLineCount	= 10;
    		           		

    		        function drawDashboard() {
        	
    		          var data = new google.visualization.DataTable();
    		          //그래프에 표시할 컬럼 추가
    		          data.addColumn('datetime', '날짜');
    		          data.addColumn('number', '방문수');

    		          //그래프에 표시할 데이터
    		          var dataRow = [];

    	//	    	  var dateTime = document.getElementsByClassName("dateTime");
    		    	  var byDate = document.getElementsByClassName("byDate");
    		    	  		    	  				
    		    	  for (var i = 0; i < dateTime.length; i++) {

    		    	  	dataRow = [ dateTime[i], Number(byDate[i].innerHTML)];
    		    	  //	console.log(dateTime[i]);
    		    	  //	console.log(byDate[i].innerHTML);
    		    	  //	console.log(dataRow);
    		    	  	data.addRow(dataRow);
    		    	  }
    		    	  console.log(data);
    		          var chart = new google.visualization.ChartWrapper({
    		              chartType   : 'LineChart',
    		              containerId : 'lineChartArea', //라인 차트 생성할 영역
    		              options     : {
    		                              isStacked   : 'percent',
    		                              focusTarget : 'category',
    		                              height		  : 500,
    		                              width			  : '100%',
    		                              legend		  : { position: "top", textStyle: {fontSize: 13}},
    		                              pointSize		: 5,
    		                              tooltip		  : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
    		                              hAxis			  : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
    		                                                                  years : {format: ['yyyy년']},
    		                                                                  months: {format: ['MM월']},
    		                                                                  days  : {format: ['dd일']},
    		                                                                  hours : {format: ['HH시']}
    		                                                                  }
    		                                                                },textStyle: {fontSize:12}},
    		                vAxis			  : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
    		                animation		: {startup: true,duration: 1000,easing: 'in' },
    		                annotations	: {pattern: chartDateformat,
    		                                textStyle: {
    		                                fontSize: 15,
    		                                bold: true,
    		                                italic: true,
    		                                color: '#871b47',
    		                                auraColor: '#d799ae',
    		                                opacity: 0.8,
    		                                pattern: chartDateformat
    		                              }
    		                            }
    		              }
    		            });
    		            var control = new google.visualization.ControlWrapper({
    		              controlType: 'ChartRangeFilter',
    		              containerId: 'controlsArea',  //control bar를 생성할 영역
    		              options: {
    		                  ui:{
    		                        chartType: 'LineChart',
    		                        chartOptions: {
    		                        chartArea: {'width': '60%','height' : 80},
    		                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
    		                            gridlines:{count:controlLineCount,units: {
    		                                  years : {format: ['yyyy년']},
    		                                  months: {format: ['MM월']},
    		                                  days  : {format: ['dd일']},
    		                                  hours : {format: ['HH시']}
    		                                  }
    		                            }}
    		                        }
    		                  },
    		                    filterColumnIndex: 0
    		                }
    		            });
    		            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
    		            date_formatter.format(data, 0);
    		            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
    		            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
    		            dashboard.bind([control], [chart]);
    		            dashboard.draw(data);
    		        }
    		          google.charts.setOnLoadCallback(drawDashboard);
    		      }
    		    }
    		$(document).ready(function(){
    		  google.charts.load('current', {'packages':['line','controls']});
    		  chartDrowFun.chartDrow(); //chartDrow() 실행
    		});
  </script>



      <footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>