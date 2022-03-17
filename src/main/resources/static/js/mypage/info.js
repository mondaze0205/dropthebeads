$(function() {

	var master = document.getElementById("master").value
	var un = document.getElementById("login_userid").value

	if (master != un) {
		history.back();
		alert("올바르지 않은 접근입니다.");
	}

	var l_birth = document.getElementById("birth").value.split(".");
	var l_year = l_birth[0];
	var l_month = l_birth[1];
	var l_day = l_birth[2];

	document.getElementById("year").value = l_year;
	document.getElementById("month").value = l_month;
	document.getElementById("day").value = l_day;

	var l_address = document.getElementById("address").value.split("_");

	if (l_address[0]) {
		document.getElementById("address_1").value = l_address[0];
	}
	if (l_address[1]) {
		document.getElementById("address_2").value = l_address[1];
	}

})

$("#pw1").keyup(function() {

	var pw = $("#pw1").val();
	var userid = $("#login_userid").val()
	var num = pw.search(/[0-9]/g);
	var eng = pw.search(/[a-z]/ig);
	var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	$("#pw1_check").attr('value', '0');
	$("#pw2_check").attr('value', '0');
	document.getElementById("pw3").value = "";

	if (!pw) {
		document.getElementById("pw_msg1").innerHTML = "비밀번호를 입력해주세요."
		return false;
	}
	else if (pw.length < 8 || pw.length > 20) {
		document.getElementById("pw_msg1").innerHTML = "8자리~20자리 이내로 입력해주세요."
		return false;
	}
	else if (num < 0 || eng < 0 || spe < 0) {
		document.getElementById("pw_msg1").innerHTML = "영문,숫자,특수문자를 혼합하여 입력해주세요."
		return false;
	}

	$.ajax({
		url: "/mypage2/pwCheck",
		type: "post",
		data: { "pw": pw, "userid": userid },
		datatype: "text"
	}) //.ajax

		.done(function(data) {
			if (data == "o") {
				document.getElementById("pw_msg1").innerHTML = "기존 비밀번호와 동일합니다. 변경해주세요."
				return false;
			} else {
				document.getElementById("pw_msg1").innerHTML = "사용 가능한 비밀번호입니다."
				$("#pw1_check").attr('value', '1');
				return true;
			}
		})//.done

})//.focusout

$("#pw2").keyup(function() {
	let pw2 = $("#pw2").val();
	if (!pw2) {
		document.getElementById("pw_msg2").innerHTML = "비밀번호를 다시 입력해주세요."
		return false;
	}

	let pw1 = $("#pw1").val();
	if (pw1 == pw2) {
		document.getElementById("pw_msg2").innerHTML = "일치합니다."
		document.getElementById("pw3").value = document.getElementById("pw2").value
		$("#pw2_check").attr('value', '1');
	} else {
		document.getElementById("pw_msg2").innerHTML = "비밀번호가 다릅니다."
	}
})

$("#nickname1").keyup(function() {
	$("#nn2_check").attr('value', '0');
	document.getElementById("nn_msg").innerHTML = "중복검사가 필요합니다."
})

$("#nn_check").click(function() {

	let nickname = $("#nickname1").val(); //검사할 값을 꺼내온다
	if (!nickname) {
		document.getElementById("nn_msg").innerHTML = "닉네임를 입력하세요." //중복될 경우 보낼 메세지
		return false;
	}//유효성 검사

	var userid = $("#login_userid").val()

	$.ajax({
		url: "/mypage2/nnCheck2",
		type: "get",
		data: { "nickname": nickname, "userid": userid },
		datatype: "text"
	}) //ajax
		.done(function(data) {
			if (data == "1") {
				document.getElementById("nn_msg").innerHTML = "기존 닉네임을 사용합니다."
				$("#nn2_check").attr('value', '1');
			}
			else {
				$.ajax({
					url: "/mypage2/nnCheck",
					data: { "nickname": nickname },
					datatype: "text"
				}) //.ajax

					.done(function(data) { //검사한 data 받아오기
						if (data == "") {
							document.getElementById("nn_msg").innerHTML = "사용 가능한 닉네임입니다." //중복될 경우 보낼 메세지
							$("#nn2_check").attr('value', '1');
						} else {
							$("#nn_msg").html("이미 사용중인 닉네임 입니다.")
						}
					}) //done
			}
		})//.done
});//click

