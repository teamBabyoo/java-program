<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="가게정보수정" />
</c:import>
<meta charset="UTF-8">


<title>Store Join Page</title>
</head>
<body>
	<div class="wrapper sInfoUpdate_wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<div class="content">
			<div id="storeupdateForm">
				<form name="form" action="storeinfoupdate.do" method="post" onsubmit="return validate();" >
					<table>
						<tr>
							<th>가게 이름</th>
							<td><input type="text" name="storeName"
								value="${store.storeName}" /></td>
						</tr>
						<tr>
							<th>사업자 번호</th>
							<td>${store.businessNum}</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>${store.storeEmail}</td>
							<td><div id="emailChk"></div></td>
						</tr>
						<%-- 
						<tr>
							<th>비밀번호</th>
							<td><input type="text" id="storePw" />123</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<c:if test="">
							<td><input type="text" name="storeEmail" />123</td>
							</c:if>
						</tr> 
						--%>
						<tr>
							<th>가게 전화번호</th>
							<td><input type="text" name="storeTell"
								value="${store.storeTell}" /></td>
						</tr>
						<tr>
							<th rowspan="4">주소</th>
						</tr>
						<tr>
							<td><input type="text" id="zipNo" name="zipNo" readOnly /> <input
								type="hidden" id="sggNm" name="sggNm" /> <input type="button"
								onClick="goPopup();" value="주소찾기" /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;"
								id="roadFullAddr" name="roadFullAddr" value="${store.city}"
								readOnly /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;" id="addrDetail"
								name="addrDetail" value="${store.streetLoad}" readOnly /></td>
						</tr>

						<tr>
							<th>영업 시간</th>
							<td><select name="openH">
									<c:forEach begin="0" end="24" var="i">
										<option id="openH${i}" value="${i}">${i}</option>
									</c:forEach>
							</select>시 <select name="openM">
									<c:forEach begin="0" end="59" var="i">
										<option id="openM${i}"  value="${i}">${i}</option>
									</c:forEach>
							</select>분 - <select name="closeH">
									<c:forEach begin="0" end="24" var="i">
										<option id="closeH${i}" value="${i}">${i}</option>
									</c:forEach>
							</select>시 <select name="closeM">
									<c:forEach begin="0" end="59" var="i">
										<option id="closeM${i}" value="${i}">${i}</option>
									</c:forEach>
							</select>분</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td>
							<input type="checkbox" name="day" value="1" />월 
							<input type="checkbox" name="day" value="2" />화 
							<input type="checkbox" name="day" value="3" />수
							<input type="checkbox" name="day" value="4" />목 
							<input type="checkbox" name="day" value="5" />금
							<input type="checkbox" name="day" value="6" />토 
							<input type="checkbox" name="day" value="7" />일
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
							<td><input type="text" name="storeOwner" value="${store.storeOwner}"/></td>
						</tr>
						<tr>
							<th>대표자 휴대폰 번호</th>
							<td><input type="text" name="storeOwnerPh" value="${store.storeOwnerPh}" /></td>
						</tr>
					</table>
					<input type="hidden" name="openTime"/>
					<input type="hidden" name="closeTime"/>
					<input type= "hidden" name="storeNo" value="${store.storeNo}"/>
					
					<div>
						<button type='submit' id="updateBtn">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	
	$(document).ready(function() {
		
		
// 		console.log(holiList);
		//시작시간
		let open = '${store.openTime}';
		let time = open.split(":");
		let openhour = '';
		if(time[0].substr(0, 1) < 1){
			openhour = time[0].substr(1, 1);
		} else {
			openhour = time[0];
		}
		let openminuite = 0;
		if(time[1].substr(0, 1) < 1) {
			openminuite = time[1].substr(0, 1);
		} else {
			openminuite = time[1];
		}
		
		//끝나는 시간
		let close = '${store.closeTime}';
		let closetime = close.split(":");
		
		let closehour = '';
		if(closetime[0].substr(0, 1) < 1){
			closehour = closetime[0].substr(1, 1);
		} else {
			closehour = closetime[0];
		}
		
		let closeminuite = 0;
		if(closetime[1].substr(0, 1) < 1) {
			closeminuite = closetime[1].substr(0, 1);
		} else {
			closeminuite = closetime[1];
		}

		
		//select box 디폴트값(원래의 시간)		
		$("#openH" + openhour).val(openhour).attr("selected", "selected");
		$("#openM" + openminuite).val(openminuite).attr("selected", "selected");
		$("#closeH" + closehour).val(closehour).attr("selected", "selected");
		$("#closeM" + closeminuite).val(closeminuite).attr("selected", "selected");
		
		

		let categoryNo = '${store.storeCategory}';
		$("select[name='storeCategory']").val(categoryNo).attr("selected", "selected");
		
		
		//휴무일 받을 거...
		/*
		console.log($('input:checkbox[name="day"]').val());
		$("input:checkbox[name='day[]']").click((e) => {
			alert($(e.target).val())
		})
			*/
		let holiList = JSON.parse('${holidaylist}');

		for (let i = 0; i < holiList.length; i++) {
			$('input:checkbox[name="day"]').each(function() {
				if (this.value == holiList[i].weekNo) {
					this.checked = true;
				}
			});
		}
	});
				
	

		function validate() {
			alert("얍");
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
				closeH = '0' + closeH;
			}
			if (closeM < 10) {
				closeM = '0' + closeM;
			}

			let openTime = openH + ":" + openM;
			let closeTime = closeH + ":" + closeM;

			$('input[name="openTime"]').val(openTime);
			$('input[name="closeTime"]').val(closeTime);

			console.log($('input[name="day"]').checked().val());
			return false;
		}
		// 		alert($('input[name="closeTime"]').val();

		// 		return false;
	</script>
</body>
</html>