/*단골등록을 위한*/
function checkFrequent(){
	$.getJSON({
		url: "frequent_check.do",
		data: {storeNo, userNo},
		success: list => makeFrequent(list),
		complete: function() { reposition(); }
	});
	return false;
}
checkFrequent();

/*단골 등록하기*/
function makeFrequent(list) {
	// list 가 1이면 등록된 가게
	// 0이면 등록되지 않은 가게
	
	$(".frequent").off();
   if(list) {
	   $(".frequent i").attr("class", "fa fa-bookmark").css("color", "red");
	   $(".frequent").click(()=>{
		   alert("단골취소을 취소되었습니다");
		   frequentRegist("frequent_delete.do");
		   $(".frequent i").attr("class", "fa fa-bookmark-o").css("color", "#77747d");
		   
	   });
	   
   } else {
	   $(".frequent i").attr("class", "fa fa-bookmark-o");
	   $(".frequent").click(()=>{
		   alert("단골등록");
		   frequentRegist("frequent_regist.do");
		   $(".frequent i").attr("class", "fa fa-bookmark").css("color", "red");
	   });
	   
   }
}


function frequentRegist(urlhtml) {
	$.getJSON({
		url: urlhtml,
		data: {storeNo, userNo},
		success: (list) => {
			makeFrequent(list)
		},
		error: function(e) {
		} 
	});
	return false;
}
	


/*별점 애니메이션*/
function animateValue(id, start, end, duration) {
    let range = start + end;
    let current = start;
    let increment = start > end? 0 : 0.1;
    let stepTime = Math.floor(duration / range);
    let obj = document.getElementById(id);
    let timer = setInterval(function() {
        current += increment;
        obj.innerHTML = current.toFixed(1);
        if (current > end) {
            clearInterval(timer);
        }
    }, stepTime);
}
animateValue("scopescore", 0, scope, 100);

	let close = closeTime.split(":");
	let closehour = '';
	if(close[0] >= 24 && close[0] <= 36) {
		closehour *= 1;
		closehour = close[0] - 24;
		closehour += "";
		closehour = "0"+closehour;
	}
	closeTime = closehour+":"+close[0];
	console.log(closeTime);
	
	$("#operatingtime").html(openTime +" ~ " +closeTime);

	
//리뷰 리스트 가져오는 에이작스 	
function reviewListAjax() {
	$.ajax({
		url: "review_list.do",
		data: {
			storeNo, 
			userNo,
			page:1,
			range:1
			},
		success: list => makeReviewList(list),
		complete: function() { reposition(); }
	});
}



function toPad(val) {
	return val < 10 ? "0" + val : val;
}	

