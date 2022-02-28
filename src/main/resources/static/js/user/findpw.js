$(function(){
$("#pwBtn").click(function(){
	
	
	let userid = $("#userid").val();
	let email= $("#email").val();
	if(!email){
			$("#email_msg").html("메일 주소를 입력하세요.");
			$("#email").focus();
			return false;
	}else if  (!userid){
			$("#email_msg").html("아이디를 입력하세요.");
			$("#userid").focus();
			return false;}
	var pwdata1 = "userid="+userid+"&email="+email;	
		$.ajax({
			type:"GET",
			url:"/findsearchpw",
			data: pwdata1,
			}).done(function(data){
				if(data == 0){
					alert("회원가입시 작성한 아이디와 이메일을 작성해주세요.")
				}else if (data==1){
			var pwdata2 = "userid="+userid+"&emailid="+email;	
			$.ajax({
				type:"GET",
				url:"/findpwaction",
				data: pwdata2,
			}).done(function(data){
				if(eval(data[1])){
					num = data[0];
					alert("임시비밀번호를 전송하였습니다. 이에밀을 확인하세요.")
				}
			}); 
				}
			}); 
			
	}) //mail ck
})		