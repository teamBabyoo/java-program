// let html = "";
$(() => {
	
	if ( $("#notice_btn").data("user") != undefined|| $("#notice_btn").data("store") != undefined) {
		// 알림 갯수 세팅
		noticeCounter();
	}
	
	
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
		
		// 로그인 된 유저, 스토어 없다면 그냥 리턴 - jsp에서 이미 해둔 것 같음.
	/*	if ( $("#notice_btn").data("user") == "" && $("#notice_btn").data("store") == "") {
			let html = '<div>로그인 후 이용 가능합니다.</div>';
			$(".notice_content").html(html);
			return;
		} */
		// 리스트 호출
		
		
		if (cnt == 0 ) {
			html = "";
		noticeList();
		}
	});
	
})


/**
 * 알림 리스트 가져오는 함수
 */

let html = "";
let cnt = 0;
 function noticeList(no) {
	 console.log(no);
	 // 위의 알림버튼으로 다시 가지 않게 stopPropagation() 사용함.
		window.event.stopPropagation();
		let lno = 0;

		cnt++;
		$.ajax({
			url: "/nightfoodfinder/front/main/notice_list.do",
			type: "POST",
			data: {lastNo : no || 0},
			success: (list) => {
				// attr이용해 속성값 바꾸는 방법으로 바꾸어서 진행해보자ㅠ
				let moreButton = "";

				// 만약 알림이 없다면
				if(list.length == 0) {
					$(".notice_content > ul").html(`<li>알림이 없습니다.</li>`);
				} else {
					// row 클릭시 이동할 url
					let addr = '';
					
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
						case "4": // store : 내 가게의 단골 리스트 
							addr = context + `/front/store/storedetail.do?no=${notice.storeNo}`;
							content = `${notice.fromUserName}${notice.noticeContent}`;
							break;
						case "5": // store : 내 가게 상세페이지에 새 리뷰가 등록 되었을 때
							addr = context + `/front/store/storedetail.do?no=${notice.storeNo}`;
							content = `${notice.noticeContent}`;
							break;
						default: // 코드3 store : 가입승인 => 내 상세페이지
							addr = context + `/front/store/storedetail.do?no=${notice.storeNo}`;
							content = `${notice.noticeContent}`;
							break;
						}
						
						if (notice.status == 0) {
							html += `<li style="background-color:lightgray">`
						}
						else {
							html += `<li >`
						}
						html += 
							`
							<a href="${addr}" onclick="location.href='${addr}'; chkclick(${notice.noticeNo})">${content}</a>
							<span class="del" onclick="del(${notice.noticeNo})">&times;</span>
							</li>
							`;
						lno = notice.noticeNo;
						}

					
					moreButton += `<a href="#${lno}" onclick="noticeList(${lno})" id="morebtn">더보기</a>
									<a href="#" onclick="alldel()" >전체 삭제</a>`;
					
					
					$(".notice_content > ul").html(html);	
					
					
					
					$(".notice_content > ul").append(moreButton);
					
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
		url: "/nightfoodfinder/front/main/count_notice.do",
		success: (noticeCnt) => {
			console.log("안 읽은 알림 갯수", noticeCnt);
			let html = (noticeCnt == 0) ? 
					`` : `<span id="rednotice">${noticeCnt}</span>`;
			$(".newnotice").append(html);
		}
	})
};

// 클릭해서 확인한 알림 status 1로 바꿔주기
function chkclick(no) {
	//alert(no)
	$.ajax({
		url: "/nightfoodfinder/front/main/read_notice.do",
	//	data: "noticeNo=" + no,
		data: {noticeNo : no},
		success: noticeList
	});
};


function del(noticeNo) {
	html = "";
	$.ajax({
		url: "/nightfoodfinder/front/main/delete_notice.do",
		data: {noticeNo  : noticeNo}, 	
		success: noticeList				
	})
};

function alldel() {
	html = "";
	$.ajax({
		url: "/nightfoodfinder/front/main/deleteall_notice.do",
		success: noticeList
	})
}


