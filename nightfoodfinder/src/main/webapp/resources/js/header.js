$(document).ready(() => {
	
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
		$(".notice_list_box").toggleClass("hidden");
	
		$.ajax({
			url: "notice_list.do",
			data: {userNo: 42},
			success: (result) => {
				console.log("성공~", result);
			},
			error: (e) => {
				console.log("error:", e);
			}
		});
	
	});
	
	
	
	
})







