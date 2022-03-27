$(".reporters").click(function() {
	var path = this.innerHTML;

	$.ajax({
		url: "/admin/reporters",
		type: "post",
		data: {
			path: path
		},
		datatype: "text",
		success: function(data) { alert(data) },
		error: function() { alert('error'); }
	});

})

$(".repcon").click(function() {
	var id = this.id;
	var replyid = id.replace("repcon_", "");

	$.ajax({
		url: "/admin/findCon",
		type: "post",
		data: {
			replyid: replyid
		},
		datatype: "text",
		success: function(data) {

			$.ajax({
				url: "/mypage2/checkpost",
				type: "get",
				data: {
					postid: data
				},
				datatype: "text",
				success: function(data2) {
					if (data2 == "0") {
						alert('삭제된 글입니다.')
					} else {
						var url = "/board/content/" + data
						window.open(url)
					}
				},
				error: function() { alert('error'); }
			});
		},
		error: function() { alert('error'); }
	});

})

$(".done").click(function() {
	var m = this.id;
	var reportid = m.split("_")[0];
	var type = m.split("_")[1];
	var typeid = m.split("_")[2];
	var judge = document.getElementById('j_' + reportid).value;
	var userid = document.getElementById(reportid + '_reported').innerHTML;
	//var stack = document.getElementById(reportid + '_stack').innerHTML;

	$.ajax({
		url: "/admin/done",
		type: "post",
		data: {
			reportid: reportid,
			type: type,
			typeid: typeid,
			judge: judge,
			userid: userid
		},
		datatype: "text",
		success: function(data) {
			alert(data);
			location.replace(location.href);
		},
		error: function() { alert('error'); }
	});

})

$("#users").click(function() {
	location.href = '/admin/members';
})