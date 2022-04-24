$("#withdrawbtn").click(function() {

	if (document.getElementById('check').value != "회원탈퇴") {
		alert(document.getElementById('check').value)
		return false;
	} else {
		var userid = document.getElementById('userid').value
		var pw = document.getElementById('pw').value
		$.ajax({
			url: "/mypage2/withdraw",
			type: "post",
			data: {
				userid:userid,
				pw:pw
			},
			datatype: "text",
			success: function(data) {
				if (data == "O") {
					alert('그동안 DROP THE BEADS를 찾아주셔서 감사합니다.')
					location.href = '/logout';
				} else {
					alert('비밀번호가 맞지 않습니다.')
					return false;
				}
			},
			error: function() { alert('error'); }
		});
	}
})

$("#cancelbtn").click(function() {
	history.back();
})