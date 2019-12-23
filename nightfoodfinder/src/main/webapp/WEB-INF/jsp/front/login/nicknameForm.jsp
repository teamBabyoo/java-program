<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Update Nickname</title>
</head>
<body>
	<div>
		<h3>닉네임수정</h3>
		<div>
		<form action="updatename.do" method="post" name="nuform" id="nuform">
			<p>닉네임은 한글, 영문, 숫자만 입력가능합니다.</p>
			<input type="hidden" name="userNo" value="" />
			<input type="text" id="nickName" name="nickName" placeholder="변경하실 닉네임을 입력하세요"> 
			<button type="button" id="chkbtn" >중복체크</button>
			<div id="nickChk"></div>
			<button type="submit" id="nickbtn" >변경</button>
		</form>
		</div> 
	</div>
<script>

var loginUser = `<%=session.getAttribute("loginUser") %>`;
let uNo = loginUser.split(',')[0].split('=')[1];
$('input[name="userNo"]').attr("value", uNo);
console.log($('input[name="userNo"]').val());

//console.dir(loginUser);
//이메일 중복체크
var nnt = /^[가-힣0-9a-zA-Z]+$/;
$("#chkbtn").click(function() {
		var nickname = $('#nickName').val();
		console.log("닉네임체크");
		
	$.ajax({
			url : '${pageContext.request.contextPath}/front/login/nicknameChk.do?nickName='+ nickname,
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#nickChk").text("사용중인 닉네임입니다");
						$("#nickChk").css("color", "red");
						//$("#reg_submit").attr("disabled", true);
					} 
				else {
						if(nnt.test(nickname)){
							$("#nickChk").text("사용가능한 닉네임입니다");
							$("#nickChk").css("color", "#d7d7d7");
							//$("#reg_submit").attr("disabled", false);
				
						} else if(nickname == ""){
							
							$('#nickChk').text('닉네임을 입력해주세요');
							$('#nickChk').css('color', 'red');
							//$("#reg_submit").attr("disabled", true);				
							
						} else if(!nnt.test(nickname)){
							
							$('#nickChk').text("올바른 형식의 닉네임을 입력해주세요.");
							$('#nickChk').css('color', 'red');
							//$("#reg_submit").attr("disabled", true);
						}
						
					} 
				}, error : function() {
						console.log("실패");
			 			console.log(data);
				}
			});
		});
		
$("#nickbtn").click(function(){
	window.onunload = refreshParent;
    function refreshParent() {
        window.opener.location.reload();
        self.close();
    }
});			
</script>	
</body>
</html>