
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
	
/***
 * 리뷰 리스트 ajax로 조회 
 */
function reviewListAjax() {
	$.getJSON({
		url : "review_list.do",
		data : {no},
		success : list => makereviewlist(list) 
	});
	
}
function makereviewlist(list) {
	let $con = $("#targetContainer")
	let html = "";
	$.each(list, (i, r)=> {
		html += `
			<div class="user_rv">
		    <ul class="clearboth">
		        <li>
		            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
		            `;
		if ('${r.storeScope}' == "1" ) {
			html += `<p>★</p>`
		} else if ('${r.storeScope}' == "2" ) {
			html += `<p>★★</p>`
		} else if ('${r.storeScope}' == "3" ) {
			html += `<p>★★★</p>`
		} else if ('${r.storeScope}' == "4" ) {
			html += `<p>★★★★</p>`
		} else {
			html += `<p>★★★★★</p>`
		} 
			
		html += 
			`
		        </li>
		        <li>
		            <ul>
		                <li>${r.nickName}<span>${r.regDate}</span></li>
		                <li>${r.reviewContent}</li>    
		            </ul>
		        </li>
		        <li class="clearboth">
		            <p><img src="images/icon_hrt.png" /></p>
		            <p>4</p>
		        </li>
		    </ul>
		</div>
		`;
	});
	$con.html(html);
}
/*
<div class="user_rv">
    <ul class="clearboth">
        <li>
            <i class="fa fa-user-circle-o" aria-hidden="true"></i>
            <p>★★</p>
        </li>
        <li>
            <ul>
                <li>사용자닉네임<span>2910.11.11</span></li>
                <li>맛있어 죽겠어요!</li>    
            </ul>
        </li>
        <li class="clearboth">
            <p><img src="images/icon_hrt.png" /></p>
            <p>4</p>
        </li>
    </ul>
</div>  
  
  
  
  */



