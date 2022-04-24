<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	display: flex;
	flex-direction: column;
	align-items: center;
}
textarea {
	width: 350px;
	height: 300px;
	align: center;
}
button {
	border-radius: 8px;
	padding: 0px;
	margin: 10px;
  	font-size: 14px;
  	width: 90px;
	height:	40px;
	border: 2px solid #00af79;
	border-radius: 100px;
    box-sizing: border-box;
}
</style>
</head>
<body>
<div class="container">
	<input type="text" id="code" style="display:none">
	<textarea id="n"></textarea>
	<button type="button" class="button" onclick="javascript:self.close();">확인</button>
</div>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/painter/each.js"></script>
</html>