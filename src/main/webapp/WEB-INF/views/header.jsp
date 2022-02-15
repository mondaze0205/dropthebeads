<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>

<html>
		<head>
		<title>header</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		</head>
		<body>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<!-- 컨테이너 -->
<div class="container-xxl">
	<div style="float: right;">
		<a href="#">회원가입</a>
		<a href="#">로그인</a>
		<a href="#">관리자메뉴</a>
	</div>
	<!-- 네이게이션바 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <!-- 로고(?) -->
	  <div class="container-xxl">
	    <a class="navbar-brand" href="/"><h1>Project5031</h1></a>
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
	          <a class="nav-link" href="flea/flist">벼룩시장</a>
	        </li>
	        <li class="nav-item dropdown">
          	  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            커뮤니티
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="/board/list?h=1">공지</a></li>
	            <li><a class="dropdown-item" href="board/list?h=2">자랑</a></li>
	            <li><a class="dropdown-item" href="/board/list?h=3">리뷰</a></li>
	            <li><a class="dropdown-item" href="/board/list?h=4">질문</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div>
	  </div>
	</nav>
</div>
</body>
</html>