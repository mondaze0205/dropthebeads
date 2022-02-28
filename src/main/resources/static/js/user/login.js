$(function(){
	
	$("#loginbtn").click(function(){
		var form = document.getElementById("loginform");
		form.submit();
	})
	
	$("#o_join").click(function(){
		location.href = "/join";
	})
	
	$("#o_findid").click(function(){
		window.open("/findid", "아이디찾기", "width=600, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
	})
	
	$("#o_findpw").click(function(){
		window.open("/findpw", "비번찾기", "width=600, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
	})
	
})
