<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그림 불러오기</title>
<link rel="stylesheet" type="text/css" href="/css/painter/load.css">
</head>
<body>
<div class="container">

	<div class="picpick">
		<h4>내가 그린 그림</h4>
		<select id="picselect" onchange="change()">
			<option>비회원입니다</option>
		</select>
		<h4>번호로 불러오기</h4>
		<input type="text" id="picid">
		<button type="button" id="pickbtn">불러오기</button>
	</div>
	<div class="picinfo">
		<h5>번호 : </h5>
		<h5>작가 : </h5>
		<h5>제목 : </h5>
	</div>
	<div class="preview">
		<div class="canvas">
			<table class="pixel-canvas"></table>
		</div>
	</div>
	<div class="buttons">
		<div class="hidearea">
			<textarea id="h_code" readonly></textarea>
			<input type="text" id="h_name" readonly>
			<input type="text" id="h_picid" readonly>
			<input type="text" id="h_userid" readonly>
			<button type="button" id="h_copy">복사</button>
		</div>
		<div class="h1">
		<h1>※ 다른 이용자들의 그림은 읽기만 가능합니다</h1>
		</div>
		<div class="makespace"></div>
		<div>
		<button type="button" id="loadbtn">확인</button>
		<button type="button" id="cancelbtn">취소</button>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/painter/load.js"></script>
</body>
</html>