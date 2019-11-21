// $(".userselect")[0].html().append();

$("label").click((e) => {
	let check = $(e.target).next("input").attr("id");
	$()
	
	console.log($(".userselect")[0]);
})

/***
 * 라벨을 클릭했을 때 사용자가 옵션을 .userselect에 div를 추가한다
 * @returns
 */
let cnt = 1;
function creatediv(text) {
	let $userselect = $('.userselect');
	let html = "";
	
	let id = 'checkedtype_' + cnt;
	
	html += `
		<div>
			<label for="${id}">${text}<i class="fa fa-times" aria-hidden="true" onClick="deletediv()"></i></label>
			<input id="${id}" name=""  type="checkbox" checked class="hidden" />
		</div>
	`;
	$userselect.append(html);
	cnt++;
}

function deletediv(text) {
	
}
