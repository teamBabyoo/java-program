<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="회원가입" />
</c:import>
<style>
</style>
<meta charset="UTF-8">
<title>Store Join Page</title>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e2c217701074a631a1029878ed30d6f&libraries=services"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />">
</head>
<body>
<div class="wrapper sjoin_wrap">
  	<!-- 헤더 -->
    <c:import url="/WEB-INF/jsp/include/header.jsp" />
    <!-- // 헤더 -->
		<div class="content clearboth" >
		<div class="sjoin_content">
				<form name="sjform" id="sjform" method="post" action="storejoin.do" onsubmit="return validate();">
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
							<td><input type="text" id="storeEmail" name="storeEmail" />
								<div id="emailChk"></div></td>
						</tr>

						<tr>
							<th>비밀번호</th>
							<td><input type="password" id="storePass" name="storePass" />
								<div id="pwChk"> <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span></div></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" id="storePass2" name="storePass2" />
								<div id="pwChk2">
									 <span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
									 <span id="alert-danger" style="display: none;  ">비밀번호가 일치하지 않습니다.</span>
								</div></td>
						</tr>
						<tr>
							<th>가게 전화번호</th>
							<td><input type="text" name="storeTell" /></td>
						</tr>
						<tr>
							<th rowspan="4">주소</th>
						</tr>
						<tr>
							<td><input type="text" id="zipNo" name="zipNo"  /> 
							<input type="hidden" id="sggNm" name="sggNm" /> 
							<input type="button" class="loc_btn" onClick="goPopup();" value="주소찾기" /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;"
								id="roadFullAddr" name="roadFullAddr"  /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;" id="addrDetail"
								name="addrDetail"  /></td>
						</tr>

						<tr>
							<th>영업 시간</th>
							<td>
								<select name="openH">
										<c:forEach begin="0" end="24" var="i">
											<option id="openH${i}" value="${i}">${i}</option>
										</c:forEach>
								</select>시 
								<select name="openM">
										<c:forEach begin="0" end="59" var="i">
											<option id="openM${i}" value="${i}">${i}</option>
										</c:forEach>
								</select>분 - 
								<select name="closeH">
										<c:forEach begin="0" end="24" var="i">
											<option id="closeH${i}" value="${i}">${i}</option>
										</c:forEach>
								</select>시 
								<select name="closeM">
										<c:forEach begin="0" end="59" var="i">
											<option id="closeM${i}" value="${i}">${i}</option>
										</c:forEach>
								</select>분
							</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td><input type="checkbox" name="day" value="1" />월 
							<input type="checkbox" name="day" value="2" />화 
							<input type="checkbox" name="day" value="3" />수 
							<input type="checkbox" name="day" value="4" />목 
							<input type="checkbox" name="day" value="5" />금 
							<input type="checkbox" name="day" value="6" />토 
							<input type="checkbox" name="day" value="7" />일</td>
						</tr>
						<tr name="trMenu">
							<th>대표 메뉴 / 가격</th>
							<td>
								<input type="text" name="menuName">
								<input type="number" name="menuPrice">
								<i class="fa fa-plus-square-o" aria-hidden="true" id="plus_btn"></i>
								<i class="fa fa-minus-square-o" aria-hidden="true" id="minus_btn"></i>
							</td>
						</tr>
						<tr>
							<th>가격대</th>
							<td>
								<select name="priceTypeNo">
									<option value="1">1만원대</option>
									<option value="2">2만원대</option>
									<option value="3">3만원대</option>
									<option value="4">4만원대 이상</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>가게 분류</th>
							<td><select name="storeCategory">
									<option value="1">한식</option>
									<option value="2">양식</option>
									<option value="3">중식</option>
									<option value="4">세계음식</option>
									<option value="5">카페</option>
									<option value="6">주점</option>
							</select></td>
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
					<input type="hidden" name="openTime"/>
					<input type="hidden" name="closeTime"/>
					<input type="hidden" id="entX" name="entX"/>
					<input type="hidden" id="entY" name="entY"/>
					<input type="hidden" id="roadAddrPart1" name="roadAddrPart1"/>
					<button type="submit" id="reg_submit" class="reg_submit">가입하기</button>
				</form>
			</div>
		</div>
		</div>
	
<script>

