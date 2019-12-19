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
	margin : 0px;
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
#mp_profile #nick_modi {
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
</style>
</head>
<body>
	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
<div class="content clearboth">

	<div id="mp_container">
		<div id="mp_profile">
			<span id="nickname">${user.nickName}</span>
			<span id="nick_modi">
			<a href="#">
			<i class="fa fa-cog" aria-hidden="true"></i>닉네임수정
			</a>
			</span>
			
		</div>
		<div id="mp_content">
			<div id="mp_div01">
				<div id="mp_tab">
					<div id="mp_tab01" class="on">단골</div>
					<div id="mp_tab02"  onclick="show_layer('1');">리뷰</div>
				</div>
				<div id="frequent_list">
					<c:forEach items="${freqList}" var="f" >
						${f.storeName} <br />
					</c:forEach>
				</div>
			</div>
			<div id="mp_div02" style="display : none">
				<div id="mp_tab">
					<div id="mp_tab01" onclick="show_layer('2');">단골</div>
					<div id="mp_tab02" class="on">리뷰</div>
				</div>
				<div id="myreview_list">
					<c:forEach items="${reviewList}" var="r">
						${r.reviewContent}	<br />
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

</script>	
</body>
</html>