/**
 * 조건을 선택할 경우
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



function presubmit() {
	console.log($("#sto_search").serialize());
	let vals = $("input:checkbox[name='categoryCode']").val();
	for(let i = 0; i < vals.length; i++){
		console.log(i);
	}
//	return false;
}





