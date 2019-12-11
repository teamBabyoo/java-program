$(() => {
	
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

	

	
	// 안읽은 알림 갯수 가져온다.
	$.ajax({
		url: "count_notice.do",
		success: (noticeCnt) => {
			console.log(noticeCnt);
			let html = (noticeCnt == 0) ? 
					`` : `<span id="rednotice">${noticeCnt}</span>`;
			$(".newnotice").append(html);
		}
	})
	
	
	// 종 아이콘 클릭시 알림 리스트 나타냄
	$("#notice_btn").click((e) => {	
		$.ajax({
			url: "notice_list.do",
			type: "POST",
			success: (result) => noticeList(result),
				// 결과로 알림 리스트 가지고 온다.
			error: (e) => {
				console.log("error:", e);
			}
		});
	
	});
	
	
	
	
	
})

// 알람 리스트 만드는 함수
function noticeList(list) {
	let $ul = $("<ul id='noticelist'></ul>");
	
	// 만약 알림이 없다면
	if(list.length == 0) {
		$ul.append(`알림이 없습니다.`);
	}
	
	// 있다면
	 let html = ``;
	 for (let val of list) {
		 html += 
			 `<li>
			 	
			 </li>`
	 };
	
	
	$(".notice_content").html(html);
	
	
};






