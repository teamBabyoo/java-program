var map;

function initialize(y, x) {
    // 마커를 찍어줄 정보들
  var locations = [
        ['수저가', 37.5493313, 126.937287],
        ['맛있는집', 37.5529261, 126.937012],
        ['청석골', 37.5677797, 126.905045],
        ['가츠벤또', 37.5537907, 126.921552],
      ];
    console.log("넘어온매개변수: ", y, x);
  var mapOptions = { //구글 맵 옵션 설정
      zoom : 14, //기본 확대율
      center : new google.maps.LatLng(y, x), // 지도 중앙 위치
      scrollwheel : true, //마우스 휠로 확대 축소 사용 여부
      mapTypeControl : false //맵 타입 컨트롤 사용 여부
  };


  map = new google.maps.Map(document.getElementById('google_map'), mapOptions); //구글 맵을 사용할 타겟
  
  var image = 'https://cheolguso.com/img/iconimg.png'; //마커 이미지 설정
  
  //이름 나오게
  var infowindow = new google.maps.InfoWindow();
  var marker, i;
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        id:i,
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
      if(marker)
      {
        marker.addListener('click', function() {
          map.setZoom(18);
          map.setCenter(this.getPosition());
        });
        }
    }

}