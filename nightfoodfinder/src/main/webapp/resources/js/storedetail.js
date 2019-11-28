
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
	$.getJSON({
		url: "review_list.do",
		data: {no},
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
	let $tbl = $("<div class='user_rv'></div>");
	if(list.length == 0){
		$tbl.append(` 작성된 리뷰가 없습니다.`);
	}
	$.each(list, (i, r) => {

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
			$tbl.append(
					`<div class="user_rv best_rv">
					  <div class="tenten">
					  	<button type="button" class="report" value="${r.reviewNo}">신고하기</button>  
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
                            <p><img src="` + context + `/resources/images/icon_hrt.png" /></p>
                            <p>${r.good}</p>
                        </li>
                    </ul>
                </div>`);
		}
		else {
		$tbl.append(
			`<div class="user_rv">
				<div class="tenten">
					<button type="button" class="report"  value="${r.reviewNo}">신고하기</button>
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
                    <li class="clearboth">
                        <p><img src="` + context + `/resources/images/icon_hrt.png" /></p>
                        <p>${r.good}</p>
                    </li>
                </ul>
            </div>`
			);
		}
	});
	$("#targetContainer").html($tbl);
	
}
/**
 * footer top값 재설정
 * @returns
 */
function reposition() {
	let $height_header = $('header').height();
	let $height_content = $('.content').height();
	let $top_footer = $('footer').offset().top;
//	let $height_leave_rv = $('.leave_rv').height
	console.log('$height_content', $height_content);
	console.log('$height_header ->', $height_header);
	console.log('$top_footer ->', $top_footer);
//	$('footer').css('top', $height_header + $height_content + $height_leave_rv);
	$('footer').css('top', $height_header + $height_content);
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
	// 댓글 등록
	$("#reviewForm").submit(() => {
		console.log(storeNo, reviewContent, storeScope, recomment);
		$.post({
			url: "review_regist.do",
			data: {storeNo, reviewContent, storeScope, recomment},
			dataType: "json",
			success: (list) => reviewListAjax(list)
		});
		$("textarea").val("");
		return false;
	});
	

	
});



//신고하기
$(document).on('click', '.report', function(e){
	//신고사유 모달창
	let rpop = $("#rmyModal");
	//사유 모달창 띄우기
	rpop.css("display", "block");

	//review_no를 받기위해	
	let rNo = e.target
//	console.log(eval.value);
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
		<button>제출하기</button>
    </div>
	</form>
	`
	);
	//밸류 값 들어오는지 확인용
	console.log($("#reviewNo").val());
	console.log($("#reportWhy").val());

	//모달창 닫기
	$(".rclose").click(()=>{
		rpop.css("display", "none");
	});
//	$('input[name=reportWhy]').change((e) => {
//		console.log(e.target);
//	})
	// 리뷰신고 등록
	$("#reportsubmit").submit(() => {
		let userNo = 3;
		$.post({
			url: "review_report.do",
			type: "POST",
			data: {
				reviewNo: $("#reviewNo").val(), 
				reportWhy: $('input[name=reportWhy]:checked').val()
				//추후 수정..
				},
			dataType: "json",
			success: (list) => makeReviewList(list)
		});
		$('input[name=reportWhy]:checked').val("");
		return false;
	});
});





