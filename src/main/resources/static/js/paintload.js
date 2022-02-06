$(function(){    
	
	window.opener.$("#code").empty();
	
	$("#loadpic").click(function(){
		
		var pictureid = document.getElementById('picid').value;
		
		$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
			var code = data.code;
			var picid = data.pictureid;
			var picname = data.picname;
			if (code == "none") {
				alert('없는 번호입니다.')
			} else {
				opener.document.getElementById("code").value = code;
				opener.document.getElementById("pic_id").value = picid;
				opener.document.getElementById("pic_name").value = picname;
				window.opener.$("#copypic").trigger('click');
				window.close();
			}	
		}); //getJSON
		
		
		
	});
	
});
