$(function(){    
	
	window.opener.$("#h_code").empty();
	
	$("#loadpic").click(function(){
		
		var pictureid = document.getElementById('picid').value;
		
		$.getJSON("/painter/paintLoad2",{"pictureid":pictureid},function(data){
			var code = data.code;
			var picid = data.pictureid;
			var picname = data.picname;
			if (code == "none") {
				alert('없는 번호입니다.')
			} else {
				opener.document.getElementById("h_code").value = code;
				opener.document.getElementById("pictureid").value = picid;
				opener.document.getElementById("h_name").value = picname;
				window.opener.$("#h_copy").trigger('click');
				window.close();
			}	
		}); //getJSON
		
		
		
	});
	
});


