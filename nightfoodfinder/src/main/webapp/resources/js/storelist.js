/***
 * 라벨을 클릭했을 때 사용자가 옵션을 .userselect에 div를 추가한다
 * @returns
 */
let cnt = 1;
function creatediv(text, id) {
	let chd = 'checkedtype_' + cnt;
	
	// 결과넘겨줄 div
	$(".userselect").append(
		`<div>
			<label for="${chd}" class="selected" data-id=${id}>${text}<i class="fa fa-times" aria-hidden="true"></i></label>
	        <input id="${chd}" type="checkbox" checked class="hidden" />
	     </div>`	
	);
	cnt++;
}


/**
 * 조건을 선택할 경우
 */
$(".types").click((e) => {
	let selected = $(e.target).text();
	let id = $(e.target).next().attr("id");

	$(e.target).next().attr("checked", true);
	console.log($(e.target).next().is(":checked"));
	
	// 선택된 조건의 텍스트와 조건 input box id 같이 넘긴다
	creatediv(selected, id);  
});


/**
 * 선택한 조건을 해제하는 경우
 */
$(document).on("click",".selected", (e) => {
	let erase = "#"+ $(e.target).data("id");	// id
	console.log("erase: ",erase);
	$(erase).attr("checked", false);
	$(e.target).parent("div").remove();
	cnt--;
})

// 검색버튼 클릭
function beforesearch() {
	let arr = new Array();
	let name = '';
	 console.log($("#sto_search").serialize());

	
}
  			

$("#search_btn").click(() => {
	$('#sto_search').submit();
})
















