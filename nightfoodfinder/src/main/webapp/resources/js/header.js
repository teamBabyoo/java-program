$(document).ready(() => {
	
	// 안읽은 알림 갯수 가져온다.
	$.ajax({
		url: "count_notice.do",
		data : {userNo : 42},
		success: (noticeCnt) => {
			let html = (noticeCnt == 0) ? `` :
				`<span id="rednotice">${noticeCnt}</span>`
			
			$(".newnotice").append(html);
				
		}
	})
	
	
	
	
	/**
	 * 검색 조건을 선택할 경우
	 */
	$(".types").click((e) => {
		if($(e.target).next().is(":checked") == false) {
			$(e.target).css({
				border: "1px solid orange",
				color: "orange"
			});
		} else { 
			$(e.target).css({
				border: "1px solid #d4d4d4",
				color: "black"
			});
		}
	});
	
	
	
	
	
	
	
	
// 종 아이콘 클릭시 알림 리스트 나타냄
	$("#notice_btn").click((e) => {
		// 클릭시 사라졌다 나타났다 hidden 클래스 
//		$(".notice_list_box").toggleClass("hidden");
	
		
//		let userNo = user.userNo;
		
		$.ajax({
			url: "notice_list.do",
			data: {userNo: 42},
			success: (result) => noticeList(result),
				// 결과로 알림 리스트 가지고 온다.
			error: (e) => {
				console.log("error:", e);
			}
		});
	
	});
	
	
	
	
	
})

// 알람 리스트 만드는 함수
function noticeList(data) {
	let $div = $("<div class='notice_rw'></div>");
	
	// 만약 알림이 없다면
	if(data.length == 0) {
		$div.append(`알림이 없습니다.`);
	}
	
	// 있다면
	
	
	
};






