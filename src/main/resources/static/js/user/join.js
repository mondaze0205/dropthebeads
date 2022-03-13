function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            document.querySelector("#address_1").value = data.address;
            alert("나머지 주소도 입력하세요.");
            $("#address_2").focus();
        }
    }).open();
}  	

$(function(){
	
	let num ="";
	
	if(document.getElementById("birth").value != "") {
		var lyear = document.getElementById("birth").value.substr(0, 4);
		var lmonth = document.getElementById("birth").value.substr(4, 2);
		var lday = document.getElementById("birth").value.substr(6, 2);
		
		$("#year").attr('value', lyear);
		$("#month").val(lmonth).prop("selected", true);
		$("#day").val(lday).prop("selected", true);
		
	}
	
	if(document.getElementById("address").value != "") {
		var addss = document.getElementById("address").value.split("_");
		
		$("#address_1").attr('value', addss[0]);
		$("#address_2").attr('value', addss[1]);
	
	}
	
	$("#userid").focusout(function(){
		let userid = $("#userid").val();
		if(!userid){
			$("#id_msg").html("영문 소문자와 숫자만 사용 가능합니다.")
			return false;
		}
		$.ajax({url:"/idCheck", data:"userid="+userid, datatype:"text"}
		).done(function(data){
			if(data == ""){
				$("#id_msg").html("사용할 수 있는 아이디 입니다.");
				$("#id_check").attr('value', '1');
			} else {
				$("#id_msg").html("이미 사용중인 아이디 입니다.");
				$("#id_check").attr('value', '0');
				$("#userid").css("background-color", "lightgray");
				document.getElementById("userid").focus();
			}
		})
	});
	
	$("#userid").keydown(function(){
		$(this).css("background-color", "white");
	})
	
    $('#pw1').focusout(function(){
		if($('#pw').val() == "" || $('#pw1').val() == "") {
			$('#pw_msg').html('영문 소문자와 숫자, 특수기호만 사용 가능합니다.');
			return false;
		}
        if($('#pw').val() != $('#pw1').val()){
          $('#pw_msg').html('비밀번호가 일치하지 않습니다.');
          $("#pw_check").attr('value', '0');
        } else{
          $('#pw_msg').html('비밀번호가 일치합니다.');
          $("#pw_check").attr('value', '1');
        }
    });
	
	$("#nickname").focusout(function(){
		let nickname = $("#nickname").val();
		if(!nickname){
			$("#nick_msg").html("닉네임을 입력하세요.")
			return false;
		}
		$.ajax({url:"/nickCheck", data:"nickname="+nickname, datatype:"text"}
		).done(function(data){
			if(data == ""){
				$("#nick_msg").html("사용할 수 있는 닉네임입니다.");
				$("#nick_check").attr('value', '1');
			}else{
				$("#nick_msg").html("사용중인 닉네임입니다.");
				$("#nick_check").attr('value', '0');
				$("#nickname").css("background-color", "lightgray");
			}
		})
	})
	
	$("#nickname").keydown(function(){
		$(this).css("background-color", "white");
	})
	
	$("#year").focusout(function(){
		var year = $(this).val();
		if(year.length != 4 && year != "") {
			document.getElementById("year").focus();
			$(this).css("background-color", "lightgray");
		}
	})
		
	$("#year").keydown(function(){
		$(this).css("background-color", "white");
	})	
			
	$("#birthbtn").click(function(){
		var birth = document.getElementById("year").value + document.getElementById("month").value + document.getElementById("day").value;
		document.getElementById("birth").value = birth;
	})		
		
	$("#addressbtn").click(function(){
		var address = document.getElementById("address_1").value + "_" + document.getElementById("address_2").value;
		document.getElementById("address").value = address;
	})		
		
	$("#mail_ck").click(function(){
		let email = $("#email").val();
		if(!email){
			$("#email_msg").html("메일 주소를 입력하세요.");
			$("#email").focus();
			return false;
		} 
		$.ajax({
			url:"/send",
			data:"emailAddress="+email,
			dataType:"json"
			}).done(function(data){
				if(eval(data[1])){
					num = data[0];
					$("#email_msg").html("메일이 발송되었습니다. 인증번호를 입력해주세요.");
				}
			}); 
	}) //mail ck
		
	$("#ck_b").click(function(){
		let ck_num = $("#ck_num").val();
		if(ck_num == num){
			$("#email_msg").html("인증되었습니다.");
			$("#mail_check").attr('value', '1');
			$("#email").attr('readonly', 'true');
			$("#mail_ck").attr('disabled', 'true');
			$("#ck_num").attr('disabled', 'true');
			$("#ck_b").attr('disabled', 'true');
		} else {
			$("#email_msg").html("인증번호가 틀립니다.");
		}
	}); //메일 확인 (인증)
		
	$("#submit_btn").click(function() {
		
		var form = document.getElementById("join_form");
	
		if(document.getElementById("id_check").value != 1) {
			$("#userid").focus();
			return false;
		}
		
		if(document.getElementById("pw_check").value != 1) {
			$("#pw1").focus();
			return false;
		}
		
		if(document.getElementById("nick_check").value != 1) {
			$("#nickname").focus();
			return false;
		}
		
		if(document.getElementById("mail_check").value != 1) {
			$("#email").focus();
			return false;
		}
		
		$.ajax({
			url: '/VerifyRecaptcha',
			type: 'post',
			data: {
				recaptcha: $("#g-recaptcha-response").val()
			},
            success: function(data) {
				if(data == 0){
					$("#recapcha_msg").html("인증되었습니다.");              
 					$("#birthbtn").trigger('click');
 					$("#addressbtn").trigger('click');
 					form.submit();
 				} else if(data==1){
					$("#recapcha_msg").html("테스트 통과가 필요합니다."); 
					$(this).css("font-weight", "bold");
				} else {                      
					alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
				}
			}
		}) //ajax
		
	}); //test btn click	
	
	$("#cancel_btn").click(function() {
		history.back();
	});
	
});
