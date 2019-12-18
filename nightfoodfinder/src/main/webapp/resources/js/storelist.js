$(() => {

	var main = $('.bxslider').bxSlider({
		mode: 'fade',
	    captions: true,
	    slideWidth: 300,
	    slideMargin: 0,
		pager:true	//페이징
	});
	
	
     
	/* 지도 스크롤 고정 부분*/
	$(window).ready(() => {
		// 지도의 좌표값
		let mapOffset = $(".rightarea").offset();
		
		// 화면에 스크롤이 생기면 고정한다.
		$(window).scroll(() => {
			if ($(document).scrollTop() > mapOffset.top - 60) {
				$(".rightarea").addClass("scroll-fixed");
			} else {
				$(".rightarea").removeClass("scroll-fixed");
			}
		});
		
	});
	
	
	
	
	

		
		
	

	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// page 클리
	$("#storePageDiv").on("click", "ul > li > a", (e) => {
//		let fd = new FormData(document.querySelector("#searchStoreForm"));
		let fd = new FormData();
		fd.append("page", $(e.target).data("page"));
		console.dir(fd);
		console.log($("#searchStoreForm").serialize() + "&page=" + $(e.target).data("page"));
		
		$.ajax({
			url: "storelistAjax.do",
			type: "POST",
			data: $("#searchStoreForm").serialize() + "&page=" + $(e.target).data("page"),
			success: (data) => {
				console.dir(data);
				// 스토어 리스트
				let sHtml = "";
				
				if (!data.sList) {
					sHtml += `
						<tr>
							<td colspan="5">검색 결과가 없습니다.</td>
						</tr>
					`;
				} else {
					for (let s of data.sList) {
						sHtml += `
							<tr class="store">
									<td>${s.storeNo}</td>
									<td><a href="storedetail.do?no=${s.storeNo}">${s.storeName}</a></td>
									<td>${s.storeTell}</td>
									<td>${s.openTime}</td>
								</tr>
							`;
					}
				}
				
				$("#storetListTbody").html(sHtml);
				
				// 페이징
				let html = "";
				html += `
				<ul class="pagination">
				`;
				if (data.pi.prev) {
					html += `
						<li class="page-item">
							<a class="page-link" href="#${data.pi.startPage- 1}" data-page="${data.pi.startPage- 1}"> Previous</a>
						</li>
					`;
				}
				for (let i = data.pi.startPage; i <= data.pi.endPage; i++) {
					
					html += `
						<li class="page-item active">
							<a class="page-link" href="#${i}" data-page="${i}">${i}</a>
						</li>
					`;
				}
				
				if (data.pi.next) {
					html += `
						<li class="page-item">
					<a class="page-link" href="#${data.pi.endPage + 1}" data-page="${data.pi.endPage + 1}"> Next</a>
						</li>
						`;
				}
				html += `</ul>`;
				$("#storePageDiv").html(html);
			},
			error: () => {
				console.log(111);
			}
		});
		
	});	
});
