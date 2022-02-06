<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그림 저장하기</title>
</head>
<body>
그림 코드 : <input type="text" id="picid" readonly>
<br>
이름 : <input type="text" id="picname">
<br>
<button type="button" id="saveold">저장하기</button>
<button type="button" id="saveas">새로운 번호로 저장</button>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/paintname.js"></script>
</body>
</html>