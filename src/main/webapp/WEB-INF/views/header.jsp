<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>header</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Raleway:wght@300;400;500&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
<!-- 헤더 1 -->
<nav class="navbar-01">
	<ul class ="navbar_menu">
		<li class="logoff">
			<a href="/join">회원가입</a>
		</li>
		<li class="logoff">
			<a href="/login">로그인</a>
		</li>
		<li class="logon">
			<a href="#">${user.userid}님 환영합니다 <i class="fa-solid fa-face-grin-wink"></i></a>
		</li>
		<li class="logon">
			<a href="/logout">로그아웃</a>
		</li>
		<li class="logon">
			<a href="/mypage/${user.userid}">마이페이지</a>
		</li>
		<li id="admin">
			<a href="/admin/office">관리자메뉴</a>
		</li>
	</ul>
</nav>

<!-- 헤더 2 -->
<nav class="navbar-02">
	<div class="navbar_logo">
    	<a href="http://localhost:8087/"><img class="logo" src="/image/Drop.gif" width="300px" height="auto"/></a>
	</div>
	
	<ul class="navbar_menu02">
		<li><a href="/painter/painter">PAINTER</a></li>
		<li><a href="/flea/flist">FLEA MARKET</a></li>
		<li><a href="/board/list">COMMUNITY</a></li>
		<li><a href="/game/carrotgame">GAMES</a></li>
	</ul>
</nav>

<div class="hidearea">
	<input type="hidden" id="login_userid" value="${user.userid}">
	<input type="hidden" id="login_nickname" value="${user.nickname}">		
</div>

<script>
	if (document.getElementById("login_userid").value == "") {
		var es = document.getElementsByClassName('logon')
		for (var e of es) {
			e.style.display = "none";
		}
		
	} else {
		var es = document.getElementsByClassName('logoff')
		for (var e of es) {
			e.style.display = "none";
		}
	}
	
	if (document.getElementById("login_userid").value != "dulgi") {
		var admin = document.getElementById("admin")
		admin.style.display = "none"
	}
</script>
</body>
</html>