<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
    <c:param name="msg" value="로그인"/>
</c:import>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>

</style>

</head>
<body>
<div class="wrapper main_wrap">
	<!-- 헤더 -->
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<!-- // 헤더 -->
	<div class="content clearboth" >
		<div class="login_container">
		
			<div id="login_div02" >
				
				<div class="mem_cont" id="mem_cont" >
					<p class="txt"></p>
					<form id="slForm" action="userlogin.do" method="post" onsubmit="return fn_login()">
						<div id="mem_div">
							<ul>
								<li><input type="text" name="userEmail" id="userEmail" placeholder="이메일을 입력해주세요"/></li>
								<li><input type="password" name="userPass" id="userPass" placeholder="비밀번호를 입력해주세요"/></li>
							</ul>
							<button id="login_btn" class="login_btn" >로그인</button>
						</div>
					</form>
							
						
				</div>
			</div> 	
		</div>
	</div>
    <!-- 푸터 -->
<%--     <c:import url="/WEB-INF/jsp/include/footer.jsp" /> --%>
    <!-- // 푸터 -->
    
    <!-- 팝업 백그라운드  -->
    <div class="bgbox"></div>	
</div>
     	
<script>

function show_layer(div_name){

	 document.all.login_div01.style.display="none";
	 document.all.login_div02.style.display="none";

	 switch(div_name)
	 {
	  case '1':
	  document.all.login_div01.style.display="";
	  break;
	  case '2':
	  document.all.login_div02.style.display="";
	  break;
	  
	 }
	}



function fn_login() {
	if($("#storeEmail").val().length < 1) {
		alert("이메일을 입력해주세요.");
		form.storeEmail.focus();
		return false;
	} else if ($("#storePass").val().length < 1) {
		alert("비밀번호를 입력해주세요.");
		form.storePass.focus();
		return false;
	} 
	return true;
}



</script>
</body>
</html>