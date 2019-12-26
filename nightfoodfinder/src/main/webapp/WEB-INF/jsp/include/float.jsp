<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#sidebox { 
	background-color:#ffffff;
	position:fixed; 
	height: 100px;
	width: 150px; 
	top: 50%;
	right: 30px;
	transform: translateY(-50%);
	padding: 3px 10px;
	z-index: 999999;
	overflow: auto; 
	}
	
.recent_box {
	border-bottom: solid 3px lightsteelblue;
    font-size: 1.2em;
    text-align: center;
    height: 25px;
    position: fixed;
	top: 0;
	left: 0;
	right: 0;	
}	
#viewlist, #viewnone {
	padding-top: 25px;
}
</style>
</head>
<body>
	<div id="sidebox">
		<div class="recent_box">최근 본 맛집</div>
		<div id="viewlist"></div>
		<div id="viewnone">최근 본 페이지가 없습니다</div>
	</div>

<script src="<c:url value='/resources/js/storage.js' />"></script>
<script>
	var currentPosition = parseInt($("#sidebox").css("top")); 
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
// 		$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000); 
		});
	
	var list = sessionStorage.getItem('list');
	console.log(list);
	if(list.length != null) {
		$("#viewnone").hide();
		//console.log(typeof list); -> string
		//list = ["2|김밥천국","3|거구장","4|맛있는집","1|수저가"] :스트링
			var viewList = [];
			
				var array = list.substring(1, list.length-1).split(",");
					//array =  "2|김밥천국","3|거구장","4|맛있는집","1|수저가" :배열
			for (i in array){
				//console.log("array",array[i]);
				var strArray = array[i].substring(1, array[i].length-1).split('|');
				//console.log("strArray",strArray[0],strArray[1]);
				var tag = '<div class="viewDetail"><a class="vsName" href="${pageContext.request.contextPath}/front/store/storedetail.do?no='+strArray[0]+'">' + strArray[1] +'</a></div>';
				viewList += tag;
				
			}
			$('#viewlist').html(viewList);

	}
</script>

</body>
</html>