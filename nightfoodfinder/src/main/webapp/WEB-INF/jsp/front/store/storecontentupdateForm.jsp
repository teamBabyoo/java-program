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
				<form name="form" id="form" method="post"
					action="storeinfoupdate.do">
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
							<td><input type="text" name="storeEmail"
								value="${store.storeEmail}" /></td>
							<td><div id="emailChk"></div></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="text" name="storeEmail" /></td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="text" name="storeEmail" /></td>
						</tr>
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
							<td><select>
									<c:forEach begin="0" end="24" var="i">
										<option name="openH" id="openH${i}" value="${i}">${i}</option>
									</c:forEach>
							</select>시 <select>
									<c:forEach begin="0" end="59" var="i">
										<option name="openM" id="openM${i}"  value="${i}">${i}</option>
									</c:forEach>
							</select>분 - <select>
									<c:forEach begin="0" end="24" var="i">
										<option name="closeH" value="${i}">${i}</option>
									</c:forEach>
							</select>시 <select>
									<c:forEach begin="0" end="59" var="i">
										<option name="closeM" value="${i}">${i}</option>
									</c:forEach>
							</select>분</td>
						</tr>
						<tr>
							<th>휴무일</th>
							<td><input type="checkbox" name="day[]" value="1" />월 <input
								type="checkbox" name="day[]" value="2" />화 <input
								type="checkbox" name="day[]" value="3" />수 <input
								type="checkbox" name="day[]" value="4" />목 <input
								type="checkbox" name="day[]" value="5" />금 <input
								type="checkbox" name="day[]" value="6" />토 <input
								type="checkbox" name="day[]" value="7" />일</td>
						</tr>
						<tr>
							<th>가게 분류</th>
							<td><select>
									<option name="category1" value="한식">한식</option>
									<option name="category2" value="양식">양식</option>
									<option name="category3" value="중식">중식</option>
									<option name="category4" value="세계음식">세계음식</option>
									<option name="category5" value="카페">카페</option>
									<option name="category6" value="주점">주점</option>
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
					<button id="reg_submit">가입하기</button>
				</form>
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function() {
		let open = '${store.openTime}';
		let time = open.split(":");
		let openhour = time[0].substr(0, 1);
		
		let openminuite = 0;
		if(time[1].substr(0, 1) < 1) {
			openminuite = time[1].substr(0, 1);
		} else {
			openminuite = time[1].substr(0, 2);
		}
		
		//끝나는 시간
		let close = '${store.closeTime}';
		let closetime = close.split(":");
		let closehour = closetime[0].substr(1, 1);
		let closeminuite = 0;
		if(closetime[1].substr(0, 1) < 1) {
			closeminuite = closetime[1].substr(0, 1);
		} else {
			openminuite = closetime[1].substr(0, 2);
		}

		
	
		
		
		
		//select box 디폴트값(원래의 시간)
		$("#openH" + openhour).val(openhour).attr("selected", "selected");
		$("#openM" + openminuite).val(openminuite).attr("selected", "selected");
		$("#closeH" + closehour).val(closehour).attr("selected", "selected");
		$("#closeM" + closeminuite).val(closeminuite).attr("selected", "selected");
		
		 
		

	});
		function goPopup() {
			var pop = window.open("/nightfoodfinder/api/jusoPopup.jsp", "pop",
					"width=570,height=420, scrollbars=yes, resizable=yes");
		}

		function jusoCallBack(roadFullAddr, zipNo, addrDetail, sggNm) {
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.addrDetail.value = addrDetail;
			document.form.zipNo.value = zipNo;
			document.form.sggNm.value = sggNm;

		}
		
		/* 
			if ($("#openH").val() < 10) {
				$("#openH").val() = '0' + $("#openH").val();
			}

			let open = '${store.openTime}'; 
			let time = open.split(":");
			let openhour = time[0].substr(1, 1);
			$("#openH").val() = openhour;
			console.log(openhour); */

		
			//     $("select option[value=`${store.openTime}`]").attr("selected", true);
			

			
	</script>
</body>
</html>