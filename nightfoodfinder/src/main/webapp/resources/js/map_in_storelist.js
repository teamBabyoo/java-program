/**
 * 
 */
$(() => {
	var map;
    let markerArr = [];
    let infowindow;
    let locations;
    let markerImage;

    let eventMarker;
    let iconcon;
    iconcon = new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/447-4478350_png-file-svg-fa-map-marker-png-clipart.png",null, null, null, new google.maps.Size(25, 35));

    $(".storeLn").mouseover((e) => {
      markerEvent($(e.target).data("store"));
    });

    function markerEvent(storeName) {
      markerImage = new google.maps.MarkerImage("https://www.pinclipart.com/picdir/big/288-2889919_markers-clipart-coloring-page-png-download.png",
    	        null, null, null, new google.maps.Size(25, 35));

      map.setCenter(new google.maps.LatLng(locations[0][1], locations[0][2]));

      /*마커 애니메이션 효과 주기*/
      for (let i = 0; i < markerArr.length; i++) {
        markerArr[i].setAnimation(null);
         $(".storeLn").mouseleave(()=>{
           markerArr[i].setIcon(iconcon);
          });

        if (markerArr[i].store_name == storeName) {
          /*가게이름 나오기*/
           infowindow.setContent(markerArr[i].store_name);
            infowindow.open(map, markerArr[i]);
            
            /*애니메이션 주기*/
            if (markerArr[i].getAnimation() !== null) {
              eventMarker = markerArr[i];         
              
            } else {
              markerArr[i].setAnimation(google.maps.Animation.BOUNCE);
              markerArr[i].setIcon(markerImage);
          }
        }
      }

    }

    function drawMap() {
      // 나온 마커로 중심좌표 찾기
      locations = [
        ['수저가', 37.5493313, 126.937287],
        ['맛있는집', 37.5529261, 126.937012],
        ['청석골', 37.5677797, 126.905045],
        ['가츠벤또', 37.5537907, 126.921552]
      ];
      let y = 0;
      let x = 0;
      let u = 0;
      for (u = 0; u < locations.length; u++) {
        y += locations[u][1];
        x += locations[u][2];
        u = u;
      }
      y = y / u;
      x = x / u;


      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 12,
        center: new google.maps.LatLng(y, x),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });

      infowindow = new google.maps.InfoWindow();

      //마커 뿌려주기
      var i;

      for (i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
          id: i,
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          animation: google.maps.Animation.DROP,
          store_name: locations[i][0],
          store_lati: locations[i][1],
          store_long: locations[i][2],
          icon: iconcon,
          map: map
        });
        markerArr.push(marker);


        google.maps.event.addListener(marker, 'click', (function (marker, i) {
          return function () {
            infowindow.setContent(locations[i][0]);
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
});