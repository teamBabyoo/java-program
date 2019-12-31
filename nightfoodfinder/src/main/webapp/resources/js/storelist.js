$(() => {
	/* 스토어 리스트의 이미지 슬라이더 */
	var main = $('.bxslider').bxSlider({
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
		markerArr=[];
//		let fd = new FormData(document.querySelector("#searchStoreForm"));
		let fd = new FormData();
		fd.append("page", $(e.target).data("page"));
		console.log($("#searchStoreForm").serialize() + "&page=" + $(e.target).data("page"));
		
		$.ajax({
			url: "storelistAjax.do",
			type: "POST",
			data: $("#searchStoreForm").serialize() + "&page=" + $(e.target).data("page"),
			success: (data) => {
				console.log("전", arr.length);
				arr = [];
				console.log("후", arr.length);
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
						
						// 파일 리스트가 없다면
							if(s.fileVoList.length == 0) {
							sHtml += `<img src="https://i.pinimg.com/originals/33/6a/ea/336aea314c68c0bc3eb8f6b5cd799de4.jpg" />`;
						} 
						// 있다면
						else {
							for (let img of s.fileVoList) {
								sHtml += `<img src="${context}/front/store/getByteImage.do?name=${img.sysName}&path=${img.path}" />`;
								filePath = {
					       				sysname: `${img.sysName}`,
										path: `${img.path}`
					       		}
					       		fileArr.push(filePath);
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
							<input name="latitude" type="hidden" value="${s.latitude}" />
							<input name="longitude" type="hidden" value="${s.longitude}" />
				       	</li>`;
						
						abs(`${s.latitude}`, `${s.longitude}`, `${s.storeName}`, `${s.storeNo}`, `${s.categoryName}`, `${s.scope}`, fileArr);
						fileArr = [];
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
				
				
				var main = $('.bxslider').bxSlider({
					mode: 'fade',
					controls : true,
				    captions: true,
				    slideWidth: 300,
				    slideMargin: 0,
					pager:true	//페이징
				});
				
				drawMap();
				/*
				$(".storeLn.sto_li.clearboth").mouseenter((e) => {
					e.preventDefault();
				  markerEvent($(e.target).parent($('li')).attr("data-store"));
				});
				*/
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
	$(document).on("mouseenter", ".storeLn.sto_li.clearboth", (e) => {
		console.log("storeName", $(e.target).closest($('li')).data("store"));
		markerEvent($(e.target).closest($('li')).data("store"));
	})
});


/*구글 맵*/
var map;
let markerArr = [];
let infowindow;
let locations;
let markerImage;
let geocoder;
let food;
let eventMarker;
let concon =  new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/447-4478350_png-file-svg-fa-map-marker-png-clipart.png",null, null, null, new google.maps.Size(25, 35));
let sizex;
let sizey;
let contentbox;



	
/*
$(".storeLn.sto_li.clearboth").mouseenter((e) => {
	//alert($(e.target).parent($('li')).attr("data-store"));
	markerEvent($(e.target).parent($('li')).attr("data-store"));
});
*/

function markerEvent(storeName) {
  markerImage = new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/288-2889919_markers-clipart-coloring-page-png-download.png",
    null, null, null, new google.maps.Size(25, 35));

  map.setCenter(new google.maps.LatLng(locations[0].latitude*1, locations[0].longitude*1));

  /*마커 애니메이션 효과 주기*/
  for (let i = 0; i < markerArr.length; i++) {
    markerArr[i].setAnimation(null);
     $(".storeLn").mouseleave(()=>{
       markerArr[i].setIcon(concon);
      });

    if (markerArr[i].store_name == storeName) {
//    	console.log("이미지는요?", parseimsg);
      /*가게이름 나오기*/
//    	let contentbox = `<a href="storedetail.do?no=`+markerArr[i].store_no+`">`+markerArr[i].store_name+`</a>`
    	contentbox = `
    		<div>
    			<div class="home__slider">
					<div class="bxslider">`
    		if(markerArr[i].store_img.length === 0) {
    			contentbox +=`<img src="https://365psd.com/images/istock/previews/1005/100574873-dish-fork-and-knife-icons-cutlery-sign.jpg" style="width: 200px;" />`
    		} else {
    			for (let img of markerArr[i].store_img) {
    				contentbox +=`<img src="${context}/front/store/getByteImage.do?name=${img.sysname}&path=${img.path}" />`;
				}
    		}
    	contentbox +=
    		`
    				</div>
    			</div>
    		</div>
	        <div class="boxse">
	           <div>
    				<div class="boxcategoty">`+markerArr[i].store_category+`</div> 
    			</div>
    			<div class="boxName">
    				<div class="boxstorename"><a href="storedetail.do?no=`+markerArr[i].store_no+`">`+markerArr[i].store_name+`</a></div>
    				<div class="boxstorescope">★`+markerArr[i].store_scope+`</div>
   				</div>
	        </div>

       `;
       infowindow.setContent(contentbox);
        infowindow.open(map, markerArr[i]);
        
        var goomain = $('.bxslider').bxSlider({
			mode: 'fade',
			controls : true,
		    captions: true,
		    slideWidth: 200,
		    slideMargin: 0,
			pager:true	//페이징
		});
        
        /*애니메이션 주기*/
        if (markerArr[i].getAnimation() !== null) {
          //eventMarker = markerArr[i];         
          
        } else {
          //markerArr[i].setAnimation(google.maps.Animation.BOUNCE);
          markerArr[i].setIcon(markerImage);
      }
    }
  }

}

function drawMap() {
  // 나온 마커로 중심좌표 찾기
	locations = arr;
	  /*
    ['수저가', 37.5493313, 126.937287],
    ['맛있는집', 37.5529261, 126.937012],
    ['청석골', 37.5677797, 126.905045],
    ['가츠벤또', 37.5537907, 126.921552]
    
  */

	  
  let y = 0;
  let x = 0;
  let u = 0;
  for (u = 0; u < locations.length; u++) {
    y += locations[u].latitude*1;
    x += locations[u].longitude*1;
    u = u;
    
  }
  y = y / u;
  x = x / u;


  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 12,
    center: new google.maps.LatLng(y, x),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  geocoder = new google.maps.Geocoder;
  infowindow = new google.maps.InfoWindow();

  google.maps.event.addListener(map, 'click', function(event) {
       var latLng = event.latLng.toString();
       let ss = latLng.split('(', 2)[1];
       let sms = ss.split(')', 2)[0];
       let latlngStr = sms.split(',', 2);
       let lat = latlngStr[0];
       let lng = latlngStr[1];
       let lngg = lng.replace(/\s/gi, "");
       console.log("lat", lat);
       codeLatLng(lat, lngg);
  });

  //마커 뿌려주기
  var i;
  


  for (i = 0; i < locations.length; i++) {
    /*
    food = locations[i][3];
   if (food === 1) {
      concon = "http://pngimg.com/uploads/turkey_food/turkey_food_PNG24.png"
      sizex = 10;
      sizey = 10;
    } else {
      concon = null;
    }*/
    /* 카테고리에 따라 마커 이미지 바꾸기 
    if (food === 1) {
      concon = new google.maps.MarkerImage("http://pngimg.com/uploads/turkey_food/turkey_food_PNG24.png",
        null, null, null, new google.maps.Size(30, 30));
    } else if(food === 2) {
      concon = new google.maps.MarkerImage("http://pngimg.com/uploads/pizza/pizza_PNG43980.png",
        null, null, null, new google.maps.Size(30, 40));
    } else {
      concon = null;
    }
    concon =  new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/288-2889919_markers-clipart-coloring-page-png-download.png",null, null, null, new google.maps.Size(30, 40));
   */
    var marker = new google.maps.Marker({
      id: i,
      position: new google.maps.LatLng(locations[i].latitude*1, locations[i].longitude*1),
      animation: google.maps.Animation.DROP,
      store_name: locations[i].storeName,
      store_lati: locations[i].latitude*1,
      store_long: locations[i].longitude*1,
      store_no: locations[i].storeNo*1,
      store_category: locations[i].category,
      store_scope: locations[i].scope,
      store_img: locations[i].files,
      icon: concon,
      size: sizex,
      map: map
    });
    markerArr.push(marker);



    google.maps.event.addListener(marker, 'click', (function (marker, i) {
      return function () {
    	  contentbox = `
      		<div>
      			<div class="home__slider">
  					<div class="bxslider">`
      		if(marker.store_img.length === 0) {
      			contentbox +=`<img src="https://365psd.com/images/istock/previews/1005/100574873-dish-fork-and-knife-icons-cutlery-sign.jpg"  style="width: 100%; " />`
      		} else {
      			for (let img of marker.store_img) {
      				console.log("배열이미지",img);
      				contentbox +=`<img src="${context}/front/store/getByteImage.do?name=${img.sysname}&path=${img.path}" style="width: 100%;"/>`;
  				}
      		}
      	contentbox +=
      		`
      				</div>
      			</div>
      		</div>
  	        <div class="boxse">
	           <div>
    				<div class="boxcategoty">`+markerArr[i].store_category+`</div> 
    			</div>
    			<div class="boxName">
    				<div class="boxstorename"><a href="storedetail.do?no=`+markerArr[i].store_no+`">`+markerArr[i].store_name+`</a></div>
    				<div class="boxstorescope">★`+markerArr[i].store_scope+`</div>
   				</div>
	        </div>
      				
         `;
        infowindow.setContent(contentbox);
        infowindow.open(map, marker);
      }
    })(marker, i));

    if (marker) {
      marker.addListener('click', function () {
        map.setZoom(15);
        map.setCenter(this.getPosition());
        marker.setIcon(null);
      });
    }
  }
};

	

drawMap();
/*지도상 누른 좌표값 받기*/
function codeLatLng(lat, lng) {
geocode =
"https://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&key=AIzaSyCSQHW_pWBrzI8-rkc4FczxQWzCSciCJS4";
jQuery.ajax({
    url: geocode,
    type: 'POST',
       success: function(myJSONResult){
                if(myJSONResult.status == 'OK') {
                    var tag = "";
                    let addr = "";
                    var i;
                    for (i = 0; i < myJSONResult.results.length; i++) {
                      /*누른 좌표의 상세주소*/
                      addr = myJSONResult.results[0].formatted_address;
                      /*
                      tag += "주소 : " +myJSONResult.results[i].formatted_address+" <br />";
                      tag += "위도 : " +myJSONResult.results[i].geometry.location.lat+" <br />";
                      tag += "경도 : " +myJSONResult.results[i].geometry.location.lng+" <br />";
                      */
                    }
                    document.getElementById("message").innerHTML = addr;
                } else if(myJSONResult.status == 'ZERO_RESULTS') {
                    alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                    alert("할당량이 초과되었습니다.");
                } else if(myJSONResult.status == 'REQUEST_DENIED') {
                    alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                } else if(myJSONResult.status == 'INVALID_REQUEST') {
                    alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                }
        }
      
});
}

/* 내 위치값 받기*/

$(function() { 
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            y = (pos.coords.latitude);// 위도
            x = (pos.coords.longitude);// 경도
            console.log("내위치: ", y, x);
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }

}); /*   
*/






