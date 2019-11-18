<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="회원가입" />
</c:import>
<meta charset="UTF-8">

<title>Store Join Page</title>
</head>
<body>
	<div class="wrapper sJoin_wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<div id="storeJoinForm">
			<form name="form" id="form" method="post" onsubmit="">
			<table>
				<tr>
					<th>가게 이름</th>
					<td><input type="text" name="storeName" /></td>
				</tr>
				<tr>
					<th>사업자 번호</th>
					<td><input type="text" name="businessNum" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="storeEmail" name="storeEmail" placeholder="이메일을 입력해주세요"/></td>
					<td><div id="emailChk"></div></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="storeEmail" /></td>
				</tr>
				<tr>
					<th>가게 전화번호</th>
					<td><input type="text" name="storeTell" /></td>
				</tr>
				<tr><th rowspan="4">주소</th></tr>
					<tr>
						<td><input type="text" id="zipNo" name="zipNo" readOnly/>
							<input type="hidden" id="sggNm" name="sggNm"/>
							<input type="button" onClick="goPopup();" value="주소찾기"/>
						</td>
					</tr>
					<tr><td><input type="text" style="width:300px;" id="roadFullAddr"  name="roadFullAddr" readOnly/></td></tr>
					<tr><td><input type="text" style="width:300px;" id="addrDetail"  name="addrDetail" readOnly/></td></tr>
				
				<tr>
					<th>영업 시간</th>
					<td><select>
							<c:forEach begin="0" end="24" var="i">
								<option name="openH" value="${i}">${i}</option>
							</c:forEach>
					</select>시 
					<select>
							<c:forEach begin="0" end="59" var="i">
								<option name="openM" value="${i}">${i}</option>
							</c:forEach>
					</select>분 - 
					<select>
							<c:forEach begin="0" end="24" var="i">
								<option name="closeH" value="${i}">${i}</option>
							</c:forEach>
					</select>시 
					<select>
							<c:forEach begin="0" end="59" var="i">
								<option name="closeM" value="${i}">${i}</option>
							</c:forEach>
					</select>분</td>
				</tr>
				<tr>
					<th>휴무일</th>
					<td>
						<input type="checkbox" name="day[]" value="1"/>월
						<input type="checkbox" name="day[]" value="2"/>화
						<input type="checkbox" name="day[]" value="3"/>수
						<input type="checkbox" name="day[]" value="4"/>목
						<input type="checkbox" name="day[]" value="5"/>금
						<input type="checkbox" name="day[]" value="6"/>토
						<input type="checkbox" name="day[]" value="7"/>일
						
					</td>
				</tr>
				<tr>
					<th>가게 분류</th>
					<td>
						<select>
							<option name="category1" value="1" >한식</option>
							<option name="category2" value="2" >양식</option>
							<option name="category3" value="3" >중식</option>
							<option name="category4" value="4" >세계음식</option>
							<option name="category5" value="5" >카페</option>
							<option name="category6" value="6" >주점</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>대표자 이름</th>
					<td><input type="text" name="storeOwner" /></td>
				</tr>
				<tr>
					<th>대표자 휴대폰 번호</th>
					<td><input type="text" name="storeOwnerPh" /></td>
				</tr>
			</table>
			<button id="reg_submit">가입하기</button>
			</form>	
		</div>
	</div>
<script>

function goPopup(){
	var pop = window.open("/nightfoodfinder/api/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,zipNo,addrDetail,sggNm){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
		document.form.sggNm.value = sggNm;
	
}

//이메일 중복체크
$("#storeEmail").blur(function() {
		var storeEmail = $('#storeEmail').val();
		console.log('${pageContext.request.contextPath}/front/login/storeEmailChk?storeEmail='+ storeEmail);
		$.ajax({
			url : '${pageContext.request.contextPath}/front/login/storeEmailChk',
			data : storeEmail,
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#emailChk").text("사용중인 이메일입니다");
						$("#emailChk").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} 
				/* else {
						
						if(idJ.test(storeEmail)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#emailChk").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(storeEmail == ""){
							
							$('#emailChk').text('이메일을 입력해주세요');
							$('#emailChk').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#emailChk').text("올바른 형식의 이메일을 입력해주세요.");
							$('#emailChk').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					} */
				}, error : function() {
						console.log("실패");
						console.log(data);
				}
			});
		});




</script>	
</body>
</html>