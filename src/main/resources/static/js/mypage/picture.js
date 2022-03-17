$(".menu").click(function(){
	var master = document.getElementById("master").value
	location.href = "/mypage/" + master + "/" + this.id
})

$(".t1").click(function(){
	location.href = '/painter/readonly/' + this.id;
})
