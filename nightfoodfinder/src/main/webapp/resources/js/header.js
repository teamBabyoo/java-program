$(() => {
	
	// 알림 갯수 세팅
	noticeCounter();
	
	
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

	
	
	/**
	 * 알림 아이콘 클릭시
	 */
	$("#notice_btn").click((e) => {
		// 로그인 된 유저, 스토어 없다면 그냥 리턴
		if ( $(e.target).data("user") == null && $(e.target).data("store") == null) return; 
		
		// 리스트 호출
		noticeList();
	});
	
	
	
	
	
	
})



function noticeList() {
	$.ajax({
		url: "notice_list.do",
		type: "POST",
		success: (list) => {
			let $ul = $("<ul></ul>");
			
			// 만약 알림이 없다면
			if(list.length == 0) {
				$ul.append(`알림이 없습니다.`);
			}
			
			// 있다면
			let html, addr = ``;
			 for (let notice of list) {
				 switch (notice.noticeCode) {
				 case "1": // user : 단골 store 정보 업데이트
					 addr += `storedetail.do?no=${notice.fromStoreNo}`;
					 break;
				 case "2": // user : 내 리뷰를 다른 user가 좋아요
					 addr += `storedetail.do?no=${notice.fromStoreNo}`;
					 break;
				 case "4": // store : 내 가게의 단골 리스트
					 break;
				 case "5": // store : 내 가게 상세페이지에 새 리뷰가 등록 되었을 때
					 addr += `storedetail.do?no=${notice.storeNo}`;
					 break;
				 default: // 코드3 store : 가입승인 => 내 상세페이지
					 addr += `storedetail.do?no=${notice.storeNo}`;
				 } 
				 	
				 
				 
				 html += 
					 `<li>
					 	<a href="">${notice.noticeContent}</a>
					 </li>
					 `;
			 };
			
			
			$(".notice_content").html(html);
		},
		error: (e) => {
			console.log("error:", e);
		}
	});
}






/**
 * 안 읽은 알림 갯수 가져오기
 */
function noticeCounter() {
	$.ajax({
		url: "count_notice.do",
		success: (noticeCnt) => {
			console.log(noticeCnt);
			let html = (noticeCnt == 0) ? 
					`` : `<span id="rednotice">${noticeCnt}</span>`;
			$(".newnotice").append(html);
		}
	})
};





