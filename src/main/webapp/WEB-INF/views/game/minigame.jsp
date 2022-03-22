<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html onclick="jump()">
<head>
<meta charset="UTF-8">
<title>MINI GAME :D</title>
<link rel="stylesheet" type="text/css" href="/css/game/game.css">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">
<body>
	<div id="game">
		<div id="rabbit"></div>
		<div id="carrot"></div>
	</div>
	<h1 id="score">0</h1>
	<button class="button">GAME START</button>
<script src="/js/game/game.js"></script>
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>