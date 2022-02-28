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
<jsp:include page="../header2.jsp"></jsp:include>
<div class="">
	<textarea id='s'>${s}</textarea>
	<textarea id="code" readonly>123123</textarea>
	<input type="text" id="pictureid" value="" readonly>
	<input type="text" id="nickname" value="" readonly>
</div>
	<div class="canvas">
		<table class="pixel-canvas"></table>
		<br>
	</div>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/painter/readonly.js"></script>
</html>