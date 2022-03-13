const pixelCanvas = document.querySelector('.pixel-canvas');

$(function(){
	var s =document.getElementById('s').value
	var j = JSON.parse(s);

	document.getElementById('code').value = j.code;
	document.getElementById('picname').value = j.picname;
	document.getElementById('pictureid').value = j.pictureid;

	var codes = document.querySelector('#code').value;
  	var ss = codes.split("\n");
  	
	var newHeight = ss.length - 1;
  	var newWidth = ss[0].split(" ").length - 1;
  	
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
  	
  	if(newHeight >= 96 || newWidth >= 96) {
		$(".canvas td").css("height", "13px");
		$(".canvas td").css("min-width", "13px");
	} else if(newHeight >= 72 || newWidth >= 72) {
		$(".canvas td").css("height", "17px");
		$(".canvas td").css("min-width", "17px");
	} else {
		$(".canvas td").css("height", "20px");
		$(".canvas td").css("min-width", "20px");
	}
	
})

$("#report").click(function(){
	
	if(document.getElementById("login_userid").value == "") {
		return false;
	}
	
	var pictureid = document.getElementById('pictureid').value;
	var userid = document.getElementById("login_userid").value;
	
	alert(pictureid)
	alert(userid)
	
	
	$.ajax({
		url:"/admin/report", 
		type:"post",
		data: {
			pictureid:pictureid,
			userid:userid
		},
		datatype: "text",	
		success : function(data){alert(data);},
		error : function(){alert('report error js');}		
	});
	
	
})