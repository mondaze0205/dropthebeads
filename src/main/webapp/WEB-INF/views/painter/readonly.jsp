<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>readonly.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/painter/readonly.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="hidearea">
	<textarea id='s'>${s}</textarea>
	<textarea id="code" readonly></textarea>
	<input type="hidden" id="picname" value="" readonly>
	<input type="hidden" id="pictureid" value="" readonly>
</div>
<div class="container">
	<div class="readonlypage">
		<h1>읽기 전용 페이지입니다.</h1>
		<h1 id="report" class="report">신고하기</h1>
	</div>
	<div class="canvas">
		<table class="pixel-canvas"></table>
		<br>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/painter/readonly.js"></script>
</html>