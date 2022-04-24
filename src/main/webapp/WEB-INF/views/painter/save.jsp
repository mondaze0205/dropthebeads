<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그림 저장하기</title>
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

<style>
body{
	margin-top: 50px;
}
input{
	width: 100%;
	height: 30px;
	box-sizing: border-box;
	margin: 0px;
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom: 2px solid #00af79;	
}
table{
	margin:auto; 
	border-spacing: 10px;
 	border-collapse: separate;
}
input:focus {
	outline: none;	
}
input:hover {
	border-left-width: 0;
	border-right-width: 0;
	border-top-width: 0;
	border-bottom: 2px solid #Fed354;		
}
button {
	font-family: 'Roboto', sans-serif;	
	width: 150px;
	height: 30px;
	box-sizing: border-box;
	background-color: #00af79;
	border:0;
	border-radius: 100px;
	color: white;
	cursor: pointer;
	margin: auto;
	display: block;
	padding: 0px;
}
button:hover{
	background-color: #Fed354;
	color: #00af79;	
}
</style>
</head>
<body>
<table>
	<tr><td>그림 코드</td>
		 <td><input type="text" id="picid" readonly></td></tr>
	<tr><td>이름</td> 
		<td><input type="text" id="picname"></td></tr>
</table>


<button type="button" id="saveold">저장하기</button>
<button type="button" id="saveas">새로운 번호로 저장</button>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/painter/save.js"></script>
</body>
</html>