$("#year").keyup(function() {
	$("#bir_check").attr('value', '0');
})

$("#birthbtn").click(function() {
	var birth = document.getElementById("year").value + document.getElementById("month").value + document.getElementById("day").value;
	document.getElementById("birth").value = birth;
	if (document.getElementById("birth").value.length == 8) {
		$("#bir_check").attr('value', '1');
	}
});

$("#year").focusout(function() {
	var year = $(this).val();
	if (year.length != 4) {
		alert("생년은 4자리로 입력해주세요");
	}
})

$("#email").keyup(function() {
	$("#mail_check").attr('value', '0');
	$("#email_msg").html("이메일 인증이 필요합니다.")
})


$("#mail_ck").click(function() {

	let email = $("#email").val();

	if (!email) {
		$("#email_msg").html("메일 주소를 입력하세요.");
		$("#email").focus();
		return false;
	}

	var userid = $("#login_userid").val()

	$.ajax({
		url: "/mypage2/mailCheck",
		type: "get",
		data: { "email": email, "userid": userid },
		datatype: "text"
	}) //ajax
		.done(function(data) {
			if (data == "2") {
				document.getElementById("email_msg").innerHTML = "기존 이메일 주소를 사용합니다. (인증 불필요)"
				$("#mail_check").attr('value', '1');
			}
			else {
				$.ajax({
					url: "/send",
					data: {
						emailAddress: email
					},
					datatype: "json",
					success: function(data) {
						if (eval(data[1])) {
							num = data[0];
							$("#email_msg").html("메일이 발송되었습니다. 인증번호를 입력해주세요.");
						}
					},
					error: function() { alert('error'); }
				});
					
			}//else
		})//done
}) //mail ck


$("#ck_b").click(function() {
	let ck_num = $("#ck_num").val();
	if (ck_num == num) {
		$("#email_msg").html("인증되었습니다.");
		$("#mail_check").attr('value', '1');
		$("#email").attr('readonly', 'true');
		$("#mail_ck").attr('disabled', 'true');
		$("#ck_num").attr('disabled', 'true');
		$("#ck_b").attr('disabled', 'true');
	} else {
		$("#email_msg").html("인증번호가 틀립니다.");
	}
})

$("#addbtn").click(function() {
	new daum.Postcode({
		oncomplete: function(data) {
			document.querySelector("#address_1").value = data.address;
			alert("나머지 주소도 입력하세요.");
			$("#address_2").focus();
		}
	}).open();
})

$("#addressbtn").click(function() {
	var address = document.getElementById("address_1").value + "_" + document.getElementById("address_2").value;
	document.getElementById("address").value = address;
});

$("#up_submit").click(function() {
	var form = document.update_form;
	$("#birthbtn").trigger('click');
	$("#addressbtn").trigger('click');

	if (document.getElementById("pw1_check").value != 1) {
		$("#pw1").focus();
		return false;
	}

	if (document.getElementById("pw2_check").value != 1) {
		$("#pw2").focus();
		return false;
	}

	if (document.getElementById("nn2_check").value != 1) {
		$("#nickname1").focus();
		return false;
	}

	if (document.getElementById("bir_check").value != 1) {
		$("#year").focus();
		return false;
	}

	if (document.getElementById("mail_check").value != 1) {
		$("#email").focus();
		return false;
	}


	alert("회원정보를 수정하였습니다. 다시 로그인해 주세요.")
	form.submit();


})

$("#up_cancel").click(function() {
	history.back();
})

