const pixelCanvas = document.querySelector('.pixel-canvas');
const replyArea =document.querySelector('.rs');
const compare = (document.getElementById("post_userid").value == document.getElementById("login_userid").value)

$(function(){    
	
	while (pixelCanvas.firstChild) {
    	pixelCanvas.removeChild(pixelCanvas.firstChild);
    }
    
    if(document.getElementById("login_userid").value == "") {
		document.getElementById("submit").disabled = true;
		document.getElementById("recommend").disabled = true;
		document.getElementById("withrec").disabled = true;
	}
	
	if(!compare) {
		document.getElementById("editbtn").disabled = true;
		document.getElementById("delbtn").disabled = true;
	}
 	
 	var pictureid = document.getElementById('pictureid').value;
		
	$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
		var code = data.code;
		document.getElementById("code").value = code;
		
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
    
	document.getElementById("repcon").value='';
	
	$.getJSON("/reply/refresh",{"postid":postid},function(data){
		$("#countReply").empty();
		$("#countReply").append("총 " + data.length + "개");
		
		for(let i in data) {
			let r = data[i];
			var d = changeDate(r["replydate"]);
			$(".rs").append("<div class='r'></div>");
			$(".r:last-child").append('<div class="r_id"><h5>' + r["nickname"] + '</h5><input type="hidden" id="' + i + '" value="' + r["userid"] + '"></div>');
			$(".r:last-child").append('<div><h5>' + r["repcon"] + '</h5></div>');
			$(".r:last-child").append('<div class="makespace"></div>');
			$(".r:last-child").append('<div class="r_del" id="' + r["replyid"] + '"><h6 id="' + i + '">삭제</h6></div>');
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

$("#editbtn").click(function(){
	if(!compare) {
		alert('권한이 없습니다.')
		return false;
	}
})

$("#delbtn").click(function(){
	if(!compare) {
		alert('권한이 없습니다.')
		return false;
	}
})

$("#submit").click(function(){
	
	if(document.getElementById("repcon").value == "") {
		alert('내용을 입력해주세요.')
		return false;
	}

	var postid = document.getElementById("postid").value;
	var userid = document.getElementById("login_userid").value;
	var nickname =  document.getElementById("login_nickname").value;
	var repcon = document.getElementById("repcon").value;
	
	$.ajax({
		url:"/reply/insert", 
		type:"post",
		data: {
			userid:userid,
			nickname:nickname,
			postid:postid,
			repcon:repcon
		},	
		success : function(){$("#replyRefresh").trigger('click');},
		error : function(){alert('error');}		
	});
	
})

$("#recommend").click(function(){
	
	var postid = document.getElementById("postid").value;
	var userid = document.getElementById("login_userid").value;
	
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
	
	if(document.getElementById("login_userid").value != document.getElementById($(this).find("h6").attr("id")).value) {
		alert('권한이 없습니다')
		return false;
	}
	
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







