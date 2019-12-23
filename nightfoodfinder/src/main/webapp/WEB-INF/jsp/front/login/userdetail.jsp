<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>    
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="MY PAGE" />
</c:import>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<style>
#mp_container {
	width: 1200px;
    margin: 30px auto 0;
	padding-top : 20px;
	text-align : center;	
}
#mp_content {
	border : 1px solid #d7d7d7;
	border-top : none;
}
#mp_div01 , #mp_div02 {
	display : inline-block;
	width : 100%;
}
#mp_profile {
	width: auto;
	height: 36px;
	padding: 5px;
    border: 1px solid #d7d7d7;
    position: relative;
}
#mp_profile #nickname {
	float: left;
    margin-left: 5px;
}
#mp_profile #nick_update {
	float: right;
    margin-right: 5px;
}

#mp_tab {
	overflow : hidden;
	
}
#mp_tab div {
	display: block;
	width: 50%;
    color: #999;
    font-size: 1.333em;
    letter-spacing: -.50px;
    background: #000;
    height: 53px;
    line-height: 52px;
    text-align: center;
    /* border-top: 1px solid #000;
    border-right: 1px solid #000; */
    float : left;
}
#mp_tab .on {
	background: #fff;
    border-color: #d7d7d7;
    font-weight: 700;
    color: #000;
}
#mp_tab a {
	display: block;
}
</style>
</head>
<body>
	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
    <c:import url="/WEB-INF/jsp/include/float.jsp" />
<div class="content clearboth">

	<div id="mp_container">
		<div id="mp_profile">
			<div id="nickname">
				<i class="fa fa-user-circle" aria-hidden="true"></i>
				${user.nickName}
			</div>
			<div id="nick_update" onclick="nickUpdate();">
				<i class="fa fa-cog" aria-hidden="true"></i>
				수정	
			</div>
			
		</div>
		<div id="mp_content">
			<div id="mp_div01">
				<div id="mp_tab">
					<div id="mp_tab01" class="on">단골</div>
					<div id="mp_tab02" ><a href="javascript:show_layer('2');">리뷰</a></div>
				</div>
				<div id="frequent_list">
					<c:forEach items="${freqList}" var="f" >
						<div id="freq_box" onclick="location.href=`${pageContext.request.contextPath}/front/store/storedetail.do?no=${f.storeNo}`;">
							<div id="sThumb"></div>
							<div>${f.storeName}</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			<div id="mp_div02" style="display : none">
				<div id="mp_tab">
					<div id="mp_tab01"><a href="javascript:show_layer('1');">단골</a></div>
					<div id="mp_tab02" class="on">리뷰</div>
				</div>
				<div id="myreview_list">
					<c:forEach items="${reviewList}" var="r">
						<div id="review_box">${r.reviewContent}</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

function show_layer(div_name){

	 document.all.mp_div01.style.display="none";
	 document.all.mp_div02.style.display="none";
	//alert('클릭');
	 switch(div_name)
	 {
	  case '1':
	  document.all.mp_div01.style.display="";
	  break;
	  case '2':
	  document.all.mp_div02.style.display="";
	  break;
	  
	 }
	}
	
// 닉네임 수정
function nickUpdate() {
	console.log('update');
	window.open("${pageContext.request.contextPath}/front/login/nicknameForm.do","닉네임 수정","width=570, height=350"); 
	
}





</script>	
</body>
</html>