$("#allbtn").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('r');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#bestbtn").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.set('r','1');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#p0").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.delete('h');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#p1").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.set('h', '1');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#p2").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.set('h', '2');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#p3").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.set('h', '3');
	window.location = window.location.pathname + "?" + params.toString();

})

$("#p4").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	params.set('h', '4');
	window.location = window.location.pathname + "?" + params.toString();
})

$("#searchbtn").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	
	if(document.getElementById("searchword").value == "") {
		alert('검색어를 입력해주세요.')
		return false();
	}
	
	params.set('t', document.getElementById("searchtype").value);
	params.set('w', document.getElementById("searchword").value);
	window.location = window.location.pathname + "?" + params.toString();
})

$("#searchbtnx").click(function(){
	var url = window.location;
	var params = new URLSearchParams(url.search.slice(1));
	
	params.delete('t');
	params.delete('w');
	window.location = window.location.pathname + "?" + params.toString();
})