<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>DROP THE BEADS</title>
<link rel="stylesheet" type="text/css" href="/css/index.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>
<body>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>


<!-- slider -->

<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 4</div>
  <img src="/image/back4.jpg" style="width:100%">
  <div class="text">
    <h1>Everything about beads!</h1>
  	<p>비즈에 관한 모든것! 드랍 더 비즈 커뮤니티에 오신것을 환영합니다.</p>
  	<br>
  	<a href="join" class="gobtn" id="writebtn">가입하기 <i class="fa-solid fa-arrow-right"></i></a>  
  </div>
</div>
<div class="mySlides fade">
  <div class="numbertext">2 / 4</div>
  <img src="/image/back7.jpg" style="width:100%">
  <div class="text">
    <h1>BEADS FLEA MARKET</h1>
  	<p>남은 비즈 이제는 버리지 마세요! 오직 비즈만을 위한 벼룩시장!</p>
  	<br>
  	<a href="flea/flist" class="gobtn2" id="writebtn">바로가기 <i class="fa-solid fa-arrow-right"></i></a>
  </div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 4</div>
  <img src="/image/back8.jpg" style="width:100%">
  <div class="text">
    <h1>BEADS COMMUNITY</h1>
  	<p>드랍 더 비즈 회원만의 자유게시판! 비즈에 대한 이야기를 공유해보세요.</p>
  	<br>
  	<a href="board/list" class="gobtn2" id="writebtn">바로가기 <i class="fa-solid fa-arrow-right"></i></a>
  </div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 4</div>
  <img src="/image/gameban.jpg" style="width:100%">
  <div class="text">
  	<h1>MINI GAME OPEN!</h1>
  	<p>황금 당근을 잡아라! 당근잡기 미니게임 도전하세요!</p>
  	<br>
  	<a href="game/minigame" class="gobtn" id="writebtn">바로가기 <i class="fa-solid fa-arrow-right"></i></a>  
  </div>
</div>


<!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>

<div style="visibility: hidden;">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html>

