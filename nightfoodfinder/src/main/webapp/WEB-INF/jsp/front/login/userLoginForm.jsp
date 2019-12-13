<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
    <c:param name="msg" value="로그인"/>
</c:import>
<link rel="stylesheet"
	href="<c:url value="/resources/css/style.css" />">
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
 <div class="wrapper main_wrap">
  	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
			<div class="content clearboth" >
		        <div id="login_container">
			 		<div id="login_tab">
				 		<ul>
				 			<li>일반회원 로그인</li>
				 			<li>스토어회원 로그인</li>
				 		</ul>                                                 
			 		</div>
		 			<div id="login_box">
		 			
				
				<div class="memInput" id="memInput" style="display : none;">
						<form id="slForm" action="storelogin.do" method="post" onsubmit="">
						<p>
							<input type="text" name="storeEmail" id="storeEmail" placeholder="이메일을 입력해주세요"/>
						</p>
						<p>
							<input type="password" name="storePass" id="storePass" placeholder="비밀번호를 입력해주세요"/>
						</p>
						<p><button id="login_btn" class="login_btn" >로그인</button></p>
						</form>
					
				</div>
				<div class="snsBox" id="snsBox">
					<ul>
						<li>
							 <a href="${naver_url}" target="_blank">
								 <img width="223" 
								 	src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
							 </a>
						</li>
						<li>
						<!-- <a id="custom-login-btn" href="javascript:loginWithKakao()" >
						<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="223"/>
						</a> -->
						 <a href="${kakao_url}" target="_blank">
							 <img id="kakao-login-btn" width="223" 
							 	src="${pageContext.request.contextPath}/resources/images/kakao_account_login_btn.png"/>
						</a>						
						</li>
					</ul>
				</div>
				</div>
				 </div>     
	      	</div>
	      	</div>
	      	
     	
<script>
function show_layer(div_name){

	 document.all.div_01.style.display="none";
	 document.all.div_02.style.display="none";

	 switch(div_name)
	 {
	  case '1':
	  document.all.div_01.style.display="";
	  break;
	  case '2':
	  document.all.div_02.style.display="";
	  break;
	  
	 }
	}



var uType1 = document.getElementById("userType1");
var uType2 = document.getElementById("userType2");
var mInput = document.getElementById("memInput");
var snsBox = document.getElementById("snsBox");
uType1.onclick = function() {
	mInput.style.display = "none";
	snsBox.style.display = "block";
}
uType2.onclick = function() {
	snsBox.style.display = "none";
	mInput.style.display = "block";
}

$(document).ready(() => {
	$("#login_btn").click(() =>{
		//e.preventDefault();
		fn_login();
	});
});

function fn_login() {
	if($("#storeEmail").val().length < 1) {
		alert("이메일을 입력해주세요.");
	} if ($("#storePass").val().length < 1) {
		alert("비밀번호를 입력해주세요.");
	} 
}

</script>
</body>
</html>