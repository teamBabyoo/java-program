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
		e.preventDefault();
		
		console.log($(e.target));
		console.log($("#notice_btn").data("user"));
		console.log($("#notice_btn").data("store"));
		
		// 로그인 된 유저, 스토어 없다면 그냥 리턴
		if ( $("#notice_btn").data("user") == "" && $("#notice_btn").data("store") == "") {
			let html = '<div>로그인 후 이용 가능합니다.</div>';
			$(".notice_content").html(html);
			return;
		} 
		
		// 리스트 호출
		noticeList();
		
		
		
		
		
	});
	
})


/**
 * 알림 리스트 가져오는 함수
 */
function noticeList() {
	$.ajax({
		url: "notice_list.do",
		type: "POST",
		success: (list) => {
			// attr이용해 속성값 바꾸는 방법으로 바꾸어서 진행해보자ㅠ
			let html = "";
			
			// 만약 알림이 없다면
			if(list.length == 0) {
				$(".notice_content > ul").html(`<li>알림이 없습니다.</li>`);
			} else {
				// row 클릭시 이동할 url
				let addr = context + '/front/store/storedetail.do?no=';
				
				for (let notice of list) {
					
					// 알림 코드에 따라 내용과 이동할 url을 다르게 준다.
					switch (notice.noticeCode) {
					case "1": // user : 단골 store 정보 업데이트
						addr = context + `/front/store/storedetail.do?no=${notice.fromStoreNo}`;
						content = `${notice.fromStoreName} : ${notice.noticeContent}`;
						break;
					case "2": // user : 내 리뷰를 다른 user가 좋아요
						addr = context + `/front/store/storedetail.do?no=${notice.fromStoreNo}`;
						content = `${notice.fromUserName}${notice.noticeContent}`;
						break;
					case "4": // store : 내 가게의 단골 리스트 =>>> 단골리스트 주소로 고쳐야한다.
						addr = context + `/front/store/storedetail.do?no=${notice.storeNo}`;
						content = `${notice.fromUserName}${notice.noticeContent}`;
						break;
					case "5": // store : 내 가게 상세페이지에 새 리뷰가 등록 되었을 때
						addr = context + `/front/store/storedetail.do?no=${notice.storeNo}`;
						content = `${notice.noticeContent}`;
						break;
					default: // 코드3 store : 가입승인 => 내 상세페이지
						addr = context + `/front/store/storedetail.do?no={notice.storeNo}`;
						content = `${notice.noticeContent}`;
						break;
					}
					
					html += 
						`<li>
						<a href="${addr}">${content}</a>
						</li>
						`;
					
				}
			
				$(".notice_content > ul").html(html);
			 };
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
			console.log("안 읽은 알림 갯수", noticeCnt);
			let html = (noticeCnt == 0) ? 
					`` : `<span id="rednotice">${noticeCnt}</span>`;
			$(".newnotice").append(html);
		}
	})
};





