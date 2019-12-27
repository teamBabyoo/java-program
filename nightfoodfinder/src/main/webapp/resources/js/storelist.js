$(() => {
	/* 스토어 리스트의 이미지 슬라이더 */
	let main = $('.bxslider').bxSlider({
		mode: 'fade',
		controls : true,
	    captions: true,
	    slideWidth: 300,
	    slideMargin: 0,
		pager:true	//페이징
	});
	
	
     
	/* 지도 스크롤 고정 부분*/
	$(window).ready(() => {                   /* 헤더의 height만큼 뺀다 */
		const contentHeight = window.innerHeight - 108;
		$('.rightarea').css('height', contentHeight);
	});
	
	
	
	
	
	
	// page 클릭
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
						<li class="storeLn sto_li clearboth">검색 결과가 없습니다.</li>
					`;
				} else {
					for (let s of data.sList) {
						sHtml += `
							<li class="storeLn sto_li clearboth" data-store="${s.storeName}">
					        <a href="storedetail.do?no=${s.storeNo}" ></a>
							<div>
					       		<div class="home__slider">
									<div class="bxslider">`;
						
						console.log("파일 있냐?", s.fileVoList);
						// 파일 리스트가 없다면
							if(!s.fileVoList) {
							sHtml += `<img src="https://i.pinimg.com/originals/33/6a/ea/336aea314c68c0bc3eb8f6b5cd799de4.jpg" />`;
						} 
						// 있다면
						else {
							for (let img of s.fileVoList) {
								sHtml += `<img src="${context}/front/store/getByteImage.do?name=${img.sysName}&path=${img.path}" />`;
							}
						}
											
						sHtml +=
									`</div>
								</div>
							</div>
							
				       		<div class="sto_li_content" >
								<div>
									<span>${s.categoryName}</span>
									<span class="sto_scope">
										<span class="scope_star">★</span>${s.scope}(${s.reviewCntTotal})
									</span>		
								</div>
								<div class="store_name">${s.storeName}</div>
								<div class="store_info">
									<div>가격대 : ${s.priceType}</div>
									<div>영업 시간 : ${s.openTime} ~ ${s.closeTime}</div>
									<div></div>
								</div>		
				       		</div>
				       	</li>
							`;
					}
				}
				
				$(".ajaxstolist").html(sHtml).trigger("create");
				
				// 페이징
				let html = "";
				html += `
				<ul class="stolist_pagination">
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
				$("#storePageDiv").html(html).trigger("create");
				
				
			},
			error: () => {
				console.log("에러발생");
			},
			complete: () => {
				$('li').css({
					'list-style': 'none',
					'overflow': 'hidden'
				});
			}
		});
		
	});	
});
