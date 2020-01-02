
$(document).ready(function(e) {
	// 페이지 공유(현재 페이지 주소복사)
	$('.sharePop p').html(location.href);
	$('#copyclip').on('click', function() {
		copyText(location.href);
	});
	
	reviewListAjax();
	
});

/* 단골등록을 위한 */
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

/* 단골 등록하기 */
function makeFrequent(list) {
	// list 가 1이면 등록된 가게
	// 0이면 등록되지 않은 가게
	$(".frequent").off();
   if(list) {
	   $(".frequent i").attr("class", "fa fa-bookmark").css("color", "red");
	   $(".frequent").click(()=>{
		   if(userNo === 0 && loginStore != storeNo){			  
			   Swal.fire('로그인 후 이용이 가능합니다')
			   return false;
		   } else {
			   frequentRegist("frequent_delete.do");
			   $(".frequent i").attr("class", "fa fa-bookmark-o").css("color", "#77747d");
		   }
		   
	   });
	   
   } else {
	   $(".frequent i").attr("class", "fa fa-bookmark-o");
	   $(".frequent").click(()=>{
		   if(userNo === 0){
			   Swal.fire('로그인 후 이용이 가능합니다')
			   return false;
		   } else {
			   frequentRegist("frequent_regist.do");
			   $(".frequent i").attr("class", "fa fa-bookmark").css("color", "red");
		   }
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
	


/* 별점 애니메이션 */
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

	
// 리뷰 리스트 가져오는 에이작스
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

// #commentplace 안에 넣어주기
// 리뷰 리스트 뿌려주기
function makeReviewList(list){
	let html = "";
	let pagination = list.pagination;
	let $tbl = $("<div class='user_rv'></div>");
	var reviewNoArray = [];
	
	let reviewList = list.list;
	if(reviewList.length == 0){
		html += `<div class='user_rv'> 작성된 리뷰가 없습니다.</div>`;
		$tbl.append(html);
		$("#targetContainer").html($tbl);
	} else {

	
	$.each(reviewList, (i, r) => {
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
			if (`${r.status}` == 1) {
			  html += `<div class="user_rv" status-a="${r.status}">관리자에 의해 차단된리뷰입니다</div>`;
			
			} else {
			html += `<div class="user_rv" status-b="${r.status}">
				  <div class="tenten">
			  	<button type="button" class="report" value="${r.reviewNo}">신고하기</button>`
			  	if (loginStore === storeNo && r.recomment == null){
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
                        <li>${r.reviewContent}</li>`;
						if (r.fileGroupCode != 0) {
							html += `<li>`;
							for (let i = 0; i < r.fileVoList.length; i++) {
								let url = r.fileVoList[i].path + "/" + r.fileVoList[i].sysName;
								url = url.replace(/\s/gi, "");
								let fileGroupCode = r.fileGroupCode;
								html += `<div class="rv_img" style="background-image: url(` + context + `/front/store/getreviewimgsrc.do?name=${r.fileVoList[i].sysName}&path=${r.fileVoList[i].path})"></div>`;
							}
							html += `</li>`;
						}
				html+= `
					</ul>
                </li>
                <li class="clearboth">
                    `;
			
			if(`${r.mylikecheck}` === '0' ) {
				html += `<div class="heart" data-rno="${r.reviewNo}" data-writer="${r.writerNo}" data-class="" ></div>`;
			} else {
				html += `<div class="heart" data-rno="${r.reviewNo}" data-writer="${r.writerNo}" data-class="heartActive" ></div>`;
			}

			html += `
	                <div class="goodCount">${r.good}</div>
	                </li>`;
			let css = "hidden";
			if (userNo == `${r.writerNo}`) {
				css = "";
			}
			let chkmyreview = `${r.writerNo}`;
			html += `<li data-chkmyreview=` + chkmyreview + `>
					    <ul class="ud_control ${css}">
					        <li>수정 |</li>
					        <li><a href="` + context + `/front/store/review_delete.do?storeNo=` + storeNo + `&reviewNo=${r.reviewNo}&storeScope=${r.storeScope}">삭제</a></li>
					    </ul>
					</li>
				</ul>
	        </div>`;
			
			// 답글 내용
			if (r.recomment != null) {
				html += `
				<div class="reply clearboth">
				<table class="reply_content">
				<i class="fa fa-reply fa-rotate-180 fa-4x" aria-hidden="true"></i>
					<tr id="row${r.reviewNo}">
					<td>
					<ul>
					<li>사장님 답글</li>
					<li>${r.reCommentRegDate}</li>
					</ul>
					</td>
					<td><li>${r.recomment}</li></td>
					<td><button type="button" data-no="${r.reviewNo}" class="delRecomment">삭제</button>	
						<button type="button" data-no="${r.reviewNo}" class="modRecomment">수정</button>	
					</td>
					</tr>
					</table>
					</div>`;
			}
			
			/**
			 * // 답글 내용 if (r.recomment != null) { html += ` <table
			 * class="reply_content">
			 * <tr id="row${r.reviewNo}">
			 * <td>${r.recomment}</td>
			 * <td>${r.reCommentRegDate}</td>
			 * <td><button type="button" data-no="${r.reviewNo}"
			 * class="delRecomment">삭제</button> <button type="button"
			 * data-no="${r.reviewNo}" class="modRecomment">수정</button> </td>
			 * </tr>
			 * </table>`; }
			 * 
			 * 
			 * 
			 */
			
			// 답글 등록 폼
			html += `<div id="bossComment${r.reviewNo}" class="bossComment" data-rno="${r.reviewNo}">

					</div>	
	        `;
			$tbl.append(html);
			}	
		}
		else {
			
			html = "";
			if (`${r.status}` == 1) {
				html += `<div class="user_rv" status-a="${r.status}">관리자에 의해 차단된리뷰입니다</div>`;
				
			} else {	
			html += `
			<div class="user_rv" status-c="${r.status}">
				<div class="tenten">
					<button type="button" class="report"  value="${r.reviewNo}">신고하기</button>`
				  if (loginStore === storeNo && r.recomment == null){
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
                            <li>`
                        if(`${r.nickName}` === "null"){
                        	let userEmail = `${r.userEmail}`;
                        	html += userEmail.substr(0,5)+"***";
                        } else {
                        	html += `${r.nickName}`;
                        }
						 html +=`<span>${time}</span></li>
                            <li>${r.reviewContent}</li>`;
						if (r.fileGroupCode != 0) {
							html += `<li>`;
							for (let i = 0; i < r.fileVoList.length; i++) {
								let url = r.fileVoList[i].path + "/" + r.fileVoList[i].sysName;
								url = url.replace(/\s/gi, "");
								let fileGroupCode = r.fileGroupCode;
								html += `<div class="rv_img" style="background-image: url(` + context + `/front/store/getreviewimgsrc.do?name=${r.fileVoList[i].sysName}&path=${r.fileVoList[i].path})"></div>`;
							}
							html += `</li>`;
						}
				html+= `</ul>
                    </li>
                    <li class="clearboth">`
                        if(`${r.mylikecheck}` === '0' ) {
                        	html += `<div class="heart" data-rno="${r.reviewNo}" data-writer="${r.writerNo}" data-class="" ></div>`;
						} else {
							html += `<div class="heart" data-rno="${r.reviewNo}" data-writer="${r.writerNo}" data-class="heartActive" ></div>`;
						}
			html += `<div class="goodCount">${r.good}</div>
                    </li>`;
			let css = "hidden";
			if (userNo == `${r.writerNo}`) {
				css = "";
			}
			let chkme = `${r.writerNo}`;
			html += `<li data-chkmyreview=` + chkme + `>
					    <ul class="ud_control ${css}">
					        <li>수정 |</li>
					        <li><a href="` + context + `/front/store/review_delete.do?storeNo=` + storeNo + `&reviewNo=${r.reviewNo}">삭제</a></li>
					    </ul>
					</li>
				</ul>
            </div>`;
			
			// 답글 내용
            if (r.recomment != null) {
				html += `
				<div class="reply clearboth">
				<table class="reply_content">
				<i class="fa fa-reply fa-rotate-180 fa-4x" aria-hidden="true"></i>
					<tr id="row${r.reviewNo}">
					<td>
					<ul>
					<li>사장님 답글</li>
					<li>${r.reCommentRegDate}</li>
					</ul>
					</td>
					<td><li>${r.recomment}</li></td>`
					if (loginStore === storeNo) {
						html += `
					<td><button type="button" data-no="${r.reviewNo}" class="delRecomment">삭제</button>	
						<button type="button" data-no="${r.reviewNo}" class="modRecomment">수정</button>	
					</td>
					</tr>
					</table>
					</div>`;
			}
			}
	        
	        	
			// 답글 등록 폼 들어가는 거
			html += `<div id="bossComment${r.reviewNo}" class="bossComment" data-rno="${r.reviewNo}">

					</div>
            `;
			}
			$tbl.append(html);
		
		}

	});
	}

	$("#targetContainer").html($tbl);
	let pageEle = "";
	
	$("#paginationBox").html("");
	pageEle += `<ul class="pagination">`;
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
 * 
 * @returns
 */
function reposition() {
	let $height_header = $('header').height();
	let $height_content = $('.content').height();
	let $height_wrapper = $('.wrapper').width();
	$('footer').css('bottom', -($height_wrapper));
}



/**
 * 댓글 등록
 * 
 * @returns
 */
function registReview() {
	let reviewContent = $('textarea[name="reviewContent"]').val();
	let form = $('#reviewForm')[0];
	let data = new FormData(form);
	$.ajax({
		type: "POST",
		enctype: "multipart/form-data",
		url: "review_regist.do",
		data: data,
		dataType: "json",
		cache: false,
        processData: false,
        contentType: false,
        success: function(data) {
        },
        error: function(e) {
        }
	});
	return false;
};



/**
 * 리뷰 별점 전처리
 * 
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
	$('input[name="storeScope"]').val(storeScope); 
	// 현재 클릭한 별의 형제 요소의 길이만큼 반복문 돌리며 rscope값이 작을 경우 색상변경(e.target 포함)
	for (let i = 0; i < $(e.target).siblings().length; i++) {
		let $sibling = $(e.target).siblings().eq(i);
		if (parseInt($sibling.attr('data-rscope')) <= storeScope){
			if ($sibling.attr('data-rscope') == '1') {
				$sibling.css('color', 'yellow');
			}
			$(e.target).css('color', 'red');
			$sibling.css('color', 'red');
		}
	}
});

/**
 * 공유하기
 * 
 * @returns
 */
function copyText(text) {
    var temp = document.createElement('input');
    document.body.appendChild(temp);
    temp.value = text;
    temp.select();
    document.execCommand('Copy');
    document.body.removeChild(temp);
}



// 신고하기
$(document).on('click', '.report', function(e){
	// 신고 클릭시 했던 신고자인지
	if(loginStore != storeNo && userNo === 0){
		   Swal.fire('신고할 수 없습니다')
		   return false;
	} else {
	//유저번호 들어오는지
	let page = $(".page-item.active a").attr("data-page");

	// review_no를 받기위해
	let rNo = e.target;
	$.post({
		url: "review_report_check.do",
		data: {userNo, reviewNo: rNo.value},
		dataType: "json",
		success: (count) => reviewReport(count, rNo, page)
	});
	return false;
	
	}

});

function reviewReport(count, rNo, page) {
	if(count == 0) {
		// 신고사유 모달창
		let rpop = $("#rmyModal");
		// 사유 모달창 띄우기
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

		// 모달창 닫기
		$(".rclose").click(()=>{
			rpop.css("display", "none");
		});
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
	
$(document).on('click', '.heart', function(e){	
	 if(userNo === 0){
		 alert("로그인 후 이용가능합니다");
		 return false;
	 }
// console.log(rno);
/*
 * console.log("리뷰번호", $(e.target).attr('data-rno')); console.log("리뷰글쓴이",
 * $(e.target).attr('data-writer')); console.log("src : ",
 * $(e.target).attr('src'));
 */
	let page = $(".page-item.active a").attr("data-page");
	let heart = "/nightfoodfinder/resources/images/icon_hrt.png";
	// 좋아요가 되어있으면 취소
	if($(e.target).attr('data-class') === "heartActive"){
// $(e.target).attr('data-class', "");
		let likeObj = $(e.target).attr('data-class', "").parent().find(":last-child");
		likeObj.text(parseInt(likeObj.text())-1);
		$.post({
			url: "i_like_cancel.do",
			data: {userNo,
				storeNo,
				page,
				reviewNo: $(e.target).attr('data-rno')
				},
				dataType: "json",
				success: (list) => makeReviewList(list)
		});
		return false;
	} // 좋아요 누르기
	else {
		let likeObj = $(e.target).attr('data-class', "heartActive").parent().find(":last-child");
		likeObj.text(parseInt(likeObj.text())+1);
		
		setTimeout(() => {
			$.post({
				url: "i_like.do",
				data: {userNo,
					storeNo,
					page,
					writerNo: $(e.target).attr('data-writer'),
					reviewNo: $(e.target).attr('data-rno')
				},
				dataType: "json",
				success: (list) => makeReviewList(list)
			});
			
		}, 1000);
		return false;
		
	};
// alert("하트 누름");
	/*
*/
	
});	
	


/* 사장 답글 */

// 답글 등록 폼 보이기

function makeform(a) {
	var rno = $(a).attr("data-no");	// 리뷰 넘버

	$(".bossComment").empty();
	
	$("#bossComment" + rno).append(
		`<form id="bossCForm" method="post" action="recomment_regist.do">
		<table class="reply_form">
		<tr id="bossform" data-rno="${rno}">
		<td>
		<div>
		<textarea id="bossContent" class="bossContent" onKeyUp="ChkByte(this,'400')" placeholder="최대 200자(400바이트)까지 입력 가능합니다."></textarea>
		<br />
		<span id="counter">0</span><span id="countertwo"> / 400bytes</span>
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

// 답글 등록 폼 글자수 제한

function ChkByte(obj, maxByte) {
    var content = obj.value;
    var content_len = content.length;
    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var content2 = "";

    for(var i=0; i<content_len; i++) {
        one_char = content.charAt(i);
        if(escape(one_char).length > 4) {
        	rbyte += 2; }                                     // 한글2Byte
        else {
            rbyte++; }                                       // 영문 등 나머지
																// 1Byte

        if(rbyte <= maxByte) {
            rlen = i+1;  }                                   // return할 문자열
																// 갯수
     }

     if(rbyte > maxByte)
     {
  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
  content2 = content.substr(0,rlen);                                  // 문자열
																		// 자르기
  obj.value = content2;
  ChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('counter').innerText = rbyte;
     }
}


// 답글 등록
function recommentSubmit(a) {
	var rno = $(a).attr("data-rno");
	let page = $(".page-item.active a").attr("data-page");
// console.log(page);
	
		$.post({
			url: "recomment_regist.do",
			data: {storeNo, reviewNo: rno, recomment : $("#bossContent").val(), page },
			success: (list) => makeReviewList(list), 
			error: () => console.log("에러")
		});		
}
// 답글 등록 폼 취소
function onecancel(a) {
	let rno = $(a).attr("data-rno");
	$("#bossComment" + rno).empty();
}

// 답글 삭제
$("#targetContainer").on("click", "button.delRecomment", (e) => {
	let page = $(".page-item.active a").attr("data-page");
	$.getJSON({
		
		url: "recomment_delete.do",
		data: {reviewNo: $(e.target).data("no"), storeNo, page },
		success: (list) => makeReviewList(list),
		error: () => console.log("에러")
	});
});

// 답글 수정 폼 보이기

$("#targetContainer").on("click", "button.modRecomment", (e) => {
	let rno = $(e.target).data("no");
	$("#targetContainer tr[id^=row]").show();
	$("#targetContainer div[id^=modRow]").remove();
	var modRegDate = $(`#row${rno} > td:eq(0) > ul > li:eq(1)`).text();
	var modContent = $(`#row${rno} > td:eq(1)`).text();
	var html = `
	<div id="modRow${rno}">
		<ul class="modli">
    	<li class="mod_one">${modRegDate}</li>
    	<li class="mod_two">
    		<div class="form-group">
    		<textarea name="content" id="modbossContent" value="${modContent}" class="modbossContent" onKeyUp="ChkByte(this,'400')" placeholder="최대 200자(400바이트)까지 입력 가능합니다."></textarea>
    		<br />
		<span id="counter">0</span><span id="countertwo"> / 400bytes</span>
    		</div>
    	</li>
    	<li colspan="2" class="mod_three"> 
    		<a href="#" data-rno="${rno}" class="modbtn mod" id="updatetwo" role="button">수정</a>
    		<a href="#" data-rno="${rno}" class="modbtn can" id="canceltwo" role="button">취소</a>
    	</li>
    	</ul>
    </div>`;
	
$("#row" + rno).after(html);	
$("#row" + rno).hide();
	
});

// 답글 수정
$("#targetContainer").on("click", "a#updatetwo", (e) => {
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


// 답글 수정 등록 폼 취소
$("#targetContainer").on("click", "a#canceltwo", (e) => {
	e.preventDefault();
	let rno = $(e.target).data("rno");
	$("#row" + rno).show();
	$("#modRow" + rno).remove();
});

// 페이징

// 이전 버튼 이벤트
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

// 페이지 번호 클릭
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

// 다음 버튼 이벤트
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

// 지도 붙이기
let y;
let x;
function mapDraw(longitude, latitude, storeName){
// console.log("지도 넘길 것", longitude, latitude, storeName);
	y = latitude;
	x = longitude
	locations = [
		[storeName, y, x]
	];
	
	map = new google.maps.Map(document.getElementById('map'), {
        zoom: 19,
        center: new google.maps.LatLng(y, x),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
	infowindow = new google.maps.InfoWindow();
	
    var i;

    for (i = 0; i < locations.length; i++) {
      var marker = new google.maps.Marker({
        id: i,
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        animation: google.maps.Animation.DROP,
        store_name: locations[i][0],
        store_lati: locations[i][1],
        store_long: locations[i][2],
        icon: null,
        map: map
      });

    }
	
}
mapDraw(longitude, latitude, storeName);

// 리뷰 제한
$("#reviewRegist").click(()=>{
	if(loginStore != storeNo && userNo == 0){
		Swal.fire("유저만 이용가능합니다");
		return false;
	} 
});