$(function(){
	var back = document.getElementById("back");
	if(back) {
		alert('마지막 페이지입니다.')
		history.back();
	}
})
	
$(".warnbtn").click(function() {
	
	var v = this.id;
	var userid = v.split("_")[1];
	alert(userid);
	
	$.ajax({
		url: "/admin/warn",
		type: "post",
		data: {
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

$(".purgebtn").click(function() {
	
	var v = this.id;
	var userid = v.split("_")[1];
	
	$.ajax({
		url: "/admin/purge",
		type: "post",
		data: {
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

$("#order_name").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('p');
	params.set('o','0');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#order_warn").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('p');
	params.set('o','1');
	window.location = window.location.pathname + "?" + params.toString();
})

$(".before").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('p');
	window.location = window.location.pathname + "?" + params.toString() + "&" + this.id;
})


$(".pages").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('p');
	window.location = window.location.pathname + "?" + params.toString() + "&" + this.id;
})

$(".next").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('p');
	window.location = window.location.pathname + "?" + params.toString() + "&" + this.id;
})
