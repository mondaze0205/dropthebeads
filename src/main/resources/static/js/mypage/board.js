$(function(){
	var master = document.getElementById("master").value
	var un = document.getElementById("login_userid").value

	if(master != un) {
		$(".hr").css('display', 'none');
		$(".myinfo").css('display', 'none');
		$(".withdraw").css('display', 'none');
	}
})

$(".menu").click(function(){
	var master = document.getElementById("master").value
	
	location.href = "/mypage/" + master + "/" + this.id
	
})

$(".t1").click(function(){
	location.href = '/board/content/' + this.id;
})
