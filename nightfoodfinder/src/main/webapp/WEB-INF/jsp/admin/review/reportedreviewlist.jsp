<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/font-awesome.min.css" />">
    <link rel="stylesheet" href="<c:url value="/resources/css/admin/admin_style.css" />">
    

    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
 <c:import url="/WEB-INF/jsp/include/adminsidemenu.jsp" />
      
      <main role="main">
       
      
        <section class="panel ">
          <h2>신고 리뷰</h2>
         
          
          <!---------- 서치 ---------->
				<div class="form-group row justify-content-center">
				
					<select class="totalSearchType" name="totalSearchType" id="totalSearchType" >
						<c:choose>
							<c:when test="${pagination.totalType eq 'all'}">
								<option value="all" selected>모두</option>
								<option value="block">차단</option>
								<option value="break">정상</option>
							</c:when>
							<c:when test="${pagination.totalType eq 'block' }">
								<option value="all" >모두</option>
								<option value="block" selected>차단</option>
								<option value="break">정상</option>
							</c:when>
							<c:otherwise>
								<option value="all" >모두</option>
								<option value="block" >차단</option>
								<option value="break" selected >정상</option>
							</c:otherwise>
						</c:choose>
					</select>
				
						<select class="form-control form-control-sm" name="searchType" id="searchType">
							<c:choose>
								<c:when test="${pagination.type eq 'storeName'}">
									<option value="nickName">닉네임</option>
									<option value="storeName" selected>가게 이름</option>
								</c:when>
								<c:otherwise>
									<option value="nickName" selected>닉네임</option>
									<option value="storeName">가게 이름</option>
								</c:otherwise>
							</c:choose>
						</select>
						<input type="text" class="form-control form-control-sm"
							name="keyword" id="keyword" value="${pagination.keyword}">
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
						<button class="back" name="backList" id="backList"
							onclick="location.href='/nightfoodfinder/admin/review/reportedreviewlist.do'">검색취소</button>
				</div>
			<!---------- 서치 끝 --------->
			
			
 			<div class="searchcnt-review">전체 : ${pagination.listCnt}개</div>
			
			 <table id="review-table">
			 
			<li>
				<div class="allCheck">
				<input type="checkbox" id="allCheck" name="allCheck" />
				<label for="allCheck">모두 선택</label>
				</div>
			</li>

			
			<tr>
				<th class="choice">선택</th>
				<th>리뷰 쓴 사람 닉네임</th>
				<th>가게 이름</th>
				<th>리뷰</th>
				<th>리뷰 단 날짜</th>
				<th>신고 횟수</th>
				<th>차단 여부</th>
			</tr>
			<div id="pppp">
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">리뷰가 없습니다.</td>
				</tr>
			</c:if>
			
			
			<c:forEach var="li" items="${list}">
			
				<tr>
					<td><input type="checkbox" class="checkboxid" id="checkboxid" name="reviewNo" data-reviewNo="${li.reviewNo}"/></td>
					<td>${li.nickName}</td>
					<td>${li.storeName}</td>
 					<td class="myBtn" id="myBtn" data-reviewNo="${li.reviewNo }" onClick="reportmodal(${li.reviewNo}, 1,'${li.reviewContent }')"
						style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">${li.reviewContent }</td>	
					<td>${li.regDate }</td>
					<td>${li.reportCount }</td>
					<td class="block">
						<c:choose>
						<c:when test="${li.status eq 0 }">
						정상
						</c:when>
						<c:otherwise>
						차단
						</c:otherwise>
					</c:choose>
					</td>

				</tr>
			</c:forEach>
