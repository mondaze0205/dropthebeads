const pixelCanvas = document.querySelector('.pixel-canvas');

$(function(){    
	
	window.opener.$("#h_code").empty();
	
	var userid = opener.document.getElementById("login_userid").value;
	
	if(userid == "") {
		document.getElementById("picselect").disabled = true;
	} else {
		$.getJSON("/painter/mypaints",{"userid":userid},function(data){
			$("#picselect").empty();
			var op = "<option id='none' value='none'>선택해주세요.</option>";
			$("#picselect").append(op);
			for (let i in data) {
				let pic = data[i];
				op = "<option value=" + pic['pictureid'] + ">" + pic['picname'] + "</option>";
				$("#picselect").append(op);
			}
		}); //getJSON
		
	}	
	
});

$("#picid").click(function(){
	
	if(document.getElementById("none")) {
		document.getElementById("none").remove();
	}
	$("#picselect").val("");
})

$("#pickbtn").click(function(){
	
	var pictureid = document.getElementById("picid").value;
	
	if(pictureid) {
		$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
			var code = data.code;
			var picid = data.pictureid;
			var picname = data.picname;
			var id = data.userid;
			let nickname = "";
		
			$.getJSON("/user/match",{"userid":id},function(data2){
				nickname = data2.nickname;
				if (code == "none") {
					alert('없는 번호입니다.')
				} else {
					document.getElementById("h_code").value = code;
					document.getElementById("h_name").value = picname;
					document.getElementById("h_picid").value = picid;
					document.getElementById("h_userid").value = id;
				
					$(".picinfo").empty();
					$(".picinfo").append('<h5>번호 : ' + picid + '</h5>');
					$(".picinfo").append('<h5>작가 : ' + nickname + '</h5>');
					$(".picinfo").append('<h5>제목 : ' + picname + '</h5>');
					$("#h_copy").trigger('click');
				}
			});
		});
	}
	
	
})


$("#h_copy").click(function(){
	
	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
 
    var codes = document.querySelector('#h_code').value;
  	var ss = codes.split("\n");
  	
	var newHeight = ss.length - 1;
  	var newWidth = ss[0].split(" ").length - 1;

  	// 행과 열을 만든다.
  	for (let i = 1; i <= newHeight; i++) {
    	let newgridRow = document.createElement('tr');
    	var code_row = ss[i-1].split(" ");
    	pixelCanvas.appendChild(newgridRow);
    	for (let j = 1; j <= newWidth; j++) {
			var color = code_row[j-1];
			if (color == "#t") {
				color = "transparent"
			}
      		let newgridCell = document.createElement('td');
      		newgridRow.appendChild(newgridCell);
      		newgridCell.style.backgroundColor = color;   		
     	}
  	}
	
	if(newHeight >= 48 || newWidth >= 48) {
		$(".canvas td").css("height", "5px");
		$(".canvas td").css("min-width", "5px");
	} else if(newHeight >= 24 || newWidth >= 24) {
		$(".canvas td").css("height", "11px");
		$(".canvas td").css("min-width", "11px");
	} else {
		$(".canvas td").css("height", "20px");
		$(".canvas td").css("min-width", "20px");
	}

});

$("#loadbtn").click(function(){
	
	var code = document.getElementById('h_code').value;
	var pictureid = document.getElementById('h_picid').value;
	var picname = document.getElementById("h_name").value;
	var id = document.getElementById("h_userid").value;
	
	var login = opener.document.getElementById("login_userid").value;

	if(code == "") {
		alert('선택된 그림이 없습니다.')
		return false;
	}
	
	if (id != login) {
	
		window.opener.location.href = '/painter/readonly/' + pictureid 
	} else {
		opener.document.getElementById("code").value = code;
		opener.document.getElementById("pic_id").value = pictureid;
		opener.document.getElementById("pic_name").value = picname;	
		window.opener.$("#copypic").trigger('click');
	}
	
	window.close();
		
});
	
	
$("#cancelbtn").click(function(){
	window.close();
})



function change(){
	
	if(document.getElementById("none")) {
		document.getElementById("none").remove();
	}
	
	$("#picid").empty();
	
 	var s = document.getElementById("picselect")
 	var pictureid = s.options[s.selectedIndex].value;
 	
 	$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
		var code = data.code;
		var picid = data.pictureid;
		var picname = data.picname;
		var id = data.userid;
		let nickname = "";
		
		$.getJSON("/user/match",{"userid":id},function(data2){
			nickname = data2.nickname;
			if (code == "none") {
				alert('없는 번호입니다.')
			} else {
				document.getElementById("h_code").value = code;
				document.getElementById("h_name").value = picname;
				document.getElementById("h_picid").value = picid;
				document.getElementById("h_userid").value = id;
				
				$(".picinfo").empty();
				$(".picinfo").append('<h5>번호 : ' + picid + '</h5>');
				$(".picinfo").append('<h5>작가 : ' + nickname + '</h5>');
				$(".picinfo").append('<h5>제목 : ' + picname + '</h5>');
				
				$("#h_copy").trigger('click');
			}
		});
		
		
	}); //getJSON
	
}



