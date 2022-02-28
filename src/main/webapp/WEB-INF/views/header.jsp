<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<title>header</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">

<style>
#nav {
	height: 220px;
	width: 100%;
	display: flex;
	overflow: hidden;
	position: relative;
	background-image: url("image/title3.png");
	margin: 0;
	padding: 0;
}
.container-xxl a {
	font-family: 'Dongle', sans-serif;
}
#title {
	font-size: 64px;
}
.nav-item {
	font-size: 40px;
}
</style>
</head>
<body>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<!-- 컨테이너 -->
<div class="container-xxl" id='header'>
	<div style="float: right;">
		<a href="join">회원가입</a>
		<a href="login">로그인</a>
		<a href="#">관리자메뉴</a>
	</div>
	<!-- 네이게이션바 -->
 	<nav id="nav" class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-bt"> 
	  <!-- 로고(?) -->
	    <a id="title" class="navbar-brand" href="/">Project5031</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="/">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/painter/painter">그림판</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/flea/flist">벼룩시장</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/board/list">커뮤니티</a>
	        </li>
	      </ul>
	  </div>
	 </div>
 	</nav>
</div> 
</body>
</html>