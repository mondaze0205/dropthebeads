<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>FLEA MARKET MAP</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<!-- �۲� -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- ������  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<!-- Ÿ��Ʋ -->
<div class="title_flea">
	<h2 class="mb-2">FLEA MAP</h2>
	<hr class="dots">
	<span>�䳢 - ���� | ��� - �Ǹ�<br>
    ��Ŀ�� Ŭ���� ����/�Ǹ� ������ Ȯ���ϰ�, �ش� �Խù��� �̵��� �� �ֽ��ϴ�! <i class="fa-regular fa-face-grin-wide"></i></span>
</div>  

	<div align="center">
		<div id="map" style="width:1300px;height:600px; margin-bottom: 30px;"></div>
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75a521ee3f22167093ecd39350fa50b1&libraries=services"></script>
	<script>
		var container = document.getElementById('map'); //������ ǥ���� div
		var options = {
			center: new kakao.maps.LatLng(37.5693656626833, 126.986022414113), //������ �߽���ǥ.
			level: 10 //������ Ȯ�� ����
			//map.setBound()�޼��� ����� ��Ŀ ����
		};


		//������ ǥ���� �ڵ�
		var map = new kakao.maps.Map(container, options); //���� ����
		
		// ���� Ȯ�� ��Ҹ� ������ �� �ִ� �� ��Ʈ���� �����մϴ�
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		/* �ּҸ� �Է��ϰ� �ش� ��ǥ���� ��Ŀǥ��  */

 		var positions = [];
		
		 <c:forEach items = "${MapMarkers}" var="MMs">

			positions.push({
				postno:"${MMs.f_postno}",
				addr:"${MMs.f_addr}",
				category:"${MMs.f_category}",
				//iwContent: '<div style="padding:5px;">${MMs.f_title}<br><a href="fcontent/${MMs.f_postno}" style="color:blue" target="_blank">�Խù��̵�</a> <a href="" style="color:blue" target="_blank">ä��</a></div>',
				title: "${MMs.f_title}",
				price: "${MMs.f_price}"		
			});
		</c:forEach> 
		 
 		positions.forEach(function(el, i){
 			
			// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
			var geocoder = new kakao.maps.services.Geocoder();
			
		
			// �ּҷ� ��ǥ�� �˻��մϴ�
			geocoder.addressSearch(positions[i].addr, function(result, status) {
				
			    // ���������� �˻��� �Ϸ������ 
	     		if (status === kakao.maps.services.Status.OK) {

		       	 	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
												//��ǥ������ �������ִ� ��ü ����()

				
 				//Ŀ���ҿ������� DOM
					var Customcontent = document.createElement('div');
					Customcontent.className = "wrap";
					//Customcontent.setAttribute("z-index", "1");

					var info = document.createElement('div');
					info.className = "info"			
					Customcontent.appendChild(info);

					//Ŀ���ҿ������� Ÿ��Ʋ �Ǹ�/����
					var contentTitle = document.createElement("div");
					contentTitle.className = "title"
					contentTitle.appendChild(document.createTextNode(positions[i].category)); //createTextNode()�� ������ ��ҿ� �ؽ�Ʈ�� �߰��Ѵ�.
					info.appendChild(contentTitle);

					//Ŀ���ҿ������� �ݱ� ��ư
					var closeBtn = document.createElement("div");
					closeBtn.className = "close";
					closeBtn.setAttribute("title","close"); //setAttribute('�Ӽ��̸�', '�Ӽ���') �Ӽ����� close�� �������ش�.
					closeBtn.onclick = function() { overlay.setMap(null); }; //Ŭ���ϸ� �������� �������ش�.
					contentTitle.appendChild(closeBtn);

					var bodyContent = document.createElement("div");
					bodyContent.className = "body";
					info.appendChild(bodyContent);

					var imgDiv = document.createElement("div");
					imgDiv.className = "img";
					bodyContent.appendChild(imgDiv);

					//Ŀ���ҿ������� �̹���
					//�Խù��� ������ ÷�εǾ������� �ش��������, ÷�εǾ����������� �������
					var imgContent = document.createElement("img");
					imgContent.setAttribute("src", "/image/apple.png");
					imgContent.setAttribute("width", "73");
					imgContent.setAttribute("heigth", "70");
					imgDiv.appendChild(imgContent);

					var descContent = document.createElement("div");
					descContent.className = "desc"
					bodyContent.appendChild(descContent);
					
					//�Խñ� ����
					var custitle = document.createElement("div");
					custitle.className = "ellipsis";
					custitle.appendChild(document.createTextNode(positions[i].title));
					descContent.appendChild(custitle);
					
					//Ŀ���ҿ������� �����ּ�
 					var cusprice = document.createElement("div");
 					cusprice.className = "cusprice";
 					cusprice.appendChild(document.createTextNode("����: "+positions[i].price+"��"));
					descContent.appendChild(cusprice);
									
					var LinkDiv = document.createElement("div");
					descContent.appendChild(LinkDiv);

					//Ŀ���ҿ������� ��ũ
 					var LinkContent = document.createElement("a");
						
					url = "fcontent/" + positions[i].postno;
					LinkContent.setAttribute("href", url);
					LinkContent.setAttribute("target", "_blank"); //���ο� ������â�� ���� �� �������� ����
						
					LinkContent.className = "link";
					LinkContent.appendChild(document.createTextNode("�Խù��� �̵�"));
					LinkDiv.appendChild(LinkContent);  
				//Ŀ���ҿ������� DOM ��

				// ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
			        var marker = new kakao.maps.Marker({
				        map: map,
			    		position: coords, //��Ŀ��ġ
			    		zIndex: 1 //z-index�� Ŭ���� ���� ���� �ö��
			        });
   
   					if(positions[i].category == "�Ǹ�"){ //���

   						var markerImage = new daum.maps.MarkerImage(
   							'/image/carrot.png', new kakao.maps.Size(55, 60), new kakao.maps.Point(13, 34));
   					
   						marker.setImage(markerImage);  
   					}
   					else if(positions[i].category == "����"){ //�䳢
   						
   						var markerImage = new daum.maps.MarkerImage(
   	   						'/image/rabbit.png', new kakao.maps.Size(55, 60), new kakao.maps.Point(13, 34));
   	   					
   	   					marker.setImage(markerImage); 
   					}

        			// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
        			// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� ����
        			var overlay = new kakao.maps.CustomOverlay({
        		    	map: map,
        			    position: marker.getPosition(),
        			    zIndex: 999 //�� ����
        			});


   					// ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
   	        			kakao.maps.event.addListener(marker, 'click', function() {
   	        			    overlay.setContent(Customcontent);
   	        			    overlay.setMap(map, marker);
   	        			});
        			
		    	} //if
			});    		
		}) //foreach
		
/*          		var imageSrc = '../image/red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
				    imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
				      
					// ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
*/        			

	</script>
	
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>