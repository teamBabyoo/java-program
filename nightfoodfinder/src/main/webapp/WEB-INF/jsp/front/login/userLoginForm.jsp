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
			 		<div id="login_div01">
			 			<div id="login_tab" >
					 		<div id="login_tab01" class="on">일반회원 로그인</div>
					 		<div id="login_tab02" ><a href="javascript:show_layer('2');">스토어 로그인</a></div>
				 		</div>
			 			<div class="sns_cont" id="sns_cont">
			 			<p class="txt">기존 SNS 계정으로 로그인 하세요</p>
							<ul>
								<li>
									 <a href="${naver_url}" target="_blank">
										 <img width="223" 
										 	src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
									 </a>
								</li>
								<li>
								 <a href="${kakao_url}" target="_blank">
									 <img id="kakao-login-btn" width="223" 
									 	src="${pageContext.request.contextPath}/resources/images/kakao_account_login_btn.png"/>
								</a>						
								</li>
							</ul>
					</div>
				 	</div> 	
				 	
				 	<div id="login_div02" style="display : none">
			 			<div id="login_tab" >
					 		<div id="login_tab01" ><a href="javascript:show_layer('1');">일반회원 로그인</a></div>
					 		<div id="login_tab02" class="on">스토어 로그인</div>
				 		</div>
			 			<div class="mem_cont" id="mem_cont" >
			 				<p class="txt">가입하신 이메일로 로그인 하세요</p>
							<form id="slForm" action="storelogin.do" method="post" onsubmit="return fn_login()">
								<div id="mem_div">
									<ul>
										<li><input type="text" name="storeEmail" id="storeEmail" placeholder="이메일을 입력해주세요"/></li>
										<li><input type="password" name="storePass" id="storePass" placeholder="비밀번호를 입력해주세요"/></li>
									</ul>
									<button id="login_btn" class="login_btn" >로그인</button>
								</div>
							</form>
									<p><a id="join_btn" href="storeJoinForm.do">회원가입</a></p>
							
						</div>
				 	</div> 	
			 	
	      	</div>
	      	</div>
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