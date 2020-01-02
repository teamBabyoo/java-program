$(() => { 
	    // Geolocation API에 액세스할 수 있는 지 확인
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

	    // 내주변 맛집 버튼 클릭시 파라미터에 현재 위치 정보 같이 넘긴다.
	  $("#mysurrounding").click((e) => {
		  console.log("x", x);
		  console.log("y", y);
	  	  
		  if(!x || !y) {
			  Swal.fire('이 브라우저에서는 위치 정보 지원이 되지 않습니다.');
		  }
		  location.href = `${context}/front/store/storelist.do?flag=2&keyword=&latitude=${y}&longitude=${x}`;
	  });  
	    
});

