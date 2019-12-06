$(function() { 
    
    // Geolocation API에 액세스할 수 있는지를 확인
    if (navigator.geolocation) {
        //위치 정보를 얻기
        navigator.geolocation.getCurrentPosition (function(pos) {
            $('#latitude').html(pos.coords.latitude);     // 위도
            $('#longitude').html(pos.coords.longitude); // 경도
            y = (pos.coords.latitude) - 0.01;
            x = (pos.coords.longitude) - 0.01;
            console.log("구맵캎: ", y, x);
            initialize(y, x);
        });
    } else {
        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
    }

});