const pixelCanvas = document.querySelector('.pixel-canvas');
const replyArea =document.querySelector('.rs');

$(function(){    
	
	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
 
 	var pictureid = document.getElementById('pictureid').value;
		
	$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
		var code = data.code;
		var picname = data.picname;
		document.getElementById("code").value = code;
		//document.getElementById("pic_name").value = picname;
				
		var codes = document.querySelector('#code').value;
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


		if(newHeight >= 72 || newWidth >= 72) {
			$(".canvas tr").css("height", "9px");
			$(".canvas td").css("min-width", "9px");
		}
							
	}); //getJSON
 	 
});

$("#replyRefresh").click(function(){
	
	var postid = document.getElementById("postid").value;

	while (replyArea.firstChild) {
    	replyArea.removeChild(replyArea.firstChild);
    }
	
	$.getJSON("/reply/refresh",{"postid":postid},function(data){
		$("#countReply").empty();
		$("#countReply").append("총 " + data.length + "개");
		
		for(let i in data) {
			let r = data[i];
			var d = changeDate(r["replydate"]);
			var d2 = r["replydate"];
			$(".rs").append("<div class='r'></div>");
			$(".r:last-child").append('<div class="r_id"><h5>' + r["userid"] + '</h5></div>');
			$(".r:last-child").append('<div><h5>' + r["repcon"] + '</h5></div>');
			$(".r:last-child").append('<div class="makespace"></div>');
			$(".r:last-child").append('<div class="r_del" id="' + r["replyid"] + '"><h6>삭제</h6></div>');
			$(".r:last-child").append('<div class="r_date"><h6>' + d + '</h6></div>');
		}
		
	}); //getJSON
	
	
});

function changeDate(date) {
	d = date.split(" ");
	s = d[2].substr(2, 2) + ".";
	if(d[0] == "Jan") {
		s = s + "01.";
	} else if(d[0] == "Feb") {
		s = s + "02.";
	} else if(d[0] == "Mar") {
		s = s + "03.";
	} else if(d[0] == "Apr") {
		s = s + "04.";
	} else if(d[0] == "May") {
		s = s + "05.";
	} else if(d[0] == "Jun") {
		s = s + "06.";
	} else if(d[0] == "Jul") {
		s = s + "07.";
	} else if(d[0] == "Aug") {
		s = s + "08.";
	} else if(d[0] == "Sep") {
		s = s + "09.";
	} else if(d[0] == "Oct") {
		s = s + "10.";
	} else if(d[0] == "Nov") {
		s = s + "11.";
	} else {
		s = s + "12.";
	}
	
	s = s + d[1].substr(0, 2) + " ";
	
	hms = d[3].split(":");
	hour = hms[0];
	min = hms[1];
	sec = hms[2];
	
	if(d[4] == "AM") {
		if(hour == 12) {
			s = s + "00:" + min + ":" + sec;
		} else if(parseInt(hour) <= 9) {
			s = s + "0" + hour + ":" + min + ":" + sec;
		} else {
			s = s + d[3];
		}
	} else {
		if(hour == 12) {
			s = s + d[3];
		} else {
			s = s + (parseInt(hour) + 12) + ":" + min + ":" + sec;
		}
	}
	
	return s;
	
}

$("#submit").click(function(){
	if(document.getElementById("repcon").value == "") {
		alert('내용을 입력해주세요.')
		return false;
	}

	var postid = document.getElementById("postid").value;
	var userid = document.getElementById("userid").value;
	var repcon = document.getElementById("repcon").value;
	
	$.ajax({
		url:"/reply/insert", 
		type:"post",
		data: {
			userid:userid,
			postid:postid,
			repcon:repcon
		},	
		success : function(){$("#replyRefresh").trigger('click');},
		error : function(){alert('error');}		
	});
	
})

$("#recommend").click(function(){
	
	var postid = document.getElementById("postid").value;
	var userid = document.getElementById("userid").value;
	
	$.getJSON("/reply/recommend",{"postid":postid,"userid":userid},function(data){
		alert(data.result);
	}); //getJSON
	
})

$("#withrec").click(function(){
		
	$("#recommend").trigger('click');
	$("#submit").trigger('click');

})


$(document).on("click", ".r_del", function() {
	
	var replyid = this.id;
	
	$.ajax({
		url:"/reply/delete", 
		type:"post",
		data: {
			replyid:replyid,
		},	
		success : function(){$("#replyRefresh").trigger('click');},
		error : function(){alert('error');}		
	});
})