</div>
      
           
          </table>
          
       <!-- 체크박스 차단, 차단 풀기 -->
		<div>
		<button type="button" class="bbutton" id="blockbutton" onclick="block()">차단하기</button>
  		<button type="button" class="bbutton" id="breakbutton" onclick="bk()">차단 풀기</button> 	 
		</div>
        <!------------ 페이징 ---------------->

		<div id="paginationBox">
			<ul class="pagination">
			<!-- 이전 버튼 -->
				<c:if test="${pagination.prev}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_prev( '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
					</li>
				</c:if>
				
			<!-- 페이지 버튼 -->
				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
						<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}')">${idx}</a>
					</li>
				</c:forEach>

			<!-- 다음 버튼 -->
				<c:if test="${pagination.next}">
					<li class="page-item"><a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', '${pagination.rangeSize}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>

		<!------------ 페이징 끝----------------->
                
    
        <!----------- 모달팝업 ----------------->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content-reportreview">
				<span class="close">&times;</span>
				<p></p>
				<div class="one">
				</div>
				<div class="two">
				</div>
			<div id="paginationBox_two"></div>
			</div>

		</div>
		<!----------- 모달팝업 끝 ---------------->
        </section>
      
      
      
      
      
      <script>
		
		/* ----------------------- 모달팝업, 모달 페이징 -------------------------- */
		// 모달 가져온다.
		var modal = document.getElementById('myModal');

		// 모달 여는 버튼을 가져온다.
		var btn = document.getElementsByClassName("myBtn");

		// 모달을 닫는 <span>을 가져온다.
		var span = document.getElementsByClassName("close")[0];

		
		
		// 버튼을 클릭했을 때, 모달을 연다. 모달 내 페이징
	
		let content = "";
		function reportmodal(reviewNo, pageNo, c) {
			if (c) content = c;
			var data = {};
			data["reviewNo"] = reviewNo;
			data["page"]  = pageNo;
			
//			data["page"] = page;
		//	data["range"] = range;
			console.log(data);

			$.ajax({
				url: "${pageContext.request.contextPath}/admin/review/reportmodal.do",
				type: "POST",
				data: data,
				dataType: "json",
				success: function(data){
					console.log(data);
					$("#myModal").data("reviewNo", reviewNo);
					modal.style.display = "block";
					$(".modal-content-reportreview p:eq(0)").text(
							"리뷰: " +  content) 
					$(".modal-content-reportreview div").empty()
					for(var i=0; i< data.list.length; i++){
						$(".modal-content-reportreview div.one").append("<p>" + data.list[i].reason + "</p>")
											    //  .append("<li>" + data.list[i].nickName + "</li>")
						$(".modal-content-reportreview div.two").append("<p>" + data.list[i].nickName + "</p>")

						console.log(data.list[i].reason);
						console.log(data.list[i].nickName);
					}


					let html = `<ul class="pagination_two">`;
					
					<!-- 이전 버튼 -->
					if (data.paginationtwo.prev) {
						
						html += `<li class="page-item_two"><a class="page-link_two" href="#\${data.paginationtwo.startPage - 4}"
							onClick="reportmodal(\${reviewNo}, '\${data.paginationtwo.startPage - 1}')">Previous</a>
							</li>`;
					}	
						
					<!-- 페이지 버튼 -->

						for (let i = data.paginationtwo.startPage; i <= data.paginationtwo.endPage; i++)	{
					
							
							if (data.paginationtwo.page == i ){
								html += `<li class="page-item_two active">`;
							} else {
								html += `<li class="page-item_two">`;
							}
							html += `
								<a class="page-link_two" href="#\${i}"
								onClick="reportmodal(\${reviewNo}, '\${i}')">\${i}</a>
							</li>`

						}

					<!-- 다음 버튼 -->
					if (data.paginationtwo.next) {
						
						html += `<li class="page-item_two"><a class="page-link_two" href="#\${data.paginationtwo.endPage + 1}"
								onClick="reportmodal(\${reviewNo}, '\${data.paginationtwo.endPage + 1}')">Next</a>
							</li>`;
					}	


					html += `</ul>`;
					
					$("#paginationBox_two").html(html);

				}
			});
	}
		
		
		
		
		
		/*
		function reportmodal(a) {

			var rno = $(a).attr("data-reviewNo");
			console.log(rno);
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/review/reportmodal.do",
				type: "POST",
				data: { reviewNo : rno },
				dataType: "json",
				success: function(data){
					
					modal.style.display = "block";
					$(".modal-content p:eq(0)").text(
							"리뷰: " + $(a).text()) 
					$(".modal-content div").empty()
					for(var ele in data){
						$(".modal-content div").append("<p>" + data[ele].reason + "</p>")
											   .append("<p>" + data[ele].nickName + "</p>")
					

				//		console.log(data[ele].reason);
				//		console.log(data[ele].nickName);
					}
			

				}
			});
	}
		
				
	*/
		
		

		// <span>의 x를 클릭했을 때, 모달을 닫는다.
		span.onclick = function() {
			modal.style.display = "none";
		}
		// 모달 밖의 아무 곳을 클릭했을 때, 모달을 닫는다.
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		/* ------------------------ 서치 -------------------------- */
		$(document).on('click', '#btnSearch',
					function(e) {
						e.preventDefault();
						var url = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
						url = url + "?totalSearchType=" + $('#totalSearchType option:selected').val();
						url = url + "&searchType=" + $('#searchType option:selected').val();
						url = url + "&keyword=" + $('#keyword').val();
						console.log(url);
						location.href = url;
					});
		/* ----------------------- 페이징 --------------------------- */

		//이전 버튼 이벤트
		function fn_prev(range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&totalSearchType=" + $('#totalSearchType option:selected').val();
			url = url + "&searchType=" + $('#searchType option:selected').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		}

		//페이지 번호 클릭
		function fn_pagination(page, range) {
			var url = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&totalSearchType=" + $('#totalSearchType option:selected').val();
			url = url + "&searchType=" + $('#searchType option:selected').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		}

		//다음 버튼 이벤트
		function fn_next(range, rangeSize) {
			var page = parseInt((range * rangeSize)) + 1;
			var range = parseInt(range) + 1;
			var url = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
			url = url + "?page=" + page;
			url = url + "&range=" + range;
			url = url + "&totalSearchType=" + $('#totalSearchType option:selected').val();
			url = url + "&searchType=" + $('#searchType option:selected').val();
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
		}
		
		
		/* ---------------- 체크박스 차단 : ajax 사용 (db의 status를 업데이트) ----------------- */
		
		function block() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='reviewNo']");
			for (let i = 0; i < chk.length; i++) {	// chk.length : 한 페이지에 있는 체크박스 개수
				if (chk[i].checked) {
					cnt++;	// 체크박스를 선택하고 클릭하는지 확인하기 위해서
			
					// chk[i] : <input type="checkbox" id="myCheckboxid" name="reviewNo" data-reviewNo=..." >
					// db에서 status를 가져오지 않고 화면 상에서 글자만 바꿔준다. - 체크선택하고 차단버튼을 누르면 글자가 차단으로 바뀐다. 
					let block = $(chk[i]).parent().parent().find(".block").text("차단");}
				}
			if (cnt == 0) {
				alert("차단할 리뷰를 선택하세요.");
				return;
			}


			// reviewNoArr을 status=1&reviewList=1&reviewList=3 이런식으로 만들 것임
			var reviewNoArr = new Array();
			reviewNoArr.push("status=1");	// 고정된 값이어서 미리 푸쉬
			$("input[name='reviewNo']:checked").each(function(){	// each : j쿼리의 반복문
				reviewNoArr.push("reviewNoList=" + $(this).attr("data-reviewNo"));
			});
			console.log(reviewNoArr.join("&"));
			reviewNoArr = reviewNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/review/block.do",
				type: "POST",
				data: reviewNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
				}
			});
			
			// 체크되고 클릭된 것의 체크 표시를 없애준다.
			 for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) 
						$(chk[i]).prop('checked', false);
				}
			
			// 체크되어 있었던 모두선택의 체크 표시 없애준다.
			$("#allCheck").prop("checked", false);
			
			}



		/* ---------------- 체크박스 차단 풀기 : ajax 사용 (db의 status를 업데이트) ----------------- */

		function bk() {
			let cnt = 0;
			let chk = document.querySelectorAll("input[name='reviewNo']");
			for (let i = 0; i < chk.length; i++) {	// chk.length : 한 페이지에 있는 체크박스 개수
				if (chk[i].checked) {
					cnt++;	// 체크박스를 선택하고 클릭하는지 확인하기 위해서
					
					// chk[i] : <input type="checkbox" id="checkboxid" name="reviewNo" data-reviewNo=..." >
					// db에서 status를 가져오지 않고 화면 상에서 글자만 바꿔준다. - 체크선택하고 체크풀기 버튼을 누르면 글자가 정상으로 바뀐다. 
					let block = $(chk[i]).parent().parent().find(".block").text("정상");}
				}
			if (cnt == 0) {
				alert("차단을 풀어줄 리뷰를 선택하세요.");
				return;
			}
			
			
			// reviewNoArr을 status=0&reviewList=1&reviewList=3 이런식으로 만들 것임
			var reviewNoArr = new Array();
			reviewNoArr.push("status=0");	// 고정된 값이어서 미리 푸쉬
			$("input[name='reviewNo']:checked").each(function(){	// each : j쿼리의 반복문
				reviewNoArr.push("reviewNoList=" + $(this).attr("data-reviewNo"));
			});
			console.log(reviewNoArr.join("&"));
			reviewNoArr = reviewNoArr.join("&");
			
			$.ajax({
				url: "${pageContext.request.contextPath}/admin/review/block.do",
				type: "POST",
				data: reviewNoArr,
				dataType: "json",
				success: function(){
					location.href = "${pageContext.request.contextPath}/admin/review/reportedreviewlist.do";
				}
			});
			
			// 체크되고 클릭된 것의 체크 표시를 없애준다.
			 for (let i = 0; i < chk.length; i++) {
					if (chk[i].checked) 
						$(chk[i]).prop('checked', false);
			 }
				
			// 체크되어 있었던 모두선택의 체크 표시 없애준다.
			$("#allCheck").prop("checked", false);
			
			}

			

	/* ----------------- 체크박스 모두선택 ------------------------ */
	
		$("#allCheck").click(function(){
			var chkall = $("#allCheck").prop("checked");
			if(chkall) {
				$(".checkboxid").prop("checked", true);
			} else {
				$(".checkboxid").prop("checked", false);
				}
		});
	
		// 모두선택되었을 때 체크박스를 하나라도 풀면 모두선택이 체크 표시가 없어지게 된다.
		$(".checkboxid").click(function(){
		$("#allCheck").prop("checked", false);
		 });
		

      
      </script>
      
      
      </main>
      <footer role="contentinfo">Easy Admin Style by Melissa Cabral</footer>
</body>
</html>