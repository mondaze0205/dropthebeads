<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header2</title>
</head>
<style>
@font-face {
	font-family: 'DungGeunMo';
	src: url("/font/DungGeunMo.ttf") format("truetype");
}	

header {
	height: 100px;
	width: 1280px;
	display: flex;
	margin: 0px auto;
	padding: 0px;
}

.head_main {
	height: 100px;
	line-height: 100px;
}

.head_main a {
	text-decoration: none;
	outline: none;
	color: black;
	font-size: 60px;
	font-weight: normal;
	font-family: "DungGeunMo";
	margin: 0px;
}

.head_main a:visited {
	color: black;
}

.head_space {
	margin: 0px auto;
}

.head_menu {
	display: flex;
}

.head_menu a {
	text-decoration: none;
	outline: none;
	color: black;
}

.head_menu a:visited {
	color: black;
}

.head_item {
	margin:5px 0px 0px 12px;
}

nav {
	width: 100%;
	height: 50px;
	background-color: palegreen;
	display: grid;
	grid-template-areas:
	"left center right";
	grid-template-columns: auto 1280px auto;
}

nav a {
	text-decoration: none;
	outline: none;
	color: black;
}

nav a:visited {
	color: black;
}

.nav_left {
	grid-area: left;
}

.nav_right {
	grid-area: right;
}

.nav_cen {
	grid-area: center;
	display: flex;
}

.nav_cen > * {
	height: 50px;
	line-height: 50px;
}

.nav_item {
	margin: 0px;
	font-family: "DungGeunMo";
	font-size: 20pt;
	margin-right: 17px;	
}

.nav_space {
	flex-grow: 1;
	background-color: palegreen;
}

.hidearea {
	display: none;
}
</style>
<body>
<header>
	<div class="head_main">
		<a href="/">Project 5031</a>
	</div>
	<div class="head_space"></div>
	<div class="head_menu">
		<div class="head_item when_logoff">
			<a href="/login">로그인</a>
		</div>
		<div class="head_item when_logoff">
			<a href="/join">회원가입</a>
		</div>
		<div class="head_item when_logon">
			<a href="#">${user.userid}님 환영합니다.</a>
		</div>
		<div class="head_item when_logon">
			<a href="/logout">로그아웃</a>
		</div>
		<div class="head_item when_logon">
			<a href="/mypage/temp2">마이페이지</a>
		</div>
		<div class="head_item">
			<a href="/admin/office">관리자 메뉴</a>
		</div>
	</div>
</header>
<nav>
	<div class="nav_left"></div>
	<div class="nav_cen">
		<div class="nav_item"><a href="/painter/painter">그림판</a></div>
		<div class="nav_item"><a href="/flea/flist">당근시장</a></div>
		<div class="nav_item"><a href="/board/list">커뮤니티</a></div>
		<div class="nav_space"></div>
	</div>
	<div class="nav_right"></div>
</nav>
<div class="hidearea">
	<input type="hidden" id="login_userid" value="${user.userid}">
	<input type="hidden" id="login_nickname" value="${user.nickname}">		
</div>
<script>
	if (document.getElementById("login_userid").value == "") {
		var es = document.getElementsByClassName('when_logon')
		for (var e of es) {
			e.style.display = "none";
		}
		
	} else {
		var es = document.getElementsByClassName('when_logoff')
		for (var e of es) {
			e.style.display = "none";
		}
	}
</script>
</body>
</html>