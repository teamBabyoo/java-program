<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <c:import url="/WEB-INF/jsp/include/head.jsp">
    	<c:param name="msg" value="로그인"/>
    </c:import>
<style>
	.content {
	    margin-top: 10px;
	    text-align: center;
	}
	.login_btn {
	
	}
	.memSel span {
		
	}    


</style>    
</head>
<body>
 <div class="wrapper main_wrap">
  	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
			<div class="content clearboth" >
		        <h1>NFF</h1>                                                               
				<p class="memSel" >
					<span>
						<input type="radio" id="userType1" name="r" checked>
						<label for="userType1" id="userLabel1">개인회원</label>
					</span>
				
					<span>
						<input type="radio" id="userType2" name="r">
						<label for="userType2" id="userLabel2">점주회원</label>
					</span>
				</p>
				<div class="memInput" id="memInput" style="display : none;">
					<!-- <form id="memForm" action="" onsubmit="return memChk()" method="post"> -->
						<p>
							<input type="text" name="storeEmail" id="storeEmail" placeholder="이메일을 입력해주세요"/>
						</p>
						<p>
							<input type="password" name="storePass" id="storePass" placeholder="비밀번호를 입력해주세요"/>
						</p>
						<p><a class="login_btn" href="${pageContext.request.contextPath}/admin/user/userlist.do" >로그인</a></p>
					<!-- </form> -->
				</div>
				<div class="snsBox" id="snsBox">
					<ul>
						<li>
							 <a href="${url}" target="_blank">
								 <img width="223" 
								 	src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
							 </a>
						</li>
						<li></li>
					</ul>
				</div>
	      	</div>
	      	</div>
	      	
     	
<script>
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

</script>
</body>
</html>