// 시간 변환, 유효성검사
 function isEmpty(ele, msg){
	 if (ele.value.trim() == ""  ){
		 alert(msg);
		
		 return true;
	 }
	 return false;
 }
 function isLong(ele, msg, max){
	 if( ele.value.length > max){
		 alert(msg);
		
		 return true;
	 }
	 return false;
 }	
 
	function validate() {
			let f = document.form;

			let openH = $("select[name='openH']").val();
			let openM = $("select[name='openM']").val();
				if (openH < 10) {
					openH = '0' + openH;
				}
				if (openM < 10) {
					openM = '0' + openM;
				}
				let closeH = $("select[name='closeH']").val();
				let closeM = $("select[name='closeM']").val();
	
				if (closeH < 10) {
					closeH *= 1;
					closeH = closeH + 24;
					closeH += "";
				
				}
				if (closeM < 10) {
					closeM = '0' + closeM;
				}
			let openTime = openH + ":" + openM;
			let closeTime = closeH + ":" + closeM;

			$('input[name="openTime"]').val(openTime);
			$('input[name="closeTime"]').val(closeTime);
			
			
			// 유효성검사
			if(isEmpty(f.storeName, "가게 이름을 입력해주세요")) return false;
			if(isEmpty(f.businessNum, "사업자번호를 입력해주세요")) return false;
			if(isEmpty(f.storeEmail, "이메일을 입력해주세요")) return false;
			if(isEmpty(f.storeTell, "전화번호를 입력해주세요")) return false;
			if(isEmpty(f.roadFullAddr, "주소를 입력해주세요")) return false;
			//if(isEmpty(f.menuName, "대표메뉴를 입력해주세요")) return false;
			if(isEmpty(f.storeCategory, "가게분류를 선택해주세요")) return false;
			if(isEmpty(f.storeOwner, "대표자 이름을 입력해주세요")) return false;
			if(isEmpty(f.storeOwnerPh, "대표자 휴대폰번호를 입력해주세요")) return false;
			
			return true;
	
	
			}
			
//주소입력 팝업부분
function goPopup(){
	var pop = window.open("/nightfoodfinder/api/addrPop.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr,zipNo,addrDetail,sggNm,roadAddrPart1){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.sjform.roadFullAddr.value = roadFullAddr;
		document.sjform.zipNo.value = zipNo;
		document.sjform.addrDetail.value = addrDetail;
		document.sjform.sggNm.value = sggNm;
		document.sjform.roadAddrPart1.value = roadAddrPart1;
		/* document.form.entX.value = entX;
		document.form.entY.value = entY; */
		
		var geocoder = new kakao.maps.services.Geocoder();
		var callback = function (result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        document.form.entX.value = result[0].y;
		        document.form.entY.value = result[0].x;
		        
		    }
		};
		geocoder.addressSearch(roadFullAddr, callback);  

	
}



// 비밀번호 유효성검사
$("#storePass").blur(function () {
	var storePass = $('#storePass').val();
	console.log("비밀번호 체크");
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(storePass)){            
        //alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        $('#pwChk').text('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
		$('#pwChk').css('color', 'red');
		//$("#reg_submit").attr("disabled", true);
        
        $('#pwChk').val('').focus();
        return false;
    }    
    var checkNumber = storePass.search(/[0-9]/g);
    var checkEnglish = storePass.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
       // alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#pwChk').text("숫자와 영문자를 혼용하여야 합니다.");
		$('#pwChk').css('color', 'red');
		//$("#reg_submit").attr("disabled", true);
        
        $('#pwChk').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(storePass)){
        //alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#pwChk').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
		$('#pwChk').css('color', 'red');
		//$("#reg_submit").attr("disabled", true);
        
        $('#pwChk').val('').focus();
        return false;
    }
    
    $('#pwChk').text('사용 가능한 비밀번호 입니다.');
    $('#pwChk').css('color', 'black');
    return true;
	
});

//비밀번호 일치 검사
$('#storePass2').focusout(function () {
        var pwd1 = $("#storePass").val();
        var pwd2 = $("#storePass2").val();
        if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                //alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
                $("#alert-danger").css('color', 'red');
            }
        }
    });




//이메일 검사 정규식
var idJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

//이메일 중복체크
$("#storeEmail").blur(function() {
		var storeEmail = $('#storeEmail').val();
		console.log("이메일체크");
		$.ajax({
			url : '${pageContext.request.contextPath}/front/login/storeEmailChk.do?storeEmail='+ storeEmail,
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#emailChk").text("사용중인 이메일입니다");
						$("#emailChk").css("color", "red");
						//$("#reg_submit").attr("disabled", true);
					} 
				else {
						if(idJ.test(storeEmail)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#emailChk").text("");
							//$("#reg_submit").attr("disabled", false);
				
						} else if(storeEmail == ""){
							
							$('#emailChk').text('이메일을 입력해주세요');
							$('#emailChk').css('color', 'red');
							//$("#reg_submit").attr("disabled", true);				
							
						} else if(!idJ.test(storeEmail)){
							
							$('#emailChk').text("올바른 형식의 이메일을 입력해주세요.");
							$('#emailChk').css('color', 'red');
							//$("#reg_submit").attr("disabled", true);
						}
						
					} 
				}, error : function() {
						console.log("실패");
			 			console.log(data);
				}
			});
		});

// 메뉴 입력 추가,삭제
$("#plus_btn").click(() => {
	addRow();
})
$("#minus_btn").click(() => {
	delRow();
})

function addRow () {
	var addMenu =  '<tr name="trMenu">'+
		'<th></th>'+
		'<td>'+
			'<input type="text" name="menuName">'+
			'<input type="number" name="menuPrice">'+
	'</tr>';

var trHtml = $( "tr[name=trMenu]:last" ); 
trHtml.after(addMenu); 
}

function delRow () {
	var trHtml =$( "tr[name=trMenu]:last" );
    if ($( "tr[name=trMenu]" ).length ==1) return;
    trHtml.remove(); //tr 테그 삭제
	
}


</script>

</body>
</html>