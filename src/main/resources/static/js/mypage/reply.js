$(".menu").click(function(){
	var master = document.getElementById("master").value
	
	location.href = "/mypage/" + master + "/" + this.id
	
})

$(".t1").click(function(){
	
	var postid = this.id
	
	$.ajax({
		url:"/mypage2/checkpost", 
		type:"get",
		data: {
			postid:postid
		},	
		datatype:"text",
		success : function(data){
			if(data == "0") {
				alert('삭제된 글입니다.')
			} else {
				location.href = '/board/content/' + postid;
			}
		},
		error : function(){alert('error');}		
	});
	
})