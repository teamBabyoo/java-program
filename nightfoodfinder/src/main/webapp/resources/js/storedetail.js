
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

	
//리뷰 리스트 가져오는 에이작스 	
	function reviewListAjax() {
		alert("가져와라");
		$.getJSON({
			url: "review_list.do",
			data: {no},
			success: list => makeReviewList(list)
		});
	}

	function toPad(val) {
		return val < 10 ? "0" + val : val;
	}	
	
//#commentplace 안에 넣어주기 
function makeReviewList(list){
	alert("성공");
	$tbl = $("<table></table>");
	$.each(list, (i, r) => {
		var date = new Date(r.regDate);
		var time = date.getFullYear() + "-" 
		         + (date.getMonth() + 1) + "-" 
		         + date.getDate() + " "
		         + toPad(date.getHours()) + ":"
		         + toPad(date.getMinutes()) + ":"
		         + toPad(date.getSeconds());
		if(i == 1){
			$tbl.append(
					`<tr style="border: 1px solid coral;" id="row${r.reviewNo}">
				    <td>${r.nickName}</td>
				    <td>${r.reviewContent}</td>
				    <td>${time}</td>
				    <td><a href="#" data-no="${r.reviewNo}" class="del">삭제</a>	
				  	    <a href="#" data-no="${r.reviewNo}" class="mod">수정</a>	
				    </td>
			    </tr>`		
					);
		}
		else {
		$tbl.append(
			`<tr id="row${r.reviewNo}">
		    <td>${r.nickName}</td>
		    <td>${r.reviewContent}</td>
		    <td>${time}</td>
		    <td><a href="#" data-no="${r.reviewNo}" class="del">삭제</a>	
		  	    <a href="#" data-no="${r.reviewNo}" class="mod">수정</a>	
		    </td>
	    </tr>`
			);
		}
	});
	$("#commentplace").html($tbl);
}


$(document).ready(function() {
		reviewListAjax();
	});