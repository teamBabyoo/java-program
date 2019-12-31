<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<c:import url="/WEB-INF/jsp/include/head.jsp">
	<c:param name="msg" value="가게정보수정" />
</c:import>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e2c217701074a631a1029878ed30d6f&libraries=services"></script>

<title>Store Join Page</title>
</head>
<body>
	<div class="wrapper sInfoUpdate_wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<div class="content">
			<div id="storeupdateForm">
				<div id="storeinfoTitle">가게정보 수정하기</div>
				<form id="updateForm" name="form" action="storeinfoupdate.do" method="post">
					<table>
						<tr>
							<th class="thcolor">가게 이름</th>
							<td><input type="text" name="storeName"
								value="${store.storeName}" /></td>
						</tr>
						<tr>
							<th class="thcolor">사업자 번호</th>
							<td>${store.businessNum}</td>
						</tr>
						<tr>
							<th class="thcolor">이메일</th>
							<td>${store.storeEmail}</td>
							<td><div id="emailChk"></div></td>
						</tr>
						<%-- 
						--%>
						<tr>
							<th class="thcolor">비밀번호</th>
							<td><input type="password" id="storePass" name="storePass" />
								<div id="pwChk">
									<span id="alert-success" style="display: none;">비밀번호가
										일치합니다.</span>
								</div></td>
						</tr>
						<tr>
							<th class="thcolor">비밀번호 확인</th>
							<td><input type="password" id="storePass2" name="storePass2" />
								<div id="pwChk2">
									<span id="alert-success" style="display: none;">비밀번호가
										일치합니다.</span> <span id="alert-danger"
										style="display: none; color: red">비밀번호가 일치하지 않습니다.</span>
								</div></td>
						</tr>
						<tr>
							<th class="thcolor">가게 전화번호</th>
							<td><input type="text" name="storeTell"
								value="${store.storeTell}" /></td>
						</tr>
						<tr>
							<th rowspan="4" class="thcolor">주소</th>
						</tr>
						<tr>
							<td><input type="text" id="zipNo" name="zipNo" value="${store.zipNo}" /> 
							<input type="hidden" id="sggNm"	name="city" value="${store.city}" /> 
							<input type="button" id="findAddr" onClick="goPopup();"	value="주소찾기" /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;"
								id="roadFullAddr" name="streetLoad" value="${store.streetLoad}" /></td>
						</tr>
						<tr>
							<td><input type="text" style="width: 300px;" id="addrDetail"
								name="addrDetail" value="${store.addrDetail}" /></td>
						</tr>

						<tr>
							<th class="thcolor">영업 시간</th>
							<td><select name="openH">
									<c:forEach begin="0" end="24" var="i">
										<option id="openH${i}" value="${i}">${i}</option>
									</c:forEach>
							</select>시 <select name="openM">
									<c:forEach begin="0" end="59" var="i">
										<option id="openM${i}" value="${i}">${i}</option>
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
							<th class="thcolor">휴무일</th>
							<td><input type="checkbox" name="day" value="1" />월 <input
								type="checkbox" name="day" value="2" />화 <input type="checkbox"
								name="day" value="3" />수 <input type="checkbox" name="day"
								value="4" />목 <input type="checkbox" name="day" value="5" />금
								<input type="checkbox" name="day" value="6" />토 <input
								type="checkbox" name="day" value="7" />일</td>
						</tr>
						<c:forEach items="${menulist}" var="m" varStatus="status">
							<tr name="trMenu">
								<c:choose>
									<c:when test="${status.index == 0}">
										<th class="thcolor" rowspan="${fn:length(menulist)}" id="rowTh">대표 메뉴 / 가격</th>
										<td><input type="text" class="tdline" name="menuName" value="${m.menu}">
											<input type="number" class="tdline" name="menuPrice" value="${m.price}">
											<i class="fa fa-plus-square-o" aria-hidden="true" id="plus_btn"></i> 
											<i class="fa fa-minus-square-o"	aria-hidden="true" id="minus_btn"></i></td>
									</c:when>
									<c:otherwise>
										<td class="clearboth">
										    <input type="text" class="tdline" name="menuName" value="${m.menu}">
											<input type="number" class="tdline" name="menuPrice" value="${m.price}">
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						<tr>
							<th class="thcolor">가게 분류</th>
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
							<th class="thcolor">소개글</th>
							<td><textarea rows="10" cols="40" name="storeContent">
								 ${storeContent.storeContent}
								</textarea></td>
						</tr>
						<tr>
							<th class="thcolor">대표자 이름</th>
							<td><input type="text" name="storeOwner"
								value="${store.storeOwner}" /></td>
						</tr>
						<tr>
							<th class="thcolor">대표자 휴대폰 번호</th>
							<td><input type="text" name="storeOwnerPh"
								value="${store.storeOwnerPh}" /></td>
						</tr>
					</table>
					<input type="hidden" name="openTime" /> 
					<input type="hidden" name="closeTime" /> 
					<input type="hidden" name="storeNo"	value="${store.storeNo}" /> 
					<input type="hidden" id="entX" name="entX" value="${store.longitude}"/> 
					<input type="hidden" id="entY" name="entY" value="${store.latitude}"/>

					<div id="updateBtn">
						<button type="button" class="report" >수정하기</button>
					</div>
				</form>
			</div>
		</div>
		<div id="footerEle">
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	    <!-- 팝업 백그라운드  -->
	    <div class="bgbox"></div>
	</div>
	<script>
	let mlist = ${fn:length(menulist)} ;
	console.log("리스트", mlist);
	//이메일 중복체크
	$("#storeEmail").blur(function() {
			var storeEmail = $('#storeEmail').val();
			$.ajax({
				url : '${pageContext.request.contextPath}/front/login/storeEmailChk.do?storeEmail='+ storeEmail,
				success : function(data) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);							
					
					if (data == 1) {
							// 1 : 아이디가 중복되는 문구
							$("#emailChk").text("사용중인 이메일입니다");
							$("#emailChk").css("color", "red");
							$("#reg_submit").attr("disabled", true);
						} 
					else {
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
							
						} 
					}, error : function() {
							console.log("실패");
							console.log(data);
					}
				});
			});
	
	//주소입력 팝업부분
	function goPopup(){
		var pop = window.open("/nightfoodfinder/api/addrPop.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,zipNo,addrDetail,sggNm){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		let rrr = roadFullAddr.split(',');
		console.log(rrr[0]);
		document.form.streetLoad.value = rrr[0];
		document.form.zipNo.value = zipNo;
		document.form.addrDetail.value = rrr[1];
		document.form.city.value = sggNm;
		
		
		var geocoder = new kakao.maps.services.Geocoder();
		var callback = function (result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        console.log(result);
		        document.form.entX.value = result[0].x;
		        document.form.entY.value = result[0].y;
		        
		    }
		};
		geocoder.addressSearch(roadFullAddr, callback);  
	}
	
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
		if(closetime[0] >= 24 && closetime[0] <= 36){
			closehour *= 1;
			closehour = closetime[0] - 24;
			closehour += "";
		}
		else if(closetime[0].substr(0, 1) < 1){
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
		let holiList = JSON.parse('${holidaylist}');

		for (let i = 0; i < holiList.length; i++) {
			$('input:checkbox[name="day"]').each(function() {
				if (this.value == holiList[i].weekNo) {
					this.checked = true;
				}
			});
		}
	});
	

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
	       $('#pwChk').text("");
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
	    $('#pwChk').text('사용가능한 비밀번호입니다');
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
								
							} else {
								
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
		 let row = $("#rowTh").attr("rowspan");
		$("#rowTh").attr("rowspan", (row*1)+1); 
		 var addMenu =  '<tr name="trMenu">'+
			'<td>'+
				'<input type="text" name="menuName">'+
				'<input type="number" name="menuPrice">'+
		'</tr>'; 
		/*var addMenu =  '<tr name="trMenu">'+
			'<td>'+
				'<input type="text" name="menuName">'+
				'<input type="number" name="menuPrice">'+
		'</tr>';*/

	var trHtml = $( "tr[name=trMenu]:last" ); 
	trHtml.after(addMenu); 
	}

	function delRow () {
		let row = $("#rowTh").attr("rowspan");
		$("#rowTh").attr("rowspan", (row*1)-1); 
		var trHtml =$( "tr[name=trMenu]:last" );
	    if ($( "tr[name=trMenu]" ).length ==1) return;
	    trHtml.remove(); //tr 테그 삭제
		
	}
				
	
	$("#updateBtn").click(() => {
	      let nameFlag = true;
		  $('input[name="menuName"]').each(function() {
			  console.log("메뉴",$(this).val());
			  if($(this).val() == "") { 
				  nameFlag = false;
			  }
		    });
		   let priceFlag = true;
		  $('input[name="menuPrice"]').each(function() {
			  if($(this).val() == "") {
				  
				  priceFlag = false;
			  } });
		  
		     if (nameFlag == false) {
		    	 alert("메뉴를 입력하세요");
		     } else if (priceFlag == false){
		    	 alert("가격을 입력해주세요");
		     }else if (document.form.storeName.value == "") {
			        alert("가게이름을 입력하세요");
			        document.form.storeName.focus();
			      } else if (document.form.storeTell.value == "") {
			        alert("전화번호를 입력하세요");
			        document.form.storeTell.focus();
			      } else if (document.form.addrDetail.value == "") {
			        alert("상세주소를 입력하세요");
			        document.form.addrDetail.focus();
			      } else if (document.form.streetLoad.value == "") {
			        alert("주소를 입력하세요");
			        document.form.streetLoad.focus();
			      } else if(document.form.storeOwner.value == "") {
			    	  alert("대표자 이름을 입력하세요");
			        document.form.storeOwner.focus();
			      } else if(document.form.storeOwnerPh.value == "") {
			    	  alert("대표자 휴대전화 번호를 입력하세요");
			        document.form.storeOwnerPh.focus();
			      } else if(document.form.storePass.value == ""){
			    	  alert("비밀번호를 입력하세요");
			    	  document.form.storePass.focus();
			      } else if(document.form.storePass2.value == ""){
			    	  alert("비밀번호 확인칸을 입력하세요");
			    	  document.form.storePass.focus();
			      } else { 
			    	  
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
			$("#updateForm").submit();  
			}
		     
	});	
		

		
		
	</script>
</body>
</html>