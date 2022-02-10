$(".c_head_s").click(function(){
	$(".c_head_s").css("background-color", "transparent")
	$(".c_head_s").css("font-weight", "normal")
	$(this).css("background-color", "lightblue");
	$(this).css("font-weight", "bold");
	document.getElementById("head").value = this.id
});

$("#loadbtn").click(function(){
	window.open("paintLoadAtWrite", "그림 불러오기", "width=400, height=300, directories=no, fullscreen=no, status=no, menubar=no, resizable=no, scrollorbars=no, toolbar=no, location=no");
})


$("#submitbtn").click(function(){
	document.getElementById("title").value = document.getElementById("dummyid").value
	document.writeform.submit();
})


$("#cancelbtn").click(function(){
	history.back();
})