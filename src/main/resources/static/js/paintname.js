$(function(){    
	
	document.getElementById('picid').value = opener.document.getElementById('pic_id').value;
	document.getElementById('picname').value = opener.document.getElementById('pic_name').value;
	window.opener.$("#code").empty();
	
	if(document.getElementById('picid').value == "새 그림") {
		$("#saveold").css("display", "none");
	}
	
	$("#saveold").click(function(){
		opener.document.getElementById('pic_id').value = document.getElementById('picid').value;
		opener.document.getElementById('pic_name').value = document.getElementById('picname').value;
		window.opener.$("#save").trigger('click');
		window.close();
	});
	
	$("#saveas").click(function(){
		opener.document.getElementById('pic_id').value = "new";
		opener.document.getElementById('pic_name').value = document.getElementById('picname').value;
		window.opener.$("#save").trigger('click');
		window.close();
	});
});
