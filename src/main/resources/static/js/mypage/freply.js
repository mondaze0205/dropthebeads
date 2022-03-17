$(".menu").click(function(){
	var master = document.getElementById("master").value
	
	location.href = "/mypage/" + master + "/" + this.id
	
})

$(".t1").click(function(){
	
	var postid = this.id
	
	$.ajax({
		url:"/mypage2/checkpost2", 
		type:"get",
		data: {
			f_postno:postid
		},	
		datatype:"text",
		success : function(data){
			if(data == "0") {
				alert('삭제된 글입니다.')
			} else {
				location.href = '/flea/fcontent/' + postid;
			}
		},
		error : function(){alert('error');}		
	});
	
})