$(function() {

	var master = document.getElementById("master").value
	var un = document.getElementById("login_userid").value

	if (master != un) {
		history.back();
		alert("올바르지 않은 접근입니다.");
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

	alert("비밀번호를 수정하였습니다. 다시 로그인해 주세요.")
	//return false;
	form.submit();

})

$("#up_cancel").click(function() {
	history.back();
})

