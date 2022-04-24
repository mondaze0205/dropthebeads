<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FLEA MARKET MAP</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<!-- 타이틀 -->
<div class="title_flea">
	<h2 class="mb-2">FLEA MAP</h2>
	<hr class="dots">
	<span>토끼 - 구매 | 당근 - 판매<br>
    마커를 클릭해 구매/판매 정보를 확인하고, 해당 게시물로 이동할 수 있습니다! <i class="fa-regular fa-face-grin-wide"></i></span>
</div>  

	<div align="center">
		<div id="map" style="width:1300px;height:600px; margin-bottom: 30px;"></div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75a521ee3f22167093ecd39350fa50b1&libraries=services"></script>
	<script>
		var container = document.getElementById('map'); //지도를 표시할 div
		var options = {
			center: new kakao.maps.LatLng(37.5693656626833, 126.986022414113), //지도의 중심좌표.
			level: 10 //지도의 확대 레벨
			//map.setBound()메서드 사용해 마커 포함
		};


		//지도를 표시할 코드
		var map = new kakao.maps.Map(container, options); //지도 생성
		
		// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		/* 주소를 입력하고 해당 좌표값에 마커표시  */

 		var positions = [];
		
		 <c:forEach items = "${MapMarkers}" var="MMs">

			positions.push({
				postno:"${MMs.f_postno}",
				addr:"${MMs.f_addr}",
				category:"${MMs.f_category}",
				//iwContent: '<div style="padding:5px;">${MMs.f_title}<br><a href="fcontent/${MMs.f_postno}" style="color:blue" target="_blank">게시물이동</a> <a href="" style="color:blue" target="_blank">채팅</a></div>',
				title: "${MMs.f_title}",
				price: "${MMs.f_price}"		
			});
		</c:forEach> 
		 
 		positions.forEach(function(el, i){
 			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
		
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(positions[i].addr, function(result, status) {
				
			    // 정상적으로 검색이 완료됐으면 
	     		if (status === kakao.maps.services.Status.OK) {

		       	 	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
												//좌표정보를 가지고있는 객체 생성()

				
 				//커스텀오버레이 DOM
					var Customcontent = document.createElement('div');
					Customcontent.className = "wrap";
					//Customcontent.setAttribute("z-index", "1");

					var info = document.createElement('div');
					info.className = "info"			
					Customcontent.appendChild(info);

					//커스텀오버레이 타이틀 판매/구매
					var contentTitle = document.createElement("div");
					contentTitle.className = "title"
					contentTitle.appendChild(document.createTextNode(positions[i].category)); //createTextNode()는 선택한 요소에 텍스트를 추가한다.
					info.appendChild(contentTitle);

					//커스텀오버레이 닫기 버튼
					var closeBtn = document.createElement("div");
					closeBtn.className = "close";
					closeBtn.setAttribute("title","close"); //setAttribute('속성이름', '속성값') 속성값을 close로 변경해준다.
					closeBtn.onclick = function() { overlay.setMap(null); }; //클릭하면 지도에서 제거해준다.
					contentTitle.appendChild(closeBtn);

					var bodyContent = document.createElement("div");
					bodyContent.className = "body";
					info.appendChild(bodyContent);

					var imgDiv = document.createElement("div");
					imgDiv.className = "img";
					bodyContent.appendChild(imgDiv);

					//커스텀오버레이 이미지
					//게시물에 사진이 첨부되어있으면 해당사진으로, 첨부되어있지않으면 사과사진
					var imgContent = document.createElement("img");
					imgContent.setAttribute("src", "/image/apple.png");
					imgContent.setAttribute("width", "73");
					imgContent.setAttribute("heigth", "70");
					imgDiv.appendChild(imgContent);

					var descContent = document.createElement("div");
					descContent.className = "desc"
					bodyContent.appendChild(descContent);
					
					//게시글 제목
					var custitle = document.createElement("div");
					custitle.className = "ellipsis";
					custitle.appendChild(document.createTextNode(positions[i].title));
					descContent.appendChild(custitle);
					
					//커스텀오버레이 지번주소
 					var cusprice = document.createElement("div");
 					cusprice.className = "cusprice";
 					cusprice.appendChild(document.createTextNode("가격: "+positions[i].price+"원"));
					descContent.appendChild(cusprice);
									
					var LinkDiv = document.createElement("div");
					descContent.appendChild(LinkDiv);

					//커스텀오버레이 링크
 					var LinkContent = document.createElement("a");
						
					url = "fcontent/" + positions[i].postno;
					LinkContent.setAttribute("href", url);
					LinkContent.setAttribute("target", "_blank"); //새로운 윈도우창을 열어 웹 페이지를 연다
						
					LinkContent.className = "link";
					LinkContent.appendChild(document.createTextNode("게시물로 이동"));
					LinkDiv.appendChild(LinkContent);  
				//커스텀오버레이 DOM 끝

				// 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
				        map: map,
			    		position: coords, //마커위치
			    		zIndex: 1 //z-index가 클수록 가장 위로 올라옴
			        });
   
   					if(positions[i].category == "판매"){ //당근

   						var markerImage = new daum.maps.MarkerImage(
   							'/image/carrot.png', new kakao.maps.Size(55, 60), new kakao.maps.Point(13, 34));
   					
   						marker.setImage(markerImage);  
   					}
   					else if(positions[i].category == "구매"){ //토끼
   						
   						var markerImage = new daum.maps.MarkerImage(
   	   						'/image/rabbit.png', new kakao.maps.Size(55, 60), new kakao.maps.Point(13, 34));
   	   					
   	   					marker.setImage(markerImage); 
   					}

        			// 마커 위에 커스텀오버레이를 표시합니다
        			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정
        			var overlay = new kakao.maps.CustomOverlay({
        		    	map: map,
        			    position: marker.getPosition(),
        			    zIndex: 999 //맨 위로
        			});


   					// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
   	        			kakao.maps.event.addListener(marker, 'click', function() {
   	        			    overlay.setContent(Customcontent);
   	        			    overlay.setMap(map, marker);
   	        			});
        			
		    	} //if
			});    		
		}) //foreach
		
/*          		var imageSrc = '../image/red.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				      
					// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
*/        			

	</script>
	
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>