//#commentplace 안에 넣어주기 
//리뷰 리스트 뿌려주기	
function makeReviewList(list){
	console.dir(list);
	console.log(list.pagination);
	let pagination = list.pagination;
	let $tbl = $("<div class='user_rv'></div>");
	if(list.length == 0){
		$tbl.append(` 작성된 리뷰가 없습니다.`);
	}
	var reviewNoArray = [];
	/*
	list = jQuery.map(list, function(n, i) {
		  console.log(n, 0);
		});
	var str = "";
	for(key in list) {
		str += key+"="+list[key]+"\n";
		console.log("str", str);
	}*/
	let reviewList = list.list;
	console.log("reviewLsit", reviewList);

	
	$.each(reviewList, (i, r) => {
		
		
		/*reviewNoArray.push(`${r.reviewNo}`);
	
	console.log(reviewNoArray);
		 */
	

		var date = new Date(r.regDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + toPad(date.getHours()) + ":"
		         + toPad(date.getMinutes()) + ":"
		         + toPad(date.getSeconds());
		let scopeCnt = '';
		if(`${r.storeScope}` == "1"){
			scopeCnt = "★";
		} else if (`${r.storeScope}` == "2"){
			scopeCnt = "★★";
		} else if (`${r.storeScope}` == "3"){
			scopeCnt = "★★★";
		} else if(`${r.storeScope}` == "4"){
			scopeCnt = "★★★★";
		} else {
			scopeCnt = "★★★★★";
		}
		
		if(i == 0){
			let html = "";
			html += `<div class="user_rv best_rv">
				  <div class="tenten">
			  	<button type="button" class="report" value="${r.reviewNo}">신고하기</button>`
			  	if (r.recomment == null){
					html += `
				<button type="button" class="reComment" data-no="${r.reviewNo}" onclick="makeform(this)">답장하기</button>`;
				}
		html+= `
			  </div>
            <ul class="clearboth">
                <li>
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                    <p>★★★★</p>
                </li>
                <li>
                    <ul>
                        <li>${r.nickName}<span>${r.regDate}</span></li>
                        <li>${r.reviewContent}</li>    
                    </ul>
                </li>
                <li class="clearboth">
                    <p>`;
			
			if(`${r.mylikecheck}` === '0' ) {
				html += `<img class="heartclick" data-rno="${r.reviewNo}" src="` + context + `/resources/images/empty_hrt.png" />`;
			} else {
				html += `<img class="heartclick" data-rno="${r.reviewNo}" src="` + context + `/resources/images/icon_hrt.png" />`;
			}

			html += `</p>
	                <p>${r.good}</p>
	                </li>
	            </ul>
	        </div>`;
			
			// 답글 내용
			if (r.recomment != null) {
				html += `
				<table>
					<tr id="row${r.reviewNo}">
					<td>${r.recomment}</td>
					<td>${r.reCommentRegDate}</td>
					<td><button type="button" data-no="${r.reviewNo}" class="delRecomment">삭제</button>	
						<button type="button" data-no="${r.reviewNo}" class="modRecomment">수정</button>	
					</td>
					</tr>
					</table>`;
			}
			
			// 답글 등록 폼
			html += `<div id="bossComment${r.reviewNo}" class="bossComment" data-rno="${r.reviewNo}">

					</div>	
	        `;
			$tbl.append(html);
				
		}
		else {
			html = "";
			html += `
			<div class="user_rv">
				<div class="tenten">
					<button type="button" class="report"  value="${r.reviewNo}">신고하기</button>`
			  	if (r.recomment == null){
					html += `
				<button type="button" class="reComment" data-no="${r.reviewNo}" onclick="makeform(this)">답장하기</button>`;
				}
		html+= `
				</div>
                <ul class="clearboth">
                    <li>
                        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                        <p>` + scopeCnt + `</p>
                    </li>
                    <li>
                        <ul>
                            <li>${r.nickName}<span>${time}</span></li>
                            <li>${r.reviewContent}</li>    
                        </ul>
                    </li>
                    <li class="clearboth">`
                        if(`${r.mylikecheck}` === '0' ) {
							html += `<img class="heartclick" data-rno="${r.reviewNo}" src="` + context + `/resources/images/empty_hrt.png" />`;
						} else {
							html += `<img class="heartclick" data-rno="${r.reviewNo}" src="` + context + `/resources/images/icon_hrt.png" />`;
						}
			html += `<p>${r.good}</p>
                    </li>
                </ul>
            </div>`;
			
			// 답글 내용
            if (r.recomment != null) {
				html += `
					<table>
					<tr id="row${r.reviewNo}">
					<td>${r.recomment}</td>
					<td>${r.reCommentRegDate}</td>
					<td><button type="button" data-no="${r.reviewNo}" class="delRecomment">삭제</button>	
						<button type="button" data-no="${r.reviewNo}" class="modRecomment">수정</button>	
					</td>
					</tr>
					</table>`;
			}
	        
	        	
			// 답글 등록 폼 들어가는 거
			html += `<div id="bossComment${r.reviewNo}" class="bossComment" data-rno="${r.reviewNo}">

					</div>
            `;
			$tbl.append(html);
		
		}
	});

	$("#targetContainer").html($tbl);
	let pageEle = "";
	
	$("#paginationBox").html("");
	pageEle += `<ul class="pagination">`;
	//에러 잡아야 한다
	if (pagination.prev === 'true') {
		pageEle += `
		<li class="page-item">
			<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> Previous</a>
		</li>
		`
	}
	for (let idx = `${pagination.startPage}`; idx <= `${pagination.endPage}`; idx++) {
		if (`${pagination.page}` == idx) {
			pageEle += `
			<li class="page-item active">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')" data-page="${idx}"> ${idx} </a>
			</li>
			`;
		} else {
			pageEle += `
			<li class="page-item">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
			</li>
			`;
		}
	}
	if (`${pagination.next}`  === 'true') {
		pageEle += `
			<li class="page-item">
			<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
			</li>
		`;
	}
	pageEle += `
		</ul>
	`;
	$("#paginationBox").append(pageEle);
	
}
/**
 * footer top값 재설정
 * @returns
 */
function reposition() {
	let $height_header = $('header').height();
	let $height_content = $('.content').height();
	let $top_footer = $('footer').offset().top;
	let $height_leave_rv = $('.leave_rv').height
//	console.log('$height_content', $height_content);
//	console.log('$height_header ->', $height_header);
//	console.log('$top_footer ->', $top_footer);
	$('footer').css('top', $height_header + $height_content + $height_leave_rv);
	$('footer').css('top', $height_header + $height_content);
}



/**
 * 댓글 등록
 * @returns
 */
function registReview() {
	let reviewContent = $('textarea[name="reviewContent"]').val();
	let form = $('#reviewForm');
	let data = new FormData(form);
	$.ajax({
		type: "POST",
		enctype: "multipart/form-data",
		url: "review_regist.do",
		data: data,
		dataType: "json",
        processData: false,
        contentType: false,
        success: function(data) {
        	alert('성공');
        },
        error: function(e) {
        	console.log("ERROR : ", e);
            alert("fail");
        }
	});
};


/*
		// Get form
        var form = $('#fileUploadForm')[0];
 
        // Create an FormData object 
        var data = new FormData(form);
 
       // disabled the submit button
        $("#btnSubmit").prop("disabled", true);
 
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/document/upload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (data) {
                alert("complete");
                $("#btnSubmit").prop("disabled", false);
            },
            error: function (e) {
                console.log("ERROR : ", e);
                $("#btnSubmit").prop("disabled", false);
                alert("fail");
            }
        });
*/

/**
 * 리뷰 별점 전처리
 * @returns
 */
$('#scopePannel > a').click(function(e) {
	// 모든 별을 기본색상으로 초기설정
	$pchildren = $(e.target).parent().children();	
	$pchildren.css('color', '#7f7f7f');
	
	// 위로 튐 방지
	e.preventDefault();
	// storeScope --> n점 (n번째 별)
	storeScope = parseInt($(e.target).attr('data-rscope'));
	console.log("현재별점: ", storeScope);
	// 현재 클릭한 별의 형제 요소의 길이만큼 반복문 돌리며 rscope값이 작을 경우 색상변경(e.target 포함)
	for (let i = 0; i < $(e.target).siblings().length; i++) {
		let $sibling = $(e.target).siblings().eq(i);
		console.log(i, "번째 siblings : ", $sibling.attr('data-rscope'));
		if (parseInt($sibling.attr('data-rscope')) <= storeScope){
			if ($sibling.attr('data-rscope') == '1') {
				$sibling.css('color', 'yellow');
			}
			console.log(i, "번째 적용됨 : ", $sibling.attr('data-rscope'));
			$(e.target).css('color', 'red');
			$sibling.css('color', 'red');
		}
	}
});

/**
 * 공유하기
 * @returns
 */
function copyText(text) {
	var temp = document.createElement('input');
	document.body.appendChild(temp);
	temp.vale = text;
	temp.select();
	document.execCommand('Copy');
	document.body.removeChild(temp);
	alert('클립보드로 복사되었습니다.');
}
$(document).ready(function() {
	reviewListAjax();
	// 상세페이지 (리뷰)
//	$('.leave_rv').hide();
/*	$('#btn_leave_rv').click((e) => {
//		reposition();
		$('.leave_rv').slideToggle();
	});
*/	
	$('.sharePop p').html(location.href);
	
	$('#copyclip').on('click', function() {
		copyText(location.href);
	});
	
});



//신고하기
$(document).on('click', '.report', function(e){
	//신고 클릭시 했던 신고자인지
	
	//유저번호 들어오는지
	console.log("유저번호", userNo);
	let page = $(".page-item.active a").attr("data-page");

	//review_no를 받기위해	
	let rNo = e.target;
	console.log(rNo);	
	$.post({
		url: "review_report_check.do",
		data: {userNo, reviewNo: rNo.value},
		dataType: "json",
		success: (count) => reviewReport(count, rNo, page)
	});
	return false;
	


});

function reviewReport(count, rNo, page) {
	console.log("카운트", count, "글번호", rNo);
	if(count == 0) {
		//신고사유 모달창
		let rpop = $("#rmyModal");
		//사유 모달창 띄우기
		rpop.css("display", "block");
		
		$("#rmyModal *").remove();
		let rcon = $("#rmyModal");
		
		rcon.append(
		`
		<form id="reportsubmit" method="post" action="review_report.do">
	    <div class="rmodal-content">
	    <input type="hidden" id="reviewNo" value="`+rNo.value+`" />
	      <span class="rclose">&times;</span>                                                               
	       <ul>
			 <li><input type="radio" name="reportWhy" value="1" /> 기타</li>
			 <li><input type="radio" name="reportWhy" value="2" /> 음란</li>
			 <li><input type="radio" name="reportWhy" value="3" /> 폭력성, 유해</li>
			 <li><input type="radio" name="reportWhy" value="4" /> 광고</li>
			</ul>
			<input type="hidden" id="reportWhy" value="$('input[name=reportWhy]:checked').val()" />
	    	<input type="hidden" id="storeNo" value="`+storeNo+`" />
	    	<input type="hidden" id="userNo" value="`+userNo+`" />
			<button>제출하기</button>
	    </div>
		</form>
		`
		);
		//밸류 값 들어오는지 확인용
		/*console.log($("#reviewNo").val());
		console.log($("#reportWhy").val());
		console.log($("#storeNo").val());*/
		console.log($("#userNo").val());

		//모달창 닫기
		$(".rclose").click(()=>{
			rpop.css("display", "none");
		});
//		$('input[name=reportWhy]').change((e) => {
//			console.log(e.target);
//		})
		// 리뷰신고 등록
		$("#reportsubmit").submit(() => {
			let userNo = 3;
			$.post({
				url: "review_report.do",
				type: "POST",
				data: {
					page,
					userNo: $("#userNo").val(),
					reviewNo: $("#reviewNo").val(), 
					reportWhy: $('input[name=reportWhy]:checked').val(),
					storeNo: $("#storeNo").val()
					},
				dataType: "json",
				success: (list) => makeReviewList(list)
			});
			$('input[name=reportWhy]:checked').val("");
			$("#rmyModal *").remove();
			alert("신고되었습니다");
			return false;
		});
	} else {
		alert("이미 신고한 리뷰입니다");
		return false;
	}
};
	
$(document).on('click', '.heartclick', function(e){	
	 
//	console.log(rno);
	console.log($(e.target).attr('data-rno'));
	console.log("src : ", $(e.target).attr('src'));
	let page = $(".page-item.active a").attr("data-page");
	let heart = "/nightfoodfinder/resources/images/icon_hrt.png";
	//좋아요가 되어있으면 취소
	if($(e.target).attr('src') === heart){
		$.post({
			url: "i_like_cancel.do",
			data: {userNo,
				storeNo,
				page,
				reviewNo: $(e.target).attr('data-rno')},
				dataType: "json",
				success: (list) => makeReviewList(list)
		});
		return false;
	} //좋아요 누르기 
	else {
		$.post({
			url: "i_like.do",
			data: {userNo,
				storeNo,
				page,
				reviewNo: $(e.target).attr('data-rno')},
				dataType: "json",
				success: (list) => makeReviewList(list)
		});
		return false;
		
	};
//	alert("하트 누름");
	/*
*/
	
});	
	


/*사장 답글*/

//답글 등록 폼 보이기

function makeform(a) {
	var rno = $(a).attr("data-no");	// 리뷰 넘버

	$(".bossComment").empty();
	
	$("#bossComment" + rno).append(
		`<form id="bossCForm" method="post" action="recomment_regist.do">
		<table>
		<tr id="bossform" data-rno="${rno}">
		<td>
		<div>
		<textarea id="bossContent" class="bossContent" ></textarea>
		</div>
		</td>
		<td colspan="2"> 
			
          <button type="button" id="insertid" data-rno="${rno}" class="insert" onclick="recommentSubmit(this)">확인</button>
          <button type="button" data-rno="${rno}" class="onecancel" onclick="onecancel(this)">취소</button>
          
          
            	</td>
            </tr>
            </table> </form>`
		);
}


//답글 등록
function recommentSubmit(a) {
	var rno = $(a).attr("data-rno");
	let page = $(".page-item.active a").attr("data-page");
	console.log(page);
	
		$.post({
			url: "recomment_regist.do",
			data: {storeNo, reviewNo: rno, recomment : $("#bossContent").val(), page },
			success: (list) => makeReviewList(list), 
			error: () => console.log("에러")
		});		
}
//답글 등록 폼 취소
function onecancel(a) {
	let rno = $(a).attr("data-rno");
	$("#bossComment" + rno).empty();
}

//답글 삭제
$("#targetContainer").on("click", "button.delRecomment", (e) => {
	let page = $(".page-item.active a").attr("data-page");
	$.getJSON({
		
		url: "recomment_delete.do",
		data: {reviewNo: $(e.target).data("no"), storeNo, page },
		success: (list) => makeReviewList(list),
		error: () => console.log("에러")
	});
});

//답글 수정 폼 보이기

$("#targetContainer").on("click", "button.modRecomment", (e) => {
	let rno = $(e.target).data("no");
	$("#targetContainer tr[id^=row]").show();
	$("#targetContainer tr[id^=modRow]").remove();
	var modContent = $(`#row${rno} > td:eq(0)`).text();
	var modRegDate = $(`#row${rno} > td:eq(1)`).text();
	var html = `
	<table>
	<tr id="modRow${rno}">
    	<td>${modRegDate}</td>
    	<td>
    		<div class="form-group">
    			<textarea name="content" id="modbossContent" value="${modContent}" class="form-control input-wp2" placeholder="내용을 입력하세요"></textarea>
    		</div>
    	</td>
    	<td colspan="2"> 
    		<a href="#" data-rno="${rno}" class="updatetwo" role="button">수정</a>
    		<a href="#" data-rno="${rno}" class="canceltwo" role="button">취소</a>
    	</td>
    </tr>
    </table>`;
$("#row" + rno).after(html);	
$("#row" + rno).hide();
	
});

//답글 수정
$("#targetContainer").on("click", "a.updatetwo", (e) => {
	e.preventDefault();
	let rno = $(e.target).data("rno");
	let page = $(".page-item.active a").attr("data-page");
	$.ajax({
		url: "recomment_regist.do",
		type: "POST",
		data: {
			storeNo,
			reviewNo : rno,
			recomment : $("#modbossContent").val(),
			page 
			},
		dataType: "json",
		success: result => makeReviewList(result)
			
	});
});


//수정 등록 폼 취소
$("#targetContainer").on("click", "a.canceltwo", (e) => {
	e.preventDefault();
	let rno = $(e.target).data("rno");
	$("#row" + rno).show();
	$("#modRow" + rno).remove();
});

//페이징

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;
	
	$.ajax({
		url: "review_list.do",
		type: "POST",
		data: {
			storeNo, 
			userNo,
			page,
			range
			},
		success: list => makeReviewList(list),
		complete: function() { reposition(); }
	});
	

}

//페이지 번호 클릭
function fn_pagination(page, range, rangeSize) {
	
	$.ajax({
		url: "review_list.do",
		type: "POST",
		data: {
			storeNo, 
			userNo,
			page,
			range
			},
		success: list => makeReviewList(list),
		complete: function() { reposition(); }
	});
}

//다음 버튼 이벤트
function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	$.ajax({
		url: "review_list.do",
		type: "POST",
		data: {
			storeNo, 
			userNo,
			page,
			range
			},
		success: list => makeReviewList(list),
		complete: function() { reposition(); }
	});
	
	
}
