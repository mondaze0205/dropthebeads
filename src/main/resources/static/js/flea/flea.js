$(function() {
	$("a[id]").click(function() {
		var result = confirm("정말 삭제하시겠습니까?");
		if (result) {
			let no = $(this).attr("id");
			$.ajax({ url: "/flea/delete", data: "f_postno=" + no, method: "delete" }
			).done(function() {
				alert("글이 삭제되었습니다.");
				location.href = "/flea/flist";
			})
			return false;
		}
	})//click
}) //ready

//댓글 
$(function() {
	$("#add").click(function() {

		let userid = $("#h_userid").val();
		let comment = $('#comment').val(); //id comment의 값 
		let no = $("#h_f_postno").val(); ///게시물의 글번호로 글 정보를 받아온다

		$.ajax({
			url: "../insert",
			data: "f_postno=" + no + "&f_comment=" + comment + "&userid" + userid,
			method: "get"
		}).done(function() {
			location.reload();
			alert("댓글을 등록했습니다");
		});

	})//add click


	$(".delbtn").click(function() {
		alert("삭제합니다.");
		let cno = $(this).attr("id");
		$.ajax({
			url: "../delete/" + cno,
			//data를 따로 보내지 않아도 된다고 쌤이 말했는데 data붙여야 삭제됨.. 참고..
			data: "f_cno=" + cno,
			method: "get"
		}).done(function() {
			location.reload();
			alert("삭제완료!");
		});
	})  //delbtn click


	$(".upbtn").click(function() {
		let cno = $(this).attr("id");
		let comment = document.getElementById(this.name).value;
		$.ajax({
			url: "../update/" + cno,
			data: "f_cno=" + cno + "&f_comment=" + comment,
			method: "get"
		}).done(function()  {
			location.reload();
			alert("수정완료!")
		});
	}) //upbtn click


	$(".likebtn").click(function() {
		let cno = $(this).attr("id");
		let value = $(this).attr("value");
		$.ajax({
			url: "../clike/" + cno,
			data: "f_cno=" + cno + "&f_like=" + value + "&f_likesum=" + value,
			method: "get"
		}).done(function() {
			location.reload();
			alert("like it!")
		});
	}) //likebtn click

})//ready

//여기서부터 지도
$(function() {
	var container1 = document.getElementById('map1'); //지도를 표시할 div
	var options1 = {
		center: new kakao.maps.LatLng(37.56683321263384, 126.97865225625175), //지도의 중심좌표. //서울시청
		level: 4 //지도의 확대 레벨
		//map1.setBound()메서드 사용해 마커 포함
	};

	//지도를 표시할 코드. 지도생성
	var map1 = new kakao.maps.Map(container1, options1); //지도 생성

	// 지도 확대 축소를 제어할 수 있는 줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map1.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(document.getElementById('addr').value, function(result, status) {

		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map1: map1,
				position: coords
			});

			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">거래 위치</div>'
			});
			infowindow.open(map1, marker);

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map1.setCenter(coords);
		}

	});
}) //ready

$("#add").click(function() {

	let userid = $("#h_userid").val();
	let comment = $('#comment').val(); //id comment의 값 
	let no = $("#h_f_postno").val(); ///게시물의 글번호로 글 정보를 받아온다
	$.ajax({
		url: "../insert",
		data: "f_postno=" + no + "&f_comment=" + comment + "&userid=" + userid, //민주
		method: "get"
	}).done(function() {
		location.reload();
		alert("댓글을 등록했습니다");
	});

})//add click

$(".likebtn").click(function() {
	let cno = $(this).attr("id");
	let value = $(this).attr("value");
	$.ajax({
		url: "../clike/" + cno,
		data: "f_cno=" + cno + "&f_like=" + value, //민주
		method: "get"
	}).done(function() {
		location.reload();
		alert("like it!")
	});
}) //likebtn click