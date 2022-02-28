<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=280f48cb94b34b4e389e403bc684ac31&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 주소 - 좌표 변환 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();


var positions =[];
<c:forEach items="${bh_list}" var="bh">
   positions.push({
      content:'<div style="padding:5px;">'+ "${bh.bhname}" +'<br><a href="reservationform" style="color:blue">예약하기</a> </div>',
      adr:"${bh.bhlocation}",
      iwRemoveable: true
   });
</c:forEach>



positions.forEach(function(v,i) {
   var geocoder = new kakao.maps.services.Geocoder();
   geocoder.addressSearch(positions[i].adr, function(result, status){
      if(status === kakao.maps.services.Status.OK){
         var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
         
         var marker = new kakao.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : coords
         // 마커의 위치
         });
         
         var infowindow = new kakao.maps.InfoWindow({
            content : positions[i].content, // 인포윈도우에 표시할 내용
            adr : positions[i].adr,
            removable : positions[i].iwRemoveable
         });
         
         kakao.maps.event.addListener(marker, 'click', function(){
            infowindow.open(map, marker);
         });
         
      }
   })
})



</script>
</body>
